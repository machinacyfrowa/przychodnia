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
                <a class="nav-link active" aria-current="page" href="http://localhost/pam2021/przychodnia">Strona główna</a>
                </li>
                
                {if isset($firstName)}
                    <li class="nav-item">
                    <a class="nav-link" href="http://localhost/pam2021/przychodnia/wizyty/">Wizyty lekarskie</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">
                        Witaj {$firstName}
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="http://localhost/pam2021/przychodnia/wyloguj/">Wyloguj</a>
                    </li>
                {else}
                    <li class="nav-item">
                    <a class="nav-link" href="http://localhost/pam2021/przychodnia/zaloguj/">Zaloguj się</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="http://localhost/pam2021/przychodnia/zarejestruj/">Zarejestruj się</a>
                    </li> 
                {/if}
            </ul>
            </div>
        </div>
        </nav>