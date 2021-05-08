{include file="head.tpl"}
<div class="row">
    <h1>Wizyty lekarskie</h1>
</div>
<div class="row">
    <h2>Zarejestruj się do lekarza:</h2>
    <form action="index.php" method="post">
        <input type="hidden" name="action" value="processAppointment">
        <div class="mb-3">
            <select class="form-select" aria-label="Default select example" name="doctor">
                <option selected>Wybierz lekarza:</option>
                {foreach from=$doctors item=doctor}
                    <option value="{$doctor.id}">{$doctor.speciality} {$doctor.firstName} {$doctor.lastName}</option>
                {/foreach}
              </select> 
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Data wizyty</label>
            <input type="date" name="date" class="form-control" id="date">   
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
        <tr>
            <td>19-11-2021 15:00</td>
            <td>Kowalski</td>
            <td>23</td>
        </tr>
        <tr>
            <td>22-06-2021</td>
            <td>Nowak</td>
            <td>54</td>
        </tr>
    </table>
</div>

{include file="foot.tpl"}