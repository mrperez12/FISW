<%@ page import="activities.Congress"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Asistencias a Congresos</title>
</head>
<body>
<div class="content scaffold-list" role="main">
    <h1>Asistencias a Congresos </h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="nameCongress" title="Nombre Congreso"/>
            <g:sortableColumn property="date" title="Fecha"/>
            <g:sortableColumn property="cityCongress" title="Ciudad"/>
            <g:sortableColumn property="countryCongress" title="Pais"/>
            <g:sortableColumn property="poster" title="Poster"/>
            <g:sortableColumn property="filename" title="Archivo" />
            <g:sortableColumn property="uploadDate" title="Fecha de Subida" />
        </tr>
        </thead>
        <tbody>
        <g:if test="${sec.loggedInUserInfo(field:"id")} == ${congressInstance?.user?.id}" >
        <g:each in="${congressInstanceList}" status="i" var="congressInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${congressInstance.id}">${fieldValue(bean: congressInstance, field: "nameCongress")}</g:link></td>
                <td>${congressInstance.date}</td>
                <td>${congressInstance.cityCongress}</td>
                <td>${congressInstance.countryCongress}</td>
                <td>${congressInstance.poster}</td>
                <td><g:link action="download" id="${congressInstance.id}">${congressInstance.filename}</g:link></td>
                <td><g:formatDate date="${congressInstance.uploadDate}" /></td>
            </tr>
        </g:each>
        </g:if>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${congressInstanceTotal}" />
    </div>
    <div class="nav" role="navigation">
        <ul><li><g:link class="create" action="create">Subir Congreso</g:link></li></ul>
    </div>
</div>
</body>
</html>