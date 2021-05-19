<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="owners">
    <h2>
        <c:if test="${owner['new']}"><spring:message code="text.new"/></c:if> <spring:message code="text.owner"/>
    </h2>
    <form:form modelAttribute="owner" class="form-horizontal" id="add-owner-form">
        <div class="form-group has-feedback">
            <petclinic:inputField translate="yes" label="form.firstname" name="firstName"/>
            <petclinic:inputField translate="yes" label="form.surname" name="lastName"/>
            <petclinic:inputField translate="yes" label="form.address" name="address"/>
            <petclinic:inputField translate="yes" label="form.city" name="city"/>
            <petclinic:inputField translate="yes" label="form.phone" name="telephone"/>
            <petclinic:inputField translate="yes" label="form.user" name="user.username"/>
            <petclinic:inputField translate="yes" label="form.pass" name="user.password"/>    
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${owner['new']}">
                        <button class="btn btn-default" type="submit"><spring:message code="button.add"/></button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit"><spring:message code="button.update"/></button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>
