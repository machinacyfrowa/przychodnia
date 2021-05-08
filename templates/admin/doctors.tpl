{include file="head.tpl"}
<div class="row">
<table class="table">
<tr>
    <th>ID</th>
    <th>Imię</th>
    <th>Nazwisko</th>
    <th>Specjalizacja</th>
</tr>
{foreach from=$doctors item=doctor}
    <tr>
        <td>{$doctor.id}</td>
        <td>{$doctor.firstName}</td>
        <td>{$doctor.lastName}</td>
        <td>{$doctor.speciality}</td>
    </tr>
{/foreach}
</table>
</div>
{include file="foot.tpl"}