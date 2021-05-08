{include file="head.tpl"}
<div class="row">
    <h1>Wizyty lekarskie</h1>
</div>
<div class="row">
    <h2>Zarejestruj się do lekarza:</h2>
    <form action="index.php" method="post">
        <input type="hidden" name="action" value="findAppointment">
        <div class="mb-3">
            <select class="form-select" aria-label="Default select example" name="doctor">
                <option selected>Wybierz lekarza:</option>
                {foreach from=$doctors item=doctor}
                    <option value="{$doctor.id}">{$doctor.speciality} {$doctor.firstName} {$doctor.lastName}</option>
                {/foreach}
              </select> 
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary w-100">Umów wizytę</button>
        </div>
    </form>
</div>
<div class="row">
    <h2>Lista umówionych wizyt:</h2>
    <table class="table">
        <tr>
            <th>Termin wizyty</th>
            <th>Nazwisko lekarza</th>
            <th>Numer gabinetu</th>
        </tr>
        {foreach from=$appointments item=appointment}
        <tr>
            <td>{$appointment.date}</td>
            <td>{$appointment.firstName} {$appointment.lastName}</td>
            <td>23</td>
        </tr>
        {/foreach}
    </table>
</div>

{include file="foot.tpl"}