
<%@ page import="tesisPos.TesisPostgrade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tesisPostgrade.label', default: 'TesisPostgrade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tesisPostgrade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tesisPostgrade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'tesisPostgrade.filename.label', default: 'Filename')}" />
					
						<g:sortableColumn property="fullPath" title="${message(code: 'tesisPostgrade.fullPath.label', default: 'Full Path')}" />
					
						<g:sortableColumn property="cotutorPosName" title="${message(code: 'tesisPostgrade.cotutorPosName.label', default: 'Cotutor Pos Name')}" />
					
						<g:sortableColumn property="nameTesisPos" title="${message(code: 'tesisPostgrade.nameTesisPos.label', default: 'Name Tesis Pos')}" />
					
						<g:sortableColumn property="tesisPosCountry" title="${message(code: 'tesisPostgrade.tesisPosCountry.label', default: 'Tesis Pos Country')}" />
					
						<g:sortableColumn property="tesisPosUniversity" title="${message(code: 'tesisPostgrade.tesisPosUniversity.label', default: 'Tesis Pos University')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tesisPostgradeInstanceList}" status="i" var="tesisPostgradeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tesisPostgradeInstance.id}">${fieldValue(bean: tesisPostgradeInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: tesisPostgradeInstance, field: "fullPath")}</td>
					
						<td>${fieldValue(bean: tesisPostgradeInstance, field: "cotutorPosName")}</td>
					
						<td>${fieldValue(bean: tesisPostgradeInstance, field: "nameTesisPos")}</td>
					
						<td>${fieldValue(bean: tesisPostgradeInstance, field: "tesisPosCountry")}</td>
					
						<td>${fieldValue(bean: tesisPostgradeInstance, field: "tesisPosUniversity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tesisPostgradeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
