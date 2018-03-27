{if $is_embedded != true}
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity v.{$head_version}">
{if ($view == "entry" || $view == "start" || $view == "feed" || $view == "plugin" || $staticpage_pagetitle != "" || $robots_index == 'index')}
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="dns-prefetch" href="https://ajax.googleapis.com">
    <link rel="dns-prefetch" href="https://www.google-analytics.com">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet">
    <link rel="stylesheet" href="{$head_link_stylesheet}">
    <script src="{serendipity_getFile file="scripts/modernizr/modernizr.js"}"></script>
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="http://feeds.feedburner.com/s9y">
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body id="top">
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
    <nav id="nav-global" role="navigation">
        <div class="layout-container">
            <a id="open-nav" class="nav-toggle" href="#site-nav">Menu</a>

            <ul id="site-nav" class="nav-collapse">
                <li><a href="https://www.s9y.org">Start</a></li>
                <li><a href="http://docs.s9y.org/docs/index.html">Docs</a></li>
                <li id="current-page"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}">Blog</a></li>
                <li><a href="https://board.s9y.org">Forums</a></li>
                <li><a href="http://spartacus.s9y.org/">Plugins</a></li>
                <li><a href="http://spartacus.s9y.org/index.php?mode=template_all">Themes</a></li>
                <li><a href="https://github.com/s9y">GitHub</a></li>
            </ul>
        </div>
    </nav>

    <header id="masthead" role="banner">
        <div class="layout-container">
            <h1><span>{$head_title|@default:$blogTitle|truncate:50:" ..."} – </span>{$head_subtitle|@default:$blogDescription}</h1>
        </div>
    </header>

    <div id="claim">
        <div class="layout-container">
            <span id="slogan">Not mainstream since 2002</span>
        </div>
    </div>

    <main>
        <div class="layout-container">
            <div id="content" role="main">
            {$CONTENT}
            </div>

            <aside id="sidebar" role="complementary">
                <h2>More info</h2>

                <section class="widget">
                    <h3>{$CONST.QUICKSEARCH}</h3>

                    <form id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get" role="search">
                        <input type="hidden" name="serendipity[action]" value="search">
                        <label for="serendipityQuickSearchTermField">{$CONST.QUICKSEARCH}</label>
                        <input id="serendipityQuickSearchTermField" name="serendipity[searchTerm]" type="search" value="">
                        <input id="searchsend" name="serendipity[searchButton]" type="submit" value="{$CONST.GO}">
                    </form>
                    {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
                </section>
                {serendipity_printSidebar side="right"}
                {serendipity_printSidebar side="left"}
            </aside>
        </div>
    </main>

    <footer id="service" role="contentinfo">
        <div class="layout-container">
            <ul id="service-links">
                <li><a id="to-top" href="#top">Back to top</a></li>
                <li><a href="http://jann.is/datenschutz.html">Privacy policy</a></li>
            </ul>

            <p id="supporters">Thanks to <a href="http://www.cityreview.de">Regionalportal</a> and <a href="http://www.aoe.com">AOE - TYPO3 &amp; Magento Agentur</a> for supporting the s9y project with servers and bandwidth.</p>
        </div>
    </footer>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
    <!-- Google Analytics
    <script>
window.ga=function(){ldelim}ga.q.push(arguments){rdelim};ga.q=[];ga.l=+new Date;
ga('create','UA-77038-1','auto');ga('send','pageview')
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async defer></script>
-->
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
