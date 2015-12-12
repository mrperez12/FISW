
<%@ page import="user.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-userProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userProfile">
			
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
			
				<g:if test="${userProfileInstance?.studiesPre}">
				<li class="fieldcontain">
					<span id="studiesPre-label" class="property-label"><g:message code="userProfile.studiesPre.label" default="Estudios de Pregrado:" /></span>
					
						<span class="property-value" aria-labelledby="studiesPre-label"><g:fieldValue bean="${userProfileInstance}" field="studiesPre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.studiesPos}">
				<li class="fieldcontain">
					<span id="studiesPos-label" class="property-label"><g:message code="userProfile.studiesPos.label" default="Estudios de Postgrado:" /></span>
					
						<span class="property-value" aria-labelledby="studiesPos-label"><g:fieldValue bean="${userProfileInstance}" field="studiesPos"/></span>
					
				</li>
				</g:if>
			
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
			
				<g:if test="${userProfileInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userProfile.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="userProfile" action="show" id="${userProfileInstance?.user?.id}">${userProfileInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userProfileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
