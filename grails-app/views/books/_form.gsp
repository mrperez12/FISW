<%@ page import="book.Books" %>



<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="books.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${booksInstance?.author}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="books.date.label" default="Date" />
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

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'file', 'error')} required">
	<label for="file">
		<g:message code="books.file.label" default="File" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="file" name="file" />

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="books.isbn.label" default="Isbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isbn" required="" value="${booksInstance?.isbn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="books.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${booksInstance?.title}"/>

</div>

