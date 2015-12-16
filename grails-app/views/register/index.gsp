<html>

<head>
	<meta name='layout' content='register'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
</head>

<body>
<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>
    <div class="nav" role="navigation">
        <ul>
            <sec:ifNotLoggedIn>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li><a class="home" href="${createLink(uri: '/user')}"><g:message code="default.home.label"/></a></li>
            </sec:ifLoggedIn>
        </ul>
    </div>
</div>
<p/>

<s2ui:form width='650' height='300' elementId='loginFormContainer'
           titleCode='spring.security.ui.register.description' center='true'>

<g:form action='register' name='registerForm'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>

	<br/>

	<table>
	<tbody>

		<s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                         size='40' labelCodeDefault='email' value="${command.username}"/>

		<s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
		                   size='40' labelCode='user.email.label' labelCodeDefault='Confirmar email' />

		<s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                             size='40' labelCodeDefault='Password' value="${command.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                             size='40' labelCodeDefault='Confirmar Password' value="${command.password2}"/>

		<s2ui:textFieldRow name='nombres' labelCode='user.nombres.label' bean="${command}"
						   size='40' labelCodeDefault='Nombres' value="${command.nombres}"/>

		<s2ui:textFieldRow name='apellidos' labelCode='user.apellidos.label' bean="${command}"
						   size='40' labelCodeDefault='Apellido' value="${command.apellidos}"/>
	</tbody>
	</table>

	<s2ui:submitButton elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>

	</g:else>

</g:form>

</s2ui:form>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
