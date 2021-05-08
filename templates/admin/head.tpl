<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" 
        rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
<div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php">Strona główna</a>
                </li>
                {if isset($login)}
                <li class="nav-item">
                    <a class="nav-link" href="index.php?action=doctorList">Lekarze</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?action=roomList">Gabinety</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?action=patientList">Pacjenci</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?action=generateAppointments">Generuj terminy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Witaj {$login}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?action=logout">Wyloguj</a>
                </li>
                {else}

                {/if}
            </ul>
            </div>
        </div>
        </nav>