
<%@ page import="book.Books" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'books.label', default: 'Books')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-books" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-books" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="author" title="${message(code: 'books.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'books.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="editorial" title="${message(code: 'books.editorial.label', default: 'Editorial')}" />
					
						<g:sortableColumn property="file" title="${message(code: 'books.file.label', default: 'File')}" />
					
						<g:sortableColumn property="isbn" title="${message(code: 'books.isbn.label', default: 'Isbn')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'books.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${booksInstanceList}" status="i" var="booksInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${booksInstance.id}">${fieldValue(bean: booksInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: booksInstance, field: "date")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "editorial")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "file")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "isbn")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${booksInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
