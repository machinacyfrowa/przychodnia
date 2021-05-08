{include file="head.tpl"}
<div class="row">
<table class="table">
<tr>
    <th>ID</th>
    <th>Imię</th>
    <th>Nazwisko</th>

</tr>
{foreach from=$patients item=patient}
    <tr>
        <td>{$patient.id}</td>
        <td>{$patient.firstName}</td>
        <td>{$patient.lastName}</td>

    </tr>
{/foreach}
</table>
</div>
{include file="foot.tpl"}