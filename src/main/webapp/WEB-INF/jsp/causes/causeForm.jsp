<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="causes">

    <h2>New Cause</h2>
    <form:form name="causeForm" modelAttribute="cause">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Name" name="name"/>
            <petclinic:inputField label="Description" name="description"/>
            <petclinic:inputField label="Organization" name="org"/>
            <petclinic:inputField label="Budget Target" name="bTarget"/>
            <petclinic:inputField label="Current Budget" name="currentB"/>
        </div>
            <button class="btn btn-default" type="submit">add Cause</button>
    </form:form>
    <button class="btn btn-default" onclick="window.location.href = '/causes'">Cancel</button>
</petclinic:layout>
