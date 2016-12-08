{if $core.config.language_switch && count($core.languages) > 1}
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="fa fa-globe"></i>
				{$core.languages[$smarty.const.IA_LANGUAGE].title}
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				{foreach $core.languages as $code => $language}
					<li{if $smarty.const.IA_LANGUAGE == $code} class="active"{/if}><a href="{ia_page_url code=$code}" title="{$language.title}">{$language.title}</a></li>
				{/foreach}
			</ul>
		</li>
	</ul>
{/if}