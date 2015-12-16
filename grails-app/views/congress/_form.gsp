<%@ page import="activities.Congress" %>



<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'nameCongress', 'error')} required">
	<label for="nameCongress">
		<g:message code="congress.nameCongress.label" default="Nombre:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameCongress" required="" value="${congressInstance?.nameCongress}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'cityCongress', 'error')} required">
	<label for="cityCongress">
		<g:message code="congress.cityCongress.label" default="Ciudad:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cityCongress" required="" value="${congressInstance?.cityCongress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'countryCongress', 'error')} required">
	<label for="countryCongress">
		<g:message code="congress.countryCongress.label" default="Pais:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="countryCongress" required="" value="${congressInstance?.countryCongress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="congress.date.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="date" required="" value="${congressInstance?.date}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'poster', 'error')} required">
	<label for="poster">
		<g:message code="congress.poster.label" default="Poster" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="poster" required="" value="${congressInstance?.poster}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: congressInstance, field: 'user', 'error')} required" style="display: none">
	<label for="user">
		<g:message code="congress.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field:"id")}"  required="" value="${congressInstance?.user?.id}" class="many-to-one"/>

</div>

