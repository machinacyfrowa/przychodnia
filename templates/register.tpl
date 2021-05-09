{include file="head.tpl"}

    <div class="row">
        <div class="col col-lg-4 offset-lg-4 mt-5">
            <h1 class="text-center">Zarejestruj się</h1>
            <form action="http://localhost/pam2021/przychodnia/zarejestruj/" method="post">
                <input type="hidden" name="action" value="processRegister">
                <div class="mb-3">
                    <label for="pesel" class="form-label">Numer PESEL</label>
                    <input type="text" name="pesel" class="form-control" id="pesel" placeholder="Numer PESEL" required>   
                </div>
                <div class="mb-3">
                <label for="password" class="form-label">Nowe hasło</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="" required>   
                </div>
                <div class="mb-3">
                    <label for="firstName" class="form-label">Imię</label>
                    <input type="text" name="firstName" class="form-control" id="firstName" placeholder="Imię" required>   
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Nazwisko</label>
                    <input type="text" name="lastName" class="form-control" id="lastName" placeholder="Nazwisko" required>   
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary w-100">Zarejestruj</button>
                </div>
                {if isset($error)}
                <div class="alert alert-danger" role="alert">
                    {$error}
                </div>
                {/if}
                
            </form>
        </div>
    </div>

{include file="foot.tpl"}