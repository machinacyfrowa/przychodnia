{include file="head.tpl"}
<div class="row">
<table class="table">
<tr>
    <th>ID</th>
    <th>Numer pokoju</th>


</tr>
{foreach from=$rooms item=room}
    <tr>
        <td>{$room.id}</td>
        <td>{$room.roomNumber}</td>

    </tr>
{/foreach}
</table>
</div>
{include file="foot.tpl"}