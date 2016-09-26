<article id="staticpage_{$staticpage_pagetitle|@makeFilename}" class="serendipity_staticpage{if $staticpage_articleformat} serendipity_entry{/if}">
    <header>
        <h2>{if $staticpage_articleformat}{if $staticpage_articleformattitle}{$staticpage_articleformattitle|@escape}{else}{$staticpage_pagetitle}{/if}{else}{if $staticpage_headline}{$staticpage_headline|@escape}{else}{$staticpage_pagetitle}{/if}{/if}</h2>
    {if $staticpage_author or $staticpage_lastchange}
        <p class="serendpity_entry_byline">{if $staticpage_author}{$CONST.POSTED_BY} {$staticpage_author|@escape}{/if}{if $staticpage_author AND $staticpage_lastchange} {/if}
        {if $staticpage_lastchange}{$CONST.ON} <time datetime="{$staticpage_lastchange|@serendipity_html5time}">{$staticpage_lastchange|@formatTime:DATE_FORMAT_ENTRY}</time>{/if}</p>
    {/if}
    </header>
{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
    <fieldset>
        <legend>{$CONST.STATICPAGE_PASSWORD_NOTICE}</legend>
        <input name="serendipity[pass]" type="password" value="">
        <input name="submit" type="submit" value="{$CONST.GO}" >
    </fieldset>
    </form>
{else}
    {if $staticpage_articleformat}
    <div class="serendipity_entry_body">
    {/if}
        {if $staticpage_precontent}{$staticpage_precontent}{/if}
        {if $staticpage_content}{$staticpage_content}{/if}
    {if $staticpage_articleformat}
    </div>
    {/if}
{/if}
    <footer>
    {if is_array($staticpage_childpages)}
        <ul id="staticpage_childpages">
        {foreach from=$staticpage_childpages item="childpage"}
            <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
        {/foreach}
        </ul>
    {/if}
    {if $staticpage_adminlink AND $staticpage_adminlink.page_user}<a href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|@escape}</a>{/if}
    </footer>
</article>
