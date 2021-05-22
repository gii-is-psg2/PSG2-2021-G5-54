<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>



<petclinic:layout pageName="owners">
    <h2><spring:message code="menu.owner"/></h2>


    <table id="ownersTable" class="table">
        <thead>
        <tr>
            <th style="width: 150px;"><spring:message code="table.name"/></th>
            <th style="width: 200px;"><spring:message code="form.address"/></th>
            <th><spring:message code="form.city"/></th>
            <th style="width: 120px"><spring:message code="form.phone"/></th>
            <th><spring:message code="head.pets"/></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${selections}" var="owner">
            <tr class="active">
                <td>
                
                    <spring:url value="/owners/{ownerId}" var="ownerUrl">
                        <spring:param name="ownerId" value="${owner.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(ownerUrl)}"><c:out value="${owner.firstName} ${owner.lastName}"/></a>
                </td>
                <td>
                    <c:out value="${owner.address}"/>
                </td>
                <td>
                    <c:out value="${owner.city}"/>
                </td>
                <td>
                    <c:out value="${owner.telephone}"/>
                </td>
                <td>
                    <c:forEach var="pet" items="${owner.pets}">
                        <c:out value="${pet.name} "/>
                    </c:forEach>
                </td>
                <td class="text-left">
                <sec:authorize access="hasAuthority('admin')">
                	<a href="/owners/${owner.id}/delete">
                		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                	</a>
                </sec:authorize>
                </td>          
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
