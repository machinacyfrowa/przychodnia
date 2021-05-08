<?php
require_once('./smarty/Smarty.class.php');
$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'przychodnia');

$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

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
                $smarty->display('index.tpl');
            } else {
                //hasło niepoprawne
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
            }
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
        default:
            $smarty->display('index.tpl');
        break;
    }
} else {
    $smarty->display('index.tpl');
}


?>