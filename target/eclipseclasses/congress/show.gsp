
<%@ page import="activities.Congress" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congress.label', default: 'Congress')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-congress" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-congress" class="content scaffold-show" role="main">
			<h1>Detalles del Congreso</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list congress">

				<g:if test="${congressInstance?.nameCongress}">
					<li class="fieldcontain">
						<span id="nameCongress-label" class="property-label"><g:message code="congress.nameCongress.label" default="Nombre:" /></span>

						<span class="property-value" aria-labelledby="nameCongress-label"><g:fieldValue bean="${congressInstance}" field="nameCongress"/></span>

					</li>
				</g:if>
                <g:if test="${congressInstance?.cityCongress}">
                    <li class="fieldcontain">
                        <span id="cityCongress-label" class="property-label"><g:message code="congress.cityCongress.label" default="Ciudad:" /></span>

                        <span class="property-value" aria-labelledby="cityCongress-label"><g:fieldValue bean="${congressInstance}" field="cityCongress"/></span>

                    </li>
                </g:if>

                <g:if test="${congressInstance?.countryCongress}">
                    <li class="fieldcontain">
                        <span id="countryCongress-label" class="property-label"><g:message code="congress.countryCongress.label" default="Pais:" /></span>

                        <span class="property-value" aria-labelledby="countryCongress-label"><g:fieldValue bean="${congressInstance}" field="countryCongress"/></span>

                    </li>
                </g:if>
                <g:if test="${congressInstance?.date}">
                    <li class="fieldcontain">
                        <span id="date-label" class="property-label"><g:message code="congress.date.label" default="Fecha:" /></span>

                        <span class="property-value" aria-labelledby="date-label"><g:fieldValue bean="${congressInstance}" field="date"/></span>

                    </li>
                </g:if>

                <g:if test="${congressInstance?.poster}">
                    <li class="fieldcontain">
                        <span id="poster-label" class="property-label"><g:message code="congress.poster.label" default="Poster:" /></span>

                        <span class="property-value" aria-labelledby="poster-label"><g:fieldValue bean="${congressInstance}" field="poster"/></span>

                    </li>
                </g:if>
				<g:if test="${congressInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="congress.filename.label" default="Archivo:" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${congressInstance}" field="filename"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${congressInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="congress.uploadDate.label" default="Fecha de Subida:" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${congressInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:congressInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:link class="list" action="list">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
