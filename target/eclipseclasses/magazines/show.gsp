
<%@ page import="magazine.Magazines" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'magazines.label', default: 'Magazines')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-magazines" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-magazines" class="content scaffold-show" role="main">
			<h1>Detalles de Publicacion</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list magazines">



                <g:if test="${magazinesInstance?.authorMagazine}">
                    <li class="fieldcontain">
                        <span id="authorMagazine-label" class="property-label"><g:message code="magazines.authorMagazine.label" default="Autor:" /></span>

                        <span class="property-value" aria-labelledby="authorMagazine-label"><g:fieldValue bean="${magazinesInstance}" field="authorMagazine"/></span>

                    </li>
                </g:if>
                <g:if test="${magazinesInstance?.magazine}">
                    <li class="fieldcontain">
                        <span id="magazine-label" class="property-label"><g:message code="magazines.magazine.label" default="Revista:" /></span>

                        <span class="property-value" aria-labelledby="magazine-label"><g:fieldValue bean="${magazinesInstance}" field="magazine"/></span>

                    </li>
                </g:if>
                <g:if test="${magazinesInstance?.titleMagazine}">
                    <li class="fieldcontain">
                        <span id="titleMagazine-label" class="property-label"><g:message code="magazines.titleMagazine.label" default="Titulo:" /></span>

                        <span class="property-value" aria-labelledby="titleMagazine-label"><g:fieldValue bean="${magazinesInstance}" field="titleMagazine"/></span>

                    </li>
                </g:if>
                <g:if test="${magazinesInstance?.year}">
                    <li class="fieldcontain">
                        <span id="year-label" class="property-label"><g:message code="magazines.year.label" default="Año:" /></span>

                        <span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${magazinesInstance}" field="year"/></span>

                    </li>
                </g:if>
                <g:if test="${magazinesInstance?.keywords}">
                    <li class="fieldcontain">
                        <span id="keywords-label" class="property-label"><g:message code="magazines.keywords.label" default="Keywords:" /></span>

                        <span class="property-value" aria-labelledby="keywords-label"><g:fieldValue bean="${magazinesInstance}" field="keywords"/></span>

                    </li>
                </g:if>
				<g:if test="${magazinesInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="magazines.filename.label" default="Archivo:" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${magazinesInstance}" field="filename"/></span>
					
				</li>
				</g:if>

				<g:if test="${magazinesInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="magazines.uploadDate.label" default="Fecha de Subida:" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${magazinesInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>

			
			</ol>
			<g:form url="[resource:magazinesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
