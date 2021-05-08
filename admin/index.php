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
        default:
        $smarty->display('index.tpl');
    }
} else {
    if(isset($_SESSION['login']))
        $smarty->display('index.tpl');
    else $smarty->display('login.tpl');
}
?>