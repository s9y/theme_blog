{serendipity_hookPlugin hook="entries_header"}
<article class="archives archives_summary">
    <h2>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h2>

    <ul class="plainList">
    {foreach from=$entries item="sentries"}
        {foreach from=$sentries.entries item="entry"}
        <li><a href="{$entry.link}">{$entry.title}</a> {$CONST.ON} <time datetime="{$entry.timestamp|@serendipity_html5time}">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</time>
            <span class="archives_byline">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a>{if $entry.categories} {$CONST.IN} {foreach from=$entry.categories item="category" name="categories"}<a href="{$category.category_link}">{$category.category_name|@escape}</a>{/foreach}{/if}</span>
        </li>
        {/foreach}
    {/foreach}
    </ul>
</article>
