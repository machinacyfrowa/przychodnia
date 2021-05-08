<?php
require_once('./../smarty/Smarty.class.php');
session_start();
$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'przychodnia');

$smarty->setTemplateDir('./../templates/admin');
$smarty->setCompileDir('./../templates_c');
$smarty->setCacheDir('./../cache');
$smarty->setConfigDir('./../configs');

if(isset($_SESSION['login']))
    $smarty->assign('login', $_SESSION['login']);

if(isset($_REQUEST['action'])) {
    switch($_REQUEST['action']) {
        case 'processLogin':    
            $query = $db->prepare("SELECT * FROM admin WHERE login = ? LIMIT 1");
            $query->bind_param("s", $_REQUEST['login']);
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
                $_SESSION['login'] = $row['login'];
                $smarty->assign('login', $_SESSION['login']);
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
        case 'doctorList':
            $query = $db->prepare("SELECT * FROM doctor");
            $query->execute();
            $result = $query->get_result();
            $doctors = array();
            while($row = $result->fetch_assoc()) {
                array_push($doctors, $row);
            }
            $smarty->assign('doctors', $doctors);
            $smarty->display('doctors.tpl');
        break;
        case 'patientList':
            $query = $db->prepare("SELECT * FROM patient WHERE ID > 0");
            $query->execute();
            $result = $query->get_result();
            $patients = array();
            while($row = $result->fetch_assoc()) {
                array_push($patients, $row);
            }
            $smarty->assign('patients', $patients);
            $smarty->display('patients.tpl');
        break;
        case 'roomList':
            $query = $db->prepare("SELECT * FROM room");
            $query->execute();
            $result = $query->get_result();
            $rooms = array();
            while($row = $result->fetch_assoc()) {
                array_push($rooms, $row);
            }
            $smarty->assign('rooms', $rooms);
            $smarty->display('rooms.tpl');
        break;
        case 'generateAppointments':
            $query = $db->prepare("SELECT * FROM doctor");
            $query->execute();
            $result = $query->get_result();
            $doctors = array();
            while($row = $result->fetch_assoc()) {
                array_push($doctors, $row);
            }
            $smarty->assign('doctors', $doctors);
            $query = $db->prepare("SELECT * FROM room");
            $query->execute();
            $result = $query->get_result();
            $rooms = array();
            while($row = $result->fetch_assoc()) {
                array_push($rooms, $row);
            }
            $smarty->assign('rooms', $rooms);
            $smarty->display('generateAppointment.tpl');
        break;
        case 'addAppointments':
            $shiftStart = strtotime($_REQUEST['shiftStart']);
            $shiftEnd = strtotime($_REQUEST['shiftEnd']);
            $invervalSeconds = $_REQUEST['interval'] * 60;
            $currentTime = $shiftStart;
            $appointments = array();
            while($currentTime < $shiftEnd) {
                array_push($appointments, $currentTime);
                $currentTime += $invervalSeconds;
            }
            //var_dump($appointmets);
            foreach ($appointments as $appointment) {
                $query = $db->prepare("INSERT INTO appointment (id, date, patient, doctor, room)
                                                VALUES (NULL, FROM_UNIXTIME(?), 0, ?, ?)"); //pacjent "0" - pusty termin
                $query->bind_param('iii', $appointment, $_REQUEST['doctor'], $_REQUEST['room']);
                $query->execute();
            }
            $smarty->display('index.tpl');
        break;
        default:
        $smarty->display('index.tpl');
    }
} else {
    if(isset($_SESSION['login']))
        $smarty->display('index.tpl');
    else $smarty->display('login.tpl');
}
?>