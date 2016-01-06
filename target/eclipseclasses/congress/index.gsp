
<%@ page import="activities.Congress" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congress.label', default: 'Congress')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-congress" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-congress" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'congress.filename.label', default: 'Filename')}" />
					
						<g:sortableColumn property="fullPath" title="${message(code: 'congress.fullPath.label', default: 'Full Path')}" />
					
						<g:sortableColumn property="cityCongress" title="${message(code: 'congress.cityCongress.label', default: 'City Congress')}" />
					
						<g:sortableColumn property="countryCongress" title="${message(code: 'congress.countryCongress.label', default: 'Country Congress')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'congress.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="nameCongress" title="${message(code: 'congress.nameCongress.label', default: 'Name Congress')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${congressInstanceList}" status="i" var="congressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${congressInstance.id}">${fieldValue(bean: congressInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: congressInstance, field: "fullPath")}</td>
					
						<td>${fieldValue(bean: congressInstance, field: "cityCongress")}</td>
					
						<td>${fieldValue(bean: congressInstance, field: "countryCongress")}</td>
					
						<td>${fieldValue(bean: congressInstance, field: "date")}</td>
					
						<td>${fieldValue(bean: congressInstance, field: "nameCongress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${congressInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
