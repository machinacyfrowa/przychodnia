<?php
require_once('./smarty/Smarty.class.php');
session_start();
$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'przychodnia');

$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

if(isset($_SESSION['userID'])) {
    //użytkownik jest zalogowany
    $smarty->assign('firstName', $_SESSION['firstName']);
}

if(isset($_REQUEST['action'])) {
    //zostało przekazane polecienie do apliakcji
    switch($_REQUEST['action']) {
        case 'login':
            $smarty->display('login.tpl');
        break;
        case 'processLogin':
            $query = $db->prepare("SELECT * FROM patient WHERE pesel = ? LIMIT 1");
            $query->bind_param("s", $_REQUEST['pesel']);
            $query->execute();
            $result = $query->get_result();
            if($result->num_rows == 0) {
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
                break;
            }
            $row = $result->fetch_assoc();
            if(password_verify($_REQUEST['password'], $row['password'])) {
                $_SESSION['userID'] = $row['id'];
                $_SESSION['firstName'] = $row['firstName'];
                $_SESSION['lastName'] = $row['lastName'];
                $smarty->assign('firstName', $_SESSION['firstName']);
                $smarty->display('index.tpl');
            } else {
                //hasło niepoprawne
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
            }
        break;
        case 'logout':
            session_destroy();
            header('Location: index.php');
        break;
        case 'register':
            $smarty->display('register.tpl');
        break;
        case 'processRegister':
            $query = $db->prepare("INSERT INTO patient (id, pesel, password, firstName, lastName) 
                                    VALUES (NULL, ?, ?, ?, ?)");
            $passwordHash = password_hash($_REQUEST['password'], PASSWORD_ARGON2I);
            $query->bind_param("ssss", $_REQUEST['pesel'], $passwordHash, $_REQUEST['firstName'], $_REQUEST['lastName']);
            $query->execute();
            if($query->errno == 1062) {
                //próba rejestracji an ten sam pesel
                $smarty->assign('error', "Istnieje już konto dla podanego numeru PESEL");
                $smarty->display('register.tpl');
            } else {
                $smarty->display('login.tpl');
            }
        break;
        case 'appointments':
            $query = $db->prepare("SELECT * FROM doctor");
            $query->execute();
            $result = $query->get_result();
            $doctors = array();
            while($row = $result->fetch_assoc()) {
                array_push($doctors, $row);
            }
            $smarty->assign('doctors', $doctors);
            $query = $db->prepare("SELECT *, appointment.id AS appointment_id FROM appointment 
                                    LEFT JOIN doctor ON doctor.id = appointment.doctor 
                                    LEFT JOIN room ON room.id = appointment.room 
                                    WHERE patient = ? ");
            $query->bind_param('i', $_SESSION['userID']);
            $query->execute();
            $appointments = array();
            $result = $query->get_result();
            while($row = $result->fetch_assoc()) {
                array_push($appointments, $row);
            }
            $smarty->assign('appointments', $appointments);
            $smarty->display('appointments.tpl');
        break;
        case 'findAppointment':
            $query = $db->prepare("SELECT *, appointment.id AS appointment_id FROM appointment 
                                    LEFT JOIN doctor ON doctor.id = appointment.doctor 
                                    LEFT JOIN room ON room.id = appointment.room 
                                    WHERE doctor = ? AND patient = 0 AND date > NOW()");
            $query->bind_param('i', $_REQUEST['doctor']);
            $query->execute();
            $result = $query->get_result();
            $appointments = array();
            while($row = $result->fetch_assoc()) {
                array_push($appointments, $row);
            }
            $smarty->assign('appointments', $appointments);
            $smarty->display('chooseAppointment.tpl');
        break;
        case 'bookAppointment':
            $query = $db->prepare("UPDATE appointment SET patient = ? WHERE id = ?");
            $query->bind_param("ii", $_SESSION['userID'], $_REQUEST['appointment_id']);
            $query->execute();
            header('Location: index.php?action=appointments');
        break;
        case 'clearAppointment':
            $query = $db->prepare("UPDATE appointment SET patient = 0 WHERE id = ?");
            $query->bind_param("i", $_REQUEST['appointment_id']);
            $query->execute();
            header('Location: index.php?action=appointments');
        break;
        default:
            $smarty->display('index.tpl');
        break;
    }
} else {
    $smarty->display('index.tpl');
}


?>