
<%@ page import="book.Books" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'books.label', default: 'Books')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-books" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-books" class="content scaffold-show" role="main">
			<h1>Detalles de Publicacion</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list books">
			
				<g:if test="${booksInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="books.author.label" default="Autor" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${booksInstance}" field="author"/></span>
					
				</li>
				</g:if>
                <g:if test="${booksInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label"><g:message code="books.title.label" default="Titulo:" /></span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${booksInstance}" field="title"/></span>

                    </li>
                </g:if>
			
				<g:if test="${booksInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="books.date.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:fieldValue bean="${booksInstance}" field="date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.editorial}">
				<li class="fieldcontain">
					<span id="editorial-label" class="property-label"><g:message code="books.editorial.label" default="Editorial" /></span>
					
						<span class="property-value" aria-labelledby="editorial-label"><g:fieldValue bean="${booksInstance}" field="editorial"/></span>
					
				</li>
				</g:if>
				<g:if test="${booksInstance?.filename}">
					<li class="fieldcontain">
						<span id="filename-label" class="property-label"><g:message code="books.filename.label" default="Archivo:" /></span>

						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${booksInstance}" field="filename"/></span>

					</li>
				</g:if>
			
				<g:if test="${booksInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="books.isbn.label" default="ISBN" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${booksInstance}" field="isbn"/></span>
					
				</li>
				</g:if>

			
			</ol>
			<g:form url="[resource:booksInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list">Ver Lista</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
