<%@ page import="magazine.Magazines"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Publicaciones en Revistas</title>
</head>
<body>
<div class="content scaffold-list" role="main">
    <h1>Publicaciones en Revistas</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="authorMagazine" title="Autor"/>
            <g:sortableColumn property="titleMagazine" title="Titulo"/>
            <g:sortableColumn property="year" title="año"/>
            <g:sortableColumn property="magazine" title="Revista"/>
            <g:sortableColumn property="keywords" title="Keywords"/>
            <g:sortableColumn property="areaMagazine" title="Area"/>
            <g:sortableColumn property="filename" title="Archivo" />
            <g:sortableColumn property="uploadDate" title="Fecha de subida" />
        </tr>
        </thead>
        <tbody>
        <g:if test="${sec.loggedInUserInfo(field:"id")} == ${magazinesInstance?.user?.id}" >
            <g:each in="${magazinesInstanceList}" status="i" var="magazinesInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="show" id="${magazinesInstance.id}">${fieldValue(bean: magazinesInstance, field: "authorMagazine")}</g:link></td>
                    <td>${magazinesInstance.titleMagazine}</td>
                    <td>${magazinesInstance.year}</td>
                    <td>${magazinesInstance.magazine}</td>
                    <td>${magazinesInstance.keywords}</td>
                    <td>${magazinesInstance.areaMagazine}</td>
                    <td><g:link action="download" id="${magazinesInstance.id}">${magazinesInstance.filename}</g:link></td>
                    <td><g:formatDate date="${magazinesInstance.uploadDate}" /></td>
                </tr>
            </g:each>
        </g:if>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${magazinesInstanceTotal}" />
    </div>
    <div class="nav" role="navigation">
        <ul><li><g:link class="create" action="create">Subir Publicacion</g:link></li></ul>
    </div>
</div>
</body>
</html>