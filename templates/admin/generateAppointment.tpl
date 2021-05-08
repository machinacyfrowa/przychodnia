{include file="head.tpl"}
<div class="row">
    <form action="index.php" method="post">
        <input type="hidden" name="action" value="addAppointments">
        <div class="mb-3">
            <label class="form-label" for="doctor">Wybierz lekarza:</label>
            <select class="form-select" name="doctor" id="doctor">
                <option selected>Open this select menu</option>
                {foreach from=$doctors item=doctor}
                        <option value="{$doctor.id}">{$doctor.speciality} {$doctor.firstName} {$doctor.lastName}</option>
                {/foreach}
              </select>
        </div>
        <div class="mb-3">
            <label class="form-label" for="room">Wybierz lekarza:</label>
            <select class="form-select" name="room" id="room">
                <option selected>Open this select menu</option>
                {foreach from=$rooms item=room}
                        <option value="{$room.id}">{$room.roomNumber}</option>
                {/foreach}
              </select>
        </div>
          
          <div class="mb-3">
              <label class="form-label" for="shiftStart">Początek zmiany</label>
              <input class="form-control" type="datetime-local" name="shiftStart" id="shiftStart">
            </div>
          <div class="mb-3">
            <label class="form-label" for="shiftEnd">Koniec zmiany</label>
              <input class="form-control" type="datetime-local" name="shiftEnd" id="shiftEnd"> 
        </div>
           <div class="mb-3">
            <label class="form-label" for="interval">Interwał wizyt (minut)</label>
            <input class="form-control" type="number" name="interval" id="interval">
           </div>
          
          <div class="mb-3">
            <button type="submit" class="btn btn-primary w-100">Dodaj puste terminy</button>
        </div>
    </form>
</div>
{include file="foot.tpl"}