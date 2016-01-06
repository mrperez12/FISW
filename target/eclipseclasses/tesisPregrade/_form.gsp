<%@ page import="tesisPre.TesisPregrade" %>




<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'nameTesis', 'error')} required">
	<label for="nameTesis">
		<g:message code="tesisPregrade.nameTesis.label" default="Tesis:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameTesis" required="" value="${tesisPregradeInstance?.nameTesis}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'tesisUniversity', 'error')} required">
	<label for="tesisUniversity">
		<g:message code="tesisPregrade.tesisUniversity.label" default="Universidad:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tesisUniversity" required="" value="${tesisPregradeInstance?.tesisUniversity}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'tesisCountry', 'error')} required">
    <label for="tesisCountry">
        <g:message code="tesisPregrade.tesisCountry.label" default="Pais:" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="tesisCountry" required="" value="${tesisPregradeInstance?.tesisCountry}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'tutorName', 'error')} required">
	<label for="tutorName">
		<g:message code="tesisPregrade.tutorName.label" default="Tutor:" />
		<span class="required-indicator">*</span>
	</label>
    <g:select name="tutorName" from="${security.User.list()}"  required="" value="${tesisPregradeInstance?.tutorName}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'cotutorName', 'error')} required">
    <label for="cotutorName">
        <g:message code="tesisPregrade.cotutorName.label" default="Cotutor:" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="cotutorName" from="${security.User.list()}" required="" value="${tesisPregradeInstance?.cotutorName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tesisPregradeInstance, field: 'user', 'error')} required" style="display: none">
	<label for="user">
		<g:message code="tesisPregrade.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sec.loggedInUserInfo(field: 'id')}"  required="" value="${tesisPregradeInstance?.user?.id}" class="many-to-one"/>

</div>

