{include file="head.tpl"}

    <div class="row">
        <div class="col col-lg-4 offset-lg-4 mt-5">
            <h1 class="text-center">Zaloguj się</h1>
            <form action="index.php" method="post">
                <input type="hidden" name="action" value="processLogin">
                <div class="mb-3">
                    <label for="login" class="form-label">Nazwa użytkownika</label>
                    <input type="text" name="login" class="form-control" id="login" placeholder="" required>   
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Hasło</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="" required>   
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary w-100">Zaloguj</button>
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