
<%@ page import="book.Books"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
</head>
<body>
<div class="content scaffold-list" role="main">
    <h1>Publicaciones en Libros</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for Books:</label>
                <g:textField name="query" value="${params.query}"/>
            </div>
        </g:form>
    </fieldset>
    <table>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="author" title="Autor"/>
            <g:sortableColumn property="title" title="Titulo"/>
            <g:sortableColumn property="date" title="Fecha"/>
            <g:sortableColumn property="isbn" title="ISBN"/>
            <g:sortableColumn property="editorial" title="Editorial"/>
            <g:sortableColumn property="filename" title="Archivo" />
            <g:sortableColumn property="uploadDate" title="Fecha subida" />
        </tr>
        </thead>
        <tbody>
        <g:if test="${sec.loggedInUserInfo(field:"id")} == ${booksInstance?.user?.id}" >
        <g:each in="${booksInstanceList}" status="i" var="booksInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${booksInstance.id}">${fieldValue(bean: booksInstance, field: "author")}</g:link></td>
                <td>${booksInstance.title}</td>
                <td>${booksInstance.date}</td>
                <td>${booksInstance.isbn}</td>
                <td>${booksInstance.editorial}</td>
                <td><g:link action="download" id="${booksInstance.id}">${booksInstance.filename}</g:link></td>
                <td><g:formatDate date="${booksInstance.uploadDate}" /></td>
            </tr>
        </g:each>
        </g:if>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${booksInstanceTotal}" />
    </div>
    <div class="nav" role="navigation">
        <ul><li><g:link class="create" action="create">Nueva Publicacion en Libro</g:link></li></ul>
    </div>
</div>
</body>
</html>