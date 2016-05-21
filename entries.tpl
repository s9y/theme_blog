<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
    <article class="serendipity_entry{if $dategroup.is_sticky} sticky{/if}">
        <header>
            <h2><a href="{$entry.link}">{$entry.title|@default:$entry.body|truncate:200:" ..."}</a></h2>

            <p class="serendpity_entry_byline">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a>{if $entry.categories} {$CONST.IN} {foreach from=$entry.categories item="category" name="categories"}<a href="{$category.category_link}">{$category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if}{if $dategroup.is_sticky} {$CONST.ON} {$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}{else} {$CONST.ON} {$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY} {$CONST.AT} {$entry.timestamp|@formatTime:'%H:%M'}{/if}.</p>
        </header>

        <div class="serendipity_entry_body">
        	{$entry.body}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
            <a class="read-more" href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a>
        {/if}
        {if $entry.is_extended}
            <div id="extended">
            {$entry.extended}
            </div>
        {/if}
        {if $entry.plugin_display_dat}
            {$entry.plugin_display_dat}
        {/if}
        </div>

        <footer>
            <ul class="plainList">
            {if $entry.has_comments}
                <li><a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a></li>
            {/if}
            {if $entry.has_trackbacks}
                <li><a href="{$entry.link}#trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</a></li>
            {/if}
            {if $entry.is_entry_owner and not $is_preview}
                <li><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></li>
            {/if}
            </ul>

            {$entry.add_footer}
        </footer>

	<!--
	<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
	xmlns:dc="http://purl.org/dc/elements/1.1/">
	<rdf:Description
		rdf:about="{$entry.link_rdf}"
		trackback:ping="{$entry.link_trackback}"
		dc:title="{$entry.title_rdf|@default:$entry.title}"
		dc:identifier="{$entry.rdf_ident}" />
	</rdf:RDF>
	-->
        {$entry.plugin_display_dat}

    {if $is_single_entry and not $use_popups and not $is_preview}
        {if $CONST.DATA_UNSUBSCRIBED}
        <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
        {/if}
        <section id="trackbacks" class="serendipity_comments serendipity_section_trackbacks">
            <h3>{$CONST.TRACKBACKS}</h3>

            <p class="serendipity_trackback_url"><a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:htmlall}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></p>

            {serendipity_printTrackbacks entry=$entry.id}
        </section>
    {/if}
    {if $is_single_entry and not $is_preview}
        <section id="comments" class="serendipity_comments serendipity_section_comments">
            <h3>{$CONST.COMMENTS}</h3>

            <p class="manage_comments">{$CONST.DISPLAY_COMMENTS_AS}
            {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
            {else}
                (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
            {/if}
            </p>

            {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

        {if $entry.is_entry_owner}
            <p class="manage_comments">{if $entry.allow_comments}
            <a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>
            {else}
            <a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>
            {/if}</p>
        {/if}
        </section>

        <a id="feedback"></a>
        {foreach from=$comments_messagestack item="message"}
        <p class="serendipity_msg_important">{$message}</p>
        {/foreach}
        {if $is_comment_added}
        <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
        {elseif $is_comment_moderate}
        <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED} {$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
        {elseif not $entry.allow_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
        {else}
        <section id="respond" class="serendipity_section_commentform">
            <h3>{$CONST.ADD_COMMENT}</h3>

            {$COMMENTFORM}
		</section>
        {/if}
    {/if}
        {$entry.backend_preview}
    </article>
    {/foreach}
    {foreachelse}
    {if not $plugin_clean_page}
	   <p class="nocontent">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/foreach}
{if $footer_info or $footer_prev_page or $footer_next_page}
    <nav class="serendipity_pagination">
    {if $footer_info}
        <p>{$footer_info}</p>
    {/if}
    {if $footer_prev_page or $footer_next_page}
        <ul>
        {if $footer_prev_page}
            <li class="prev"><a href="{$footer_prev_page}">{$CONST.PREVIOUS_PAGE}</a></li>
        {/if}
        {if $footer_next_page}
            <li class="next"><a href="{$footer_next_page}">{$CONST.NEXT_PAGE}</a></li>
        {/if}
        </ul>
    {/if}
    </nav>
{/if}
{serendipity_hookPlugin hook="entries_footer"}
