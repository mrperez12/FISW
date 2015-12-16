
<%@ page import="magazine.Magazines" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'magazines.label', default: 'Magazines')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-magazines" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-magazines" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'magazines.filename.label', default: 'Filename')}" />
					
						<g:sortableColumn property="fullPath" title="${message(code: 'magazines.fullPath.label', default: 'Full Path')}" />
					
						<g:sortableColumn property="authorMagazine" title="${message(code: 'magazines.authorMagazine.label', default: 'Author Magazine')}" />
					
						<g:sortableColumn property="keywords" title="${message(code: 'magazines.keywords.label', default: 'Keywords')}" />
					
						<g:sortableColumn property="magazine" title="${message(code: 'magazines.magazine.label', default: 'Magazine')}" />
					
						<g:sortableColumn property="titleMagazine" title="${message(code: 'magazines.titleMagazine.label', default: 'Title Magazine')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${magazinesInstanceList}" status="i" var="magazinesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${magazinesInstance.id}">${fieldValue(bean: magazinesInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: magazinesInstance, field: "fullPath")}</td>
					
						<td>${fieldValue(bean: magazinesInstance, field: "authorMagazine")}</td>
					
						<td>${fieldValue(bean: magazinesInstance, field: "keywords")}</td>
					
						<td>${fieldValue(bean: magazinesInstance, field: "magazine")}</td>
					
						<td>${fieldValue(bean: magazinesInstance, field: "titleMagazine")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${magazinesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
