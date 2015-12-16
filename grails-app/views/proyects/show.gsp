
<%@ page import="proyect.Proyects" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyects.label', default: 'Proyects')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proyects" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proyects" class="content scaffold-show" role="main">
			<h1>Detalles de Proyecto</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proyects">
			
				<g:if test="${proyectsInstance?.start}">
				<li class="fieldcontain">
					<span id="start-label" class="property-label"><g:message code="proyects.start.label" default="Fecha Inicio:" /></span>
					
						<span class="property-value" aria-labelledby="start-label"><g:fieldValue bean="${proyectsInstance}" field="start"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectsInstance?.finish}">
				<li class="fieldcontain">
					<span id="finish-label" class="property-label"><g:message code="proyects.finish.label" default="Fecha Termino:" /></span>
					
						<span class="property-value" aria-labelledby="finish-label"><g:fieldValue bean="${proyectsInstance}" field="finish"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectsInstance?.proyectName}">
				<li class="fieldcontain">
					<span id="proyectName-label" class="property-label"><g:message code="proyects.proyectName.label" default="Nombre Proyecto:" /></span>
					
						<span class="property-value" aria-labelledby="proyectName-label"><g:fieldValue bean="${proyectsInstance}" field="proyectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectsInstance?.proyectCharge}">
				<li class="fieldcontain">
					<span id="proyectCharge-label" class="property-label"><g:message code="proyects.proyectCharge.label" default="Cargo de Proyecto:" /></span>
					
						<span class="property-value" aria-labelledby="proyectCharge-label"><g:fieldValue bean="${proyectsInstance}" field="proyectCharge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectsInstance?.others}">
				<li class="fieldcontain">
					<span id="others-label" class="property-label"><g:message code="proyects.others.label" default="Otros:" /></span>
					
						<span class="property-value" aria-labelledby="others-label"><g:fieldValue bean="${proyectsInstance}" field="others"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:proyectsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="index">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
