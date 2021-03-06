<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Labmmba</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
	<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>
        <sec:ifLoggedIn><b>Sesion: </b><sec:username/></sec:ifLoggedIn>
		<div class="nav" role="navigation">
			<ul>
                <sec:ifNotLoggedIn>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<li><a class="home" href="${createLink(uri: '/user')}"><g:message code="default.home.label"/></a></li>
					<li><g:link controller="userProfile" action="show">Perfil</g:link></li>

				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
                    <li><g:link controller='register' action='index'>Registrate</g:link></li>
					<li><g:link controller='login' action='auth'>Iniciar sesion</g:link></li>
				</sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li><g:link controller='logout'>Cerrar Sesion</g:link></li>
                </sec:ifLoggedIn>
			</ul>
		</div></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>

