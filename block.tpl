<!--__b_{$id}-->
<div id="block_{$name}" class="box {$classname}{if isset($collapsible) && $collapsible} collapsible{if isset($collapsed) && $collapsed} collapsed{/if}{/if}" {if isset($manageMode)} vm-hidden="{$hidden}"{/if}>
	{if isset($position) && 'landing' == $position}
		<div class="container">
	{/if}
	{if $header}
		<h4{if isset($position) && 'landing' == $position} class="lead text-center"{/if}>{$title|escape:'html'}
			{if isset($icons) && $icons}
				<span class="box__actions">
					{foreach $icons as $icon}
						<a href="{$icon.url}" {$icon.attributes} id="{$icon.name}_{$name}">{$icon.text}</a>
					{/foreach}
				</span>
			{/if}
		</h4>
	{/if}

	<!--__b_c_{$id}-->
	{$_block_content_}
	<!--__e_c_{$id}-->

	{if isset($position) && 'landing' == $position}
		</div>
	{/if}
</div>
<!--__e_{$id}-->