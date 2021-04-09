<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="donations">

    <h2>New Donation</h2>
    <form:form name="donationForm" modelAttribute="donation">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Quantity" name="quantity"/>
        </div>
        <button class="btn btn-default" type="submit">add Donation</button>
    </form:form>
    <button class="btn btn-default" onclick="window.location.href = '/causes'">Cancel</button>
</petclinic:layout>
