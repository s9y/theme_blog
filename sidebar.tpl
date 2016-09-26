{foreach from=$plugindata item=item}
{if $item.class != "serendipity_plugin_quicksearch"}
    <section class="widget {$item.class}">
        {if $item.title != ""}<h3>{$item.title}</h3>{/if}
        {$item.content}
    </section>
{/if}
{/foreach}
