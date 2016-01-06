
<%@ page import="tesisPre.TesisPregrade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tesisPregrade.label', default: 'TesisPregrade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tesisPregrade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-tesisPregrade" class="content scaffold-show" role="main">
			<h1>Informacion de Tesis</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tesisPregrade">

                <g:if test="${tesisPregradeInstance?.nameTesis}">
                    <li class="fieldcontain">
                        <span id="nameTesis-label" class="property-label"><g:message code="tesisPregrade.nameTesis.label" default="Nombre Tesis:" /></span>

                        <span class="property-value" aria-labelledby="nameTesis-label"><g:fieldValue bean="${tesisPregradeInstance}" field="nameTesis"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPregradeInstance?.tesisUniversity}">
                    <li class="fieldcontain">
                        <span id="tesisUniversity-label" class="property-label"><g:message code="tesisPregrade.tesisUniversity.label" default="Universidad:" /></span>

                        <span class="property-value" aria-labelledby="tesisUniversity-label"><g:fieldValue bean="${tesisPregradeInstance}" field="tesisUniversity"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPregradeInstance?.tesisCountry}">
                    <li class="fieldcontain">
                        <span id="tesisCountry-label" class="property-label"><g:message code="tesisPregrade.tesisCountry.label" default="Pais:" /></span>

                        <span class="property-value" aria-labelledby="tesisCountry-label"><g:fieldValue bean="${tesisPregradeInstance}" field="tesisCountry"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPregradeInstance?.tutorName}">
                    <li class="fieldcontain">
                        <span id="tutorName-label" class="property-label"><g:message code="tesisPregrade.tutorName.label" default="Email Tutor" /></span>

                        <span class="property-value" aria-labelledby="tutorName-label"><g:fieldValue bean="${tesisPregradeInstance}" field="tutorName"/></span>

                    </li>
                </g:if>
				<g:if test="${tesisPregradeInstance?.cotutorName}">
				<li class="fieldcontain">
					<span id="cotutorName-label" class="property-label"><g:message code="tesisPregrade.cotutorName.label" default="Email Cotutor:" /></span>
					
						<span class="property-value" aria-labelledby="cotutorName-label"><g:fieldValue bean="${tesisPregradeInstance}" field="cotutorName"/></span>
					
				</li>
				</g:if>
                <g:if test="${tesisPregradeInstance?.filename}">
                    <li class="fieldcontain">
                        <span id="filename-label" class="property-label"><g:message code="tesisPregrade.filename.label" default="Archivo:" /></span>

                        <span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${tesisPregradeInstance}" field="filename"/></span>

                    </li>
                </g:if>
				<g:if test="${tesisPregradeInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="tesisPregrade.uploadDate.label" default="Fecha de subida" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${tesisPregradeInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:tesisPregradeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
