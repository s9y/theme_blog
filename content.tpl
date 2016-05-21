{if $searchresult_tooShort or $searchresult_error or $searchresult_noEntries or $searchresult_results}
    <p class="msg-notice search-msg"><b>{$CONST.QUICKSEARCH}:</b> {$content_message}</p>
{elseif $content_message}
    <p class="msg-notice content-msg">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
