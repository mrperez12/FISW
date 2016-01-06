
<%@ page import="user.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'userProfile.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="studiesPre" title="${message(code: 'userProfile.studiesPre.label', default: 'Studies Pre')}" />
					
						<g:sortableColumn property="studiesPos" title="${message(code: 'userProfile.studiesPos.label', default: 'Studies Pos')}" />
					
						<g:sortableColumn property="labCharge" title="${message(code: 'userProfile.labCharge.label', default: 'Lab Charge')}" />
					
						<g:sortableColumn property="investigation" title="${message(code: 'userProfile.investigation.label', default: 'Investigation')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "studiesPre")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "studiesPos")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "labCharge")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "investigation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userProfileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
