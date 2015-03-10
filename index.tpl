{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="http://feeds.feedburner.com/s9y" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
    <link rel="shortcut icon" href="{serendipity_getFile file="img/favicon.png"}"></link>
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-77038-1";
urchinTracker();
</script>

</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
<div id="wrap">
<div id="serendipity_banner"><a id="topofpage"></a>
	<div id="menu"><a href="http://www.s9y.org" title="Serendipity Homepage">{$CONST.HOMEPAGE}</a> | <a href="http://blog.s9y.org" title="Latest News from the official Serendipity Blog">Blog</a> | <a href="http://www.s9y.org/12.html" title="Try Serendipity">Download</a> | <a href="http://www.s9y.org/forums" title="Serendipity user and developer forum">User Forums</a> | <a href="http://spartacus.s9y.org" title="Spartacus online repository for plugins and templates">Plugins / Templates</a> | <a href="http://feeds.feedburner.com/s9y" title="Subscribe to our blog's feed at feedburner" rel="alternate" type="application/rss+xml"><img src="http://www.feedburner.com/fb/images/pub/feed-icon16x16.png" alt="Rss icon" style="border:0"/></a></div>
    <div id="identity"><h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle|truncate:50:" ..."}</a></h1>
    <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2></div>
</div>
<div id="mainpane">
	<div id="rightcolumn"><div id="contenttop">&nbsp;</div>
		<div id="content">{$CONTENT}</div>
	</div>
	<div id="serendipityLeftSideBar"><div id="sidebartop">&nbsp;</div><div id="sidebarmiddle">
		{serendipity_printSidebar side="right"}{serendipity_printSidebar side="left"}</div>
	</div>
	<div id="footer">
	</div>
</div></div>
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
