<%@ page import="user.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userProfile.name.label" default="Nombre:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${userProfileInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="userProfile.lastName.label" default="Apellidos:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${userProfileInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'studiesPre', 'error')} required">
	<label for="studiesPre">
		<g:message code="userProfile.studiesPre.label" default="Estudios de Pregrado:" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="studiesPre" value="${userProfileInstance?.studiesPre}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'university', 'error')} required">
    <label for="university">
        <g:message code="userProfile.university.label" default="Universidad:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="university" value="${userProfileInstance?.university}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="userProfile.country.label" default="Pais:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="country" value="${userProfileInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'studiesPos', 'error')} ">
	<label for="studiesPos">
		<g:message code="userProfile.studiesPos.label" default="Estudios de Postgrado:" />
		
	</label>
	<g:textField name="studiesPos" value="${userProfileInstance?.studiesPos}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'universityPos', 'error')} ">
    <label for="universityPos">
        <g:message code="userProfile.universityPos.label" default="Universidad:" />

    </label>
    <g:textField name="universityPos" value="${userProfileInstance?.universityPos}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'countryPos', 'error')} ">
    <label for="countryPos">
        <g:message code="userProfile.countryPos.label" default="Pais:" />

    </label>
    <g:textField name="countryPos" value="${userProfileInstance?.countryPos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'labCharge', 'error')} required">
	<label for="labCharge">
		<g:message code="userProfile.labCharge.label" default="Cargo de Laboratorio:" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="labCharge" from="${userProfileInstance.constraints.labCharge.inList}" required="" value="${userProfileInstance?.labCharge}" valueMessagePrefix="userProfile.labCharge"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'investigation', 'error')} required">
	<label for="investigation">
		<g:message code="userProfile.investigation.label" default="Area de Investigacion:" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="investigation" from="${userProfileInstance.constraints.investigation.inList}" required="" value="${userProfileInstance?.investigation}" valueMessagePrefix="userProfile.investigation"/>
</div>

