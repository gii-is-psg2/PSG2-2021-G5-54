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
                <th>Name</th>
                <td><b><c:out value="${cause.name}"/></b></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><b><c:out value="${cause.description}"/></b></td>
            </tr>
            <tr>
                <th>Organization</th>
                <td><b><c:out value="${cause.org}"/></b></td>
            </tr>
            <tr>
                <th>Budget Target</th>
                <td><b><c:out value="${cause.bTarget}"/></b></td>
            </tr>
            <tr>
                <th>Current Budget</th>
                <td><b><c:out value="${cause.currentB}"/></b></td>
            </tr>
            <tr>
                <th>Status</th>
                <td><b><c:out value="${cause.status}"/></b></td>
            </tr>
        </table>
    </div>

    <h3>Donations</h3>
    <div class="table-title">
        <table id="donationsTable" class="table table-striped">
            <thead>
            <tr>
                <th>Payer</th>
                <th>Quantity</th>
                <th>Date</th>
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
