{foreach from=$comments item=comment name="comments"}
<article id="c{$comment.id}" class="serendipity_comment{if $entry.author == $comment.author} serendipity_comment_author_self{/if} {cycle values="odd,even"} {if $comment.depth > 8}commentlevel-9{else}commentlevel-{$comment.depth}{/if}">
    <header>
        <h4>{if $comment.url}<a href="{$comment.url}">{/if}{$comment.author|default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if} {$CONST.ON} <time datetime="{$comment.timestamp|@serendipity_html5time}">{$comment.timestamp|@formatTime:DATE_FORMAT_ENTRY}</time> {$CONST.AT} <time>{$comment.timestamp|@formatTime:'%H:%M'}</time>:</h4>
    </header>

    <div class="serendipity_commentBody">
    {if $comment.body == 'COMMENT_DELETED'}
        {$CONST.COMMENT_IS_DELETED}
    {else}
        {$comment.body}
    {/if}
    </div>

    <footer>
        <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.id}</a>{if $entry.is_entry_owner} | <a class="comment_source_ownerlink" href="{$comment.link_delete}" title="{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}">{$CONST.DELETE}</a>
    {/if} | <a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}"{if $comment_onchange != ''} onclick="{$comment_onchange}"{/if}>{$CONST.REPLY}</a>
        <div id="serendipity_replyform_{$comment.id}"></div>
    </footer>
</article>
{foreachelse}
<p class="nocomments">{$CONST.NO_COMMENTS}</p>
{/foreach}
