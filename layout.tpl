<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}


		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_print_css files='iabootstrap'}
		{ia_print_css files='user-style'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body class="page-{$core.page.name} i18n-{$core.language.iso} {if $core.config.navbar_sticky} navbar-sticky{/if}">
		<nav class="navbar{if $core.config.navbar_sticky} navbar-fixed-top{else} navbar-static-top{/if}{if $core.config.navbar_inverse} navbar-inverse{else} navbar-default{/if}">
			<div class="container{if $core.config.navbar_fluid}-fluid{/if}">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
						{if $core.config.enable_text_logo}
							{$core.config.logo_text}
						{else}
							{if !empty($core.config.site_logo)}
								<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}" height="20">
							{else}
								<img src="{$img}logo.png" alt="{$core.config.site}" height="20">
							{/if}
						{/if}
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse">
					{ia_blocks block='mainmenu'}
					{if $core.config.search_navbar}
						<form method="get" action="{$smarty.const.IA_URL}search/" class="navbar-form navbar-left hidden-sm">
							<div class="input-group">
								<input type="text" name="q" class="form-control" placeholder="{lang key='search'}">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></span></button>
								</span>
							</div>
						</form>
					{/if}
					{ia_blocks block='account'}
					{include 'language-selector.tpl'}
				</div>
			</div>
		</nav>

		{if isset($iaBlocks.teaser)}
			<div class="container">
				{ia_blocks block='teaser'}
			</div>
		{/if}

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include 'breadcrumb.tpl'}

		{if $core.config.enable_landing && 'index' == $core.page.name}
			<div class="landing">
				{ia_blocks block='landing'}
			</div>
		{else}
			{ia_hooker name='smartyFrontBeforeNotifications'}
			{include 'notification.tpl'}

			{ia_hooker name='smartyFrontBeforeMainContent'}

			<div class="container">
				{$_content_}
			</div>

			{ia_hooker name='smartyFrontAfterMainContent'}
		{/if}

		<!-- SYSTEM STUFF -->
		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>