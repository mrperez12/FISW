<%@ page import="magazine.Magazines" %>

<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'authorMagazine', 'error')} required">
	<label for="authorMagazine">
		<g:message code="magazines.authorMagazine.label" default="Autor del Articulo:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authorMagazine" required="" value="${magazinesInstance?.authorMagazine}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'titleMagazine', 'error')} required">
    <label for="titleMagazine">
        <g:message code="magazines.titleMagazine.label" default="Titulo:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="titleMagazine" required="" value="${magazinesInstance?.titleMagazine}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'magazine', 'error')} required">
    <label for="magazine">
        <g:message code="magazines.magazine.label" default="Revista:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="magazine" required="" value="${magazinesInstance?.magazine}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'year', 'error')} required">
    <label for="year">
        <g:message code="magazines.year.label" default="Año:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="year" required="" value="${magazinesInstance?.year}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'keywords', 'error')} required">
	<label for="keywords">
		<g:message code="magazines.keywords.label" default="Keywords:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="keywords" required="" value="${magazinesInstance?.keywords}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'areaMagazine', 'error')} required">
    <label for="areaMagazine">
        <g:message code="magazines.areaMagazine.label" default="Area de Investigacion:" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="areaMagazine" from="${magazinesInstance.constraints.areaMagazine.inList}" required="" value="${magazinesInstance?.areaMagazine}" valueMessagePrefix="magazines.areaMagazine"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazinesInstance, field: 'user', 'error')} required" style="display:none ">
	<label for="user">
		<g:message code="magazines.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field: "id")}"  required="" value="${magazinesInstance?.user?.id}" class="many-to-one"/>

</div>


