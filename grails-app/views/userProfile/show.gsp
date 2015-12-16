
<%@ page import="user.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title>Perfil del Usuario</title>
	</head>
	<body>
		<div id="show-userProfile" class="content scaffold-show" role="main">
			<h1>Perfil del Usuario</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userProfile">
			<b>Usuario:</b>
				<g:if test="${userProfileInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="userProfile.name.label" default="Nombre:" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userProfileInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="userProfile.lastName.label" default="Apellidos:" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userProfileInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
                <g:if test="${userProfileInstance?.user}">
                    <li class="fieldcontain">
                        <span id="user-label" class="property-label"><g:message code="userProfile.user.label" default="Email:" /></span>

                        <span class="property-value" aria-labelledby="user-label">${userProfileInstance?.user?.encodeAsHTML()}</span>

                    </li>
                </g:if>
                <br>
				<b>Estudios de Pregrado:</b>
				<g:if test="${userProfileInstance?.studiesPre}">
				<li class="fieldcontain">
					<span id="studiesPre-label" class="property-label"><g:message code="userProfile.studiesPre.label" default="Carrera:" /></span>
					
						<span class="property-value" aria-labelledby="studiesPre-label"><g:fieldValue bean="${userProfileInstance}" field="studiesPre"/></span>
					
				</li>
				</g:if>
				<g:if test="${userProfileInstance?.university}">
					<li class="fieldcontain">
						<span id="university-label" class="property-label"><g:message code="userProfile.university.label" default="Universidad:" /></span>

						<span class="property-value" aria-labelledby="university-label"><g:fieldValue bean="${userProfileInstance}" field="university"/></span>

					</li>
				</g:if>
				<g:if test="${userProfileInstance?.country}">
					<li class="fieldcontain">
						<span id="country-label" class="property-label"><g:message code="userProfile.country.label" default="Pais:" /></span>

						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userProfileInstance}" field="country"/></span>

					</li>
				</g:if>
                <br>
				<B>Estudios de Postgrado:</B>
				<g:if test="${userProfileInstance?.studiesPos}">
				<li class="fieldcontain">
					<span id="studiesPos-label" class="property-label"><g:message code="userProfile.studiesPos.label" default="Estudios de Postgrado:" /></span>
					
						<span class="property-value" aria-labelledby="studiesPos-label"><g:fieldValue bean="${userProfileInstance}" field="studiesPos"/></span>
					
				</li>
				</g:if>
                <g:if test="${userProfileInstance?.universityPos}">
                <li class="fieldcontain">
                    <span id="universityPos-label" class="property-label"><g:message code="userProfile.universityPos.label" default="Universidad:" /></span>

                    <span class="property-value" aria-labelledby="universityPos-label"><g:fieldValue bean="${userProfileInstance}" field="universityPos"/></span>

                </li>
                </g:if>
                <g:if test="${userProfileInstance?.countryPos}">
                <li class="fieldcontain">
                    <span id="countryPos-label" class="property-label"><g:message code="userProfile.countryPos.label" default="Universidad:" /></span>

                    <span class="property-value" aria-labelledby="countryPos-label"><g:fieldValue bean="${userProfileInstance}" field="countryPos"/></span>

                </li>
                </g:if>
                <br>
                <b>Ambito Laboral:</b>
				<g:if test="${userProfileInstance?.labCharge}">
				<li class="fieldcontain">
					<span id="labCharge-label" class="property-label"><g:message code="userProfile.labCharge.label" default="Cargo de laboratorio:" /></span>
					
						<span class="property-value" aria-labelledby="labCharge-label"><g:fieldValue bean="${userProfileInstance}" field="labCharge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.investigation}">
				<li class="fieldcontain">
					<span id="investigation-label" class="property-label"><g:message code="userProfile.investigation.label" default="Area de Investigacion:" /></span>
					
						<span class="property-value" aria-labelledby="investigation-label"><g:fieldValue bean="${userProfileInstance}" field="investigation"/></span>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:userProfileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:link controller="books" action="list">Publicaciones en Libros</g:link>
                    <g:link controller="proyects" action="index">Proyectos</g:link>
					<g:link controller="congress" action="list">Congresos</g:link>
					<g:link controller="magazines" action="list">Revistas Cientificas</g:link>
                    <g:link controller="tesisPregrade" action="list">Tesis Pregrado</g:link>
                    <g:link controller="tesisPostgrade" action="list">Tesis Postgrado</g:link>

				</fieldset>
			</g:form>
		</div>
	</body>
</html>
