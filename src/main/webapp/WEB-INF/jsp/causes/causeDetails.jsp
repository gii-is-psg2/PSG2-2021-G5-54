<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="causes">
    <div>
        <table class="table table-bordered table-striped">
            <tr>
                <th><spring:message code="table.name"/></th>
                <td><b><c:out value="${cause.name}"/></b></td>
            </tr>
            <tr>
                <th><spring:message code="table.info"/></th>
                <td><b><c:out value="${cause.description}"/></b></td>
            </tr>
            <tr>
                <th><spring:message code="table.org"/></th>
                <td><b><c:out value="${cause.org}"/></b></td>
            </tr>
            <tr>
                <th><spring:message code="table.obj_budg"/></th>
                <td><b><c:out value="${cause.bTarget}"/></b></td>
            </tr>
            <tr>
                <th><spring:message code="table.cur_budg"/></th>
                <td><b><c:out value="${cause.currentB}"/></b></td>
            </tr>
            <tr>
                <th>Status</th>
                <td><b><c:out value="${cause.status}"/></b></td>
            </tr>
        </table>
    </div>

    <h3><spring:message code="head.donations"/></h3>
    <div class="table-title">
        <table id="donationsTable" class="table table-striped">
            <thead>
            <tr>
                <th><spring:message code="head.patreon"/></th>
                <th><spring:message code="head.quantity"/></th>
                <th><spring:message code="head.date"/></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${donations}" var="donation">
                    <tr>
                        <td>
                            <c:out value="${donation.payer.firstName} ${donation.payer.lastName}"/>
                        </td>
                        <td>
                            <c:out value="${donation.quantity}"/>
                        </td>
                        <td>
                            <c:out value="${donation.date}"/>
                        </td>
                </c:forEach>
            </tbody>
        </table>
    </div>

</petclinic:layout>
