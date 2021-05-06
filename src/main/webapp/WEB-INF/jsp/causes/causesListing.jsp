<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


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
                        <spring:url value="/causes/{causeID}" var="causeURL">
                            <spring:param name="causeID" value="${cause.id}"/>
                        </spring:url>
                        <a href="${fn:escapeXml(causeURL)}"><c:out value="${cause.name}"/></a>
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
                    <sec:authorize access="hasAuthority('owner')">
                        <c:choose>
                            <c:when test="${cause.status == 'CLOSED'}">
                                <td>
                                    <c:out value="Unable to donate"/>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <spring:url value="causes/{causeId}/donate" var="donateURL">
                                        <spring:param name="causeId" value="${cause.id}"/>
                                    </spring:url>
                                    <a href="${fn:escapeXml(donateURL)}" class="btn btn-default">Donate</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </sec:authorize>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <sec:authorize access="hasAuthority('owner')">
        <button class="btn btn-default" onclick="window.location.href = '/causes/new'">New Cause</button>
    </sec:authorize>

</petclinic:layout>
