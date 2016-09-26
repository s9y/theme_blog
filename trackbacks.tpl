<ul class="plainList">
{foreach from=$trackbacks item=trackback}
    <li><cite>{$trackback.author|default:$CONST.ANONYMOUS}</cite> {$CONST.ON} <time datetime="{$trackback.timestamp|serendipity_html5time}">{$trackback.timestamp|formatTime:DATE_FORMAT_ENTRY}</time>: <a href="{$trackback.url|strip_tags}">{$trackback.title}</a></li>
{foreachelse}
    <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ul>
