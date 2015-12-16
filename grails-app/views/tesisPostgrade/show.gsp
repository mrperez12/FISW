
<%@ page import="tesisPos.TesisPostgrade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tesisPostgrade.label', default: 'TesisPostgrade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tesisPostgrade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-tesisPostgrade" class="content scaffold-show" role="main">
			<h1>Informacion de Tesis</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tesisPostgrade">

                <g:if test="${tesisPostgradeInstance?.nameTesisPos}">
                    <li class="fieldcontain">
                        <span id="nameTesisPos-label" class="property-label"><g:message code="tesisPostgrade.nameTesisPos.label" default="Nombre Tesis:" /></span>

                        <span class="property-value" aria-labelledby="nameTesisPos-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="nameTesisPos"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPostgradeInstance?.tesisPosUniversity}">
                    <li class="fieldcontain">
                        <span id="tesisPosUniversity-label" class="property-label"><g:message code="tesisPostgrade.tesisPosUniversity.label" default="Universidad:" /></span>

                        <span class="property-value" aria-labelledby="tesisPosUniversity-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="tesisPosUniversity"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPostgradeInstance?.tesisPosCountry}">
                    <li class="fieldcontain">
                        <span id="tesisPosCountry-label" class="property-label"><g:message code="tesisPostgrade.tesisPosCountry.label" default="Pais:" /></span>

                        <span class="property-value" aria-labelledby="tesisPosCountry-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="tesisPosCountry"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPostgradeInstance?.tutorPosName}">
                    <li class="fieldcontain">
                        <span id="tutorPosName-label" class="property-label"><g:message code="tesisPostgrade.tutorPosName.label" default="Email de Tutor:" /></span>

                        <span class="property-value" aria-labelledby="tutorPosName-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="tutorPosName"/></span>

                    </li>
                </g:if>
                <g:if test="${tesisPostgradeInstance?.cotutorPosName}">
                    <li class="fieldcontain">
                        <span id="cotutorPosName-label" class="property-label"><g:message code="tesisPostgrade.cotutorPosName.label" default="Email de Cotutor:" /></span>

                        <span class="property-value" aria-labelledby="cotutorPosName-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="cotutorPosName"/></span>

                    </li>
                </g:if>
				<g:if test="${tesisPostgradeInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="tesisPostgrade.filename.label" default="Archivo:" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${tesisPostgradeInstance}" field="filename"/></span>
					
				</li>
				</g:if>

				<g:if test="${tesisPostgradeInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="tesisPostgrade.uploadDate.label" default="Fecha de Subida:" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${tesisPostgradeInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:tesisPostgradeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
