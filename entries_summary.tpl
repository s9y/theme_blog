{serendipity_hookPlugin hook="entries_header"}
<h3 class='serendipity_date'>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h3>

<div id="entries_summary" class="serendipity_entry">
    <ul id="entries_summary_list">
    {foreach from=$entries item="sentries"}
        {foreach from=$sentries.entries item="entry"}
		<div class="archive_summary"><h4 class="archive_summary_title">{$entry.id} - <a href="{$entry.link}">{$entry.title|default:'Unknown'|truncate:80:" ..."}</a></h4>
{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}. {$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {if $entry.categories} {$CONST.IN} {foreach from=$entry.categories item="category" name="categories"}<a href="{$category.category_link}">{$category.category_name|@escape}</a>{/foreach}{/if}</div>
        {/foreach}
    {/foreach}
    </ul>
</div>

