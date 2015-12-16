<%@ page import="tesisPre.TesisPregrade"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Tesis</title>
</head>
<body>
<div class="content scaffold-list" role="main">
    <h1>Tesis de Pregrado</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="nameTesis" title="Tesis"/>
            <g:sortableColumn property="tesisUniversity" title="Universidad"/>
            <g:sortableColumn property="tesisCountry" title="Pais"/>
            <g:sortableColumn property="tutorName" title="Tutor"/>
            <g:sortableColumn property="cotutorName" title="Cotutor"/>
            <g:sortableColumn property="filename" title="Archivo" />
        </tr>
        </thead>
        <tbody>
        <g:if test="${sec.loggedInUserInfo(field:"id")} == ${tesisPregradeInstance?.user?.id}" >
            <g:each in="${tesisPregradeInstanceList}" status="i" var="tesisPregradeInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="show" id="${tesisPregradeInstance.id}">${fieldValue(bean: tesisPregradeInstance, field: "nameTesis")}</g:link></td>
                    <td>${tesisPregradeInstance.tesisUniversity}</td>
                    <td>${tesisPregradeInstance.tesisCountry}</td>
                    <td>${tesisPregradeInstance.tutorName}</td>
                    <td>${tesisPregradeInstance.cotutorName}</td>
                    <td><g:link action="download" id="${tesisPregradeInstance.id}">${tesisPregradeInstance.filename}</g:link></td>
                </tr>
            </g:each>
        </g:if>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${tesisPregradeInstanceTotal}" />
    </div>
    <div class="nav" role="navigation">
        <g:if test="${tesisPregradeInstance?.count ()} == 0">
        <ul><li><g:link class="create" action="create">Subir Tesis</g:link></li></ul>
        </g:if>
    </div>
</div>
</body>
</html>