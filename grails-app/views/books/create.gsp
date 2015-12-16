<%@ page import="book.Books" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>Subir nueva Publicacion en Libro</title>
</head>
<body>
<div class="content scaffold-create" role="main">
	<h1>Nueva publicacion en libro</h1>
	<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
	<g:uploadForm action="upload">
		<fieldset class="form">
			<g:render template="form"/>
            <br>
			<input type="file" name="file" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="upload" class="save" value="Subir" />
			<g:link class="list" action="list">Lista de Libros</g:link>
		</fieldset>
	</g:uploadForm>
</div>
</body>
</html>
