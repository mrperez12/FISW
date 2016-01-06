<%@ page import="tesisPos.TesisPostgrade" %>

<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'nameTesisPos', 'error')} required">
	<label for="nameTesisPos">
		<g:message code="tesisPostgrade.nameTesisPos.label" default="Nombre Tesis:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameTesisPos" required="" value="${tesisPostgradeInstance?.nameTesisPos}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'tesisPosUniversity', 'error')} required">
    <label for="tesisPosUniversity">
        <g:message code="tesisPostgrade.tesisPosUniversity.label" default="Universidad:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="tesisPosUniversity" required="" value="${tesisPostgradeInstance?.tesisPosUniversity}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'tesisPosCountry', 'error')} required">
    <label for="tesisPosCountry">
        <g:message code="tesisPostgrade.tesisPosCountry.label" default="Pais:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="tesisPosCountry" required="" value="${tesisPostgradeInstance?.tesisPosCountry}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'tutorPosName', 'error')} required">
    <label for="tutorPosName">
        <g:message code="tesisPostgrade.tutorPosName.label" default="Tutor:" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tutorPosName" from="${security.User.list()}" required="" value="${tesisPostgradeInstance?.tutorPosName}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'cotutorPosName', 'error')}">
	<label for="cotutorPosName">
		<g:message code="tesisPostgrade.cotutorPosName.label" default="Cotutor:" />
	</label>
    <g:select name="cotutorPosName" from="${security.User.list()}" required="" value="${tesisPostgradeInstance?.cotutorPosName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tesisPostgradeInstance, field: 'user', 'error')} required" style="display: none">
	<label for="user">
		<g:message code="tesisPostgrade.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field: 'id')}" required="" value="${tesisPostgradeInstance?.user?.id}" class="many-to-one"/>

</div>

