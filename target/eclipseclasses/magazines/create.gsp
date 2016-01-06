<%@ page import="magazine.Magazines" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>Subir Nueva Publicacion</title>
</head>
<body>
<div class="content scaffold-create" role="main">
	<h1>Subir Nueva Publicacion</h1>
	<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
	<g:uploadForm action="upload">
		<fieldset class="form">
			<g:render template="form"/>
			<br>
			<input type="file" name="file" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="upload" class="save" value="Upload" />
			<g:link class="list" action="list">Ver Lista</g:link>
		</fieldset>
	</g:uploadForm>
</div>
</body>
</html>
