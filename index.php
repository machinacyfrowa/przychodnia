<?php
require_once('./smarty/Smarty.class.php');
$smarty = new Smarty();

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
            //przetwarzanie logowania
        break;
        case 'register':
            $smarty->display('register.tpl');
        break;
        case 'processRegister':
            //przetwarzanie rejestracji
        break;
        default:
            $smarty->display('index.tpl');
        break;
    }
} else {
    $smarty->display('index.tpl');
}


?>