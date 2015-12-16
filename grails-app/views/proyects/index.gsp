
<%@ page import="proyect.Proyects" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyects.label', default: 'Proyecto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<a href="#show-proyects" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-proyects" class="content scaffold-list" role="main">
			<h1>Proyectos</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="start" title="${message(code: 'proyects.start.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="finish" title="${message(code: 'proyects.finish.label', default: 'Fecha Termino')}" />
					
						<g:sortableColumn property="proyectName" title="${message(code: 'proyects.proyectName.label', default: 'Nombre de Proyecto')}" />
					
						<g:sortableColumn property="proyectCharge" title="${message(code: 'proyects.proyectCharge.label', default: 'Cargo')}" />
					
						<g:sortableColumn property="others" title="${message(code: 'proyects.others.label', default: 'Otros')}" />

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proyectsInstanceList}" status="i" var="proyectsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proyectsInstance.id}">${fieldValue(bean: proyectsInstance, field: "start")}</g:link></td>
					
						<td>${fieldValue(bean: proyectsInstance, field: "finish")}</td>
					
						<td>${fieldValue(bean: proyectsInstance, field: "proyectName")}</td>
					
						<td>${fieldValue(bean: proyectsInstance, field: "proyectCharge")}</td>
					
						<td>${fieldValue(bean: proyectsInstance, field: "others")}</td>

					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proyectsInstanceCount ?: 0}" />
			</div>
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
	</body>
</html>
