<%@ page import="tesisPos.TesisPostgrade"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Tesis de Postgrado</title>
</head>
<body>
<div class="content scaffold-list" role="main">
    <h1>Tesis de Postgrado</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <fieldset class="form">
        <g:form action="list" method="GET">
            <div class="fieldcontain">
                <label for="query">Search for Postgrade Thesis:</label>
                <g:textField name="query" value="${params.query}"/>
            </div>
        </g:form>
    </fieldset>
    <table>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="nameTesisPos" title="Tesis"/>
            <g:sortableColumn property="tesisPosUniversity" title="Universidad"/>
            <g:sortableColumn property="tesisPosCountry" title="Pais"/>
            <g:sortableColumn property="tutorPosName" title="Tutor"/>
            <g:sortableColumn property="cotutoPosrName" title="Cotutor"/>
            <g:sortableColumn property="filename" title="Archivo" />
        </tr>
        </thead>
        <tbody>
        <g:if test="${sec.loggedInUserInfo(field:"id")} == ${tesisPostgradeInstance?.user?.id}" >
            <g:each in="${tesisPostgradeInstanceList}" status="i" var="tesisPostgradeInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="show" id="${tesisPostgradeInstance.id}">${fieldValue(bean: tesisPostgradeInstance, field: "nameTesisPos")}</g:link></td>
                    <td>${tesisPostgradeInstance.tesisPosUniversity}</td>
                    <td>${tesisPostgradeInstance.tesisPosCountry}</td>
                    <td>${tesisPostgradeInstance.tutorPosName}</td>
                    <td>${tesisPostgradeInstance.cotutorPosName}</td>
                    <td><g:link action="download" id="${tesisPostgradeInstance.id}">${tesisPostgradeInstance.filename}</g:link></td>
                </tr>
            </g:each>
        </g:if>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${tesisPostgradeInstanceTotal}" />
    </div>
    <div class="nav" role="navigation">
            <ul><li><g:link class="create" action="create">Subir Tesis</g:link></li></ul>
    </div>
</div>
</body>
</html>