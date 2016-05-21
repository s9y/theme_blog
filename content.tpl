{if $searchresult_tooShort or $searchresult_error or $searchresult_noEntries or $searchresult_results}
    <p class="serendipity_msg_notice search-msg"><b>{$CONST.QUICKSEARCH}:</b> {$content_message}</p>
{elseif $content_message}
    <p class="serendipity_msg_notice content-msg">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
