{include file="head.tpl"}
<table class="table">
    <tr>
        <th>Data</th>
        <th>Lekarz</th>
        <th>Gabinet</th>
        <th>Rezerwacja</th>
    </tr>    
{foreach from=$appointments item=appointment}
    <tr>
        <td>{$appointment.date}</td>
        <td>{$appointment.firstName} {$appointment.lastName}</td>
        <td>{$appointment.roomNumber}</td>
        <td>
            <a href="http://localhost/pam2021/przychodnia/dodajWizyte/{$appointment.appointment_id}">
            <button class="btn btn-primary">Zarezerwuj termin</button>
        </a>
        </td>
    </tr>

    
{/foreach}
</table>
{include file="foot.tpl"}