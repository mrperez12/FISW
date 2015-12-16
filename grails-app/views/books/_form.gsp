<%@ page import="book.Books" %>



<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="books.author.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${booksInstance?.author}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="books.date.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="date" required="" value="${booksInstance?.date}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'editorial', 'error')} required">
	<label for="editorial">
		<g:message code="books.editorial.label" default="Editorial" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="editorial" required="" value="${booksInstance?.editorial}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="books.isbn.label" default="ISBN" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isbn" required="" value="${booksInstance?.isbn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="books.title.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${booksInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstanceInstance, field: 'user', 'error')} required" style="display: none">
    <label for="user">
        <g:message code="books.user.label" default="User" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field:"id")}"  required="" value="${booksInstanceInstance?.user?.id}" class="many-to-one"/>
</div>

