<%@ page import="proyect.Proyects" %>



<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="proyects.start.label" default="Fecha Inicio:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="start" value="${proyectsInstance?.start}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'finish', 'error')} required">
	<label for="finish">
		<g:message code="proyects.finish.label" default="Fecha Termino:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="finish" value="${proyectsInstance?.finish}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'proyectName', 'error')} required">
	<label for="proyectName">
		<g:message code="proyects.proyectName.label" default="Nombre Proyecto:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="proyectName" value="${proyectsInstance?.proyectName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'proyectCharge', 'error')} ">
	<label for="proyectCharge">
		<g:message code="proyects.proyectCharge.label" default="Cargo de Proyecto:" />
		
	</label>
	<g:textField name="proyectCharge" value="${proyectsInstance?.proyectCharge}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'others', 'error')} ">
	<label for="others">
		<g:message code="proyects.others.label" default="Otros:" />
		
	</label>
	<g:textField name="others" value="${proyectsInstance?.others}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectsInstance, field: 'user', 'error')} required" style="display: none">
	<label for="user">
		<g:message code="proyects.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field: 'id')}" required="" value="${proyectsInstance?.user?.id}" class="many-to-one"/>

</div>

