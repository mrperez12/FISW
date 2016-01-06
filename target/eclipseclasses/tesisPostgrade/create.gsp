<%@ page import="tesisPos.TesisPostgrade" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>Subir Tesis de Postgrado</title>
</head>
<body>
<div class="content scaffold-create" role="main">
	<h1>Subir Tesis de Postgrado</h1>
	<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
	<g:uploadForm action="upload">
		<fieldset class="form">
			<g:render template="form"/>
			<br>
			<input type="file" name="file" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="upload" class="save" value="Upload" />
            <g:link class="list" action="list">Ver Tesis</g:link>
		</fieldset>
	</g:uploadForm>
</div>
</body>
</html>
