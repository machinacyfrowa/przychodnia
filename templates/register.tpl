{include file="head.tpl"}

    <div class="row">
        <div class="col col-lg-4 offset-lg-4 mt-5">
            <h1 class="text-center">Zarejestruj się</h1>
            <form action="index.php">
                <input type="hidden" name="action" value="processRegister">
                <div class="mb-3">
                    <label for="pesel" class="form-label">Numer PESEL</label>
                    <input type="text" class="form-control" id="pesel" placeholder="Numer PESEL">   
                </div>
                <div class="mb-3">
                <label for="password" class="form-label">Nowe hasło</label>
                <input type="text" class="form-control" id="password" placeholder="">   
                </div>
                <button type="submit" class="btn btn-primary w-100">Zarejestruj</button>
            </form>
        </div>
    </div>

{include file="foot.tpl"}