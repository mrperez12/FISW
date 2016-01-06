
<%@ page import="tesisPre.TesisPregrade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tesisPregrade.label', default: 'TesisPregrade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tesisPregrade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tesisPregrade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'tesisPregrade.filename.label', default: 'Filename')}" />
					
						<g:sortableColumn property="fullPath" title="${message(code: 'tesisPregrade.fullPath.label', default: 'Full Path')}" />
					
						<g:sortableColumn property="cotutorName" title="${message(code: 'tesisPregrade.cotutorName.label', default: 'Cotutor Name')}" />
					
						<g:sortableColumn property="nameTesis" title="${message(code: 'tesisPregrade.nameTesis.label', default: 'Name Tesis')}" />
					
						<g:sortableColumn property="tesisCountry" title="${message(code: 'tesisPregrade.tesisCountry.label', default: 'Tesis Country')}" />
					
						<g:sortableColumn property="tesisUniversity" title="${message(code: 'tesisPregrade.tesisUniversity.label', default: 'Tesis University')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tesisPregradeInstanceList}" status="i" var="tesisPregradeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tesisPregradeInstance.id}">${fieldValue(bean: tesisPregradeInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: tesisPregradeInstance, field: "fullPath")}</td>
					
						<td>${fieldValue(bean: tesisPregradeInstance, field: "cotutorName")}</td>
					
						<td>${fieldValue(bean: tesisPregradeInstance, field: "nameTesis")}</td>
					
						<td>${fieldValue(bean: tesisPregradeInstance, field: "tesisCountry")}</td>
					
						<td>${fieldValue(bean: tesisPregradeInstance, field: "tesisUniversity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tesisPregradeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
