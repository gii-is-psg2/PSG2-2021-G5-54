<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>



<petclinic:layout pageName="causes">

    <h2>Causes</h2>
    <div class="table-title">
        <table id="causesTable" class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Organization</th>
                <th>Budget Target</th>
                <th>Current budget</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${causes}" var="cause">
                <tr>
                    <td>
                        <c:out value="${cause.name}"/>
                    </td>
                    <td>
                        <c:out value="${cause.description}"/>
                    </td>
                    <td>
                        <c:out value="${cause.org}"/>
                    </td>
                    <td>
                        <c:out value="${cause.bTarget}"/>
                    </td>
                    <td>
                        <c:out value="${cause.currentB}"/>
                    </td>
                    <td>
                        <c:out value="${cause.status}"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</petclinic:layout>
