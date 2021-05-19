<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="adoptions">
    <h2><spring:message code="head.adoption"/></h2>

    <table id="adoptionsTable" class="table table-striped table-header">
        <thead>
        <tr>
            <th style="width: 150px;"><spring:message code="table.name"/></th>
            <th style="width: 150px;"><spring:message code="table.birth"/></th>
            <th style="width: 150px;"><spring:message code="table.type"/></th>
			<th style="width: 150px;"><spring:message code="table.info"/></th>
            <th style="width: 150px;"><spring:message code="table.options"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${adoptions}" var="adopcion">
            <tr>
                <td>
                    <c:out value="${adopcion.pet.name}"/>
                </td>
                <td>
                    <petclinic:localDate date="${adopcion.pet.birthDate}" pattern="yyyy-MM-dd"/>
                </td>
                 <td>
                    <c:out value="${adopcion.pet.type.name}"/>
                </td>
                 <td>
                    <c:out value="${adopcion.description}"/>
                </td>
                <td>
                		<c:if test="${adopcion.pet.owner.user.username ne username}">
                			<c:set var="aux" value="0"></c:set>
                			<c:forEach var="solic" items="${listaSolicitudes}">
                				<c:if test="${solic.newOwner.user.username == username && solic.adoption.id == adopcion.id}">
                					<c:set var="aux" value="1"></c:set>
                				</c:if>
                			</c:forEach>
                			<c:if test="${aux!=1}">
                			<a href='<spring:url value="/adoption/${adopcion.id}/requests/new" htmlEscape="true"/>'><spring:message code="button.request"/></a>
                			</c:if>
                		
                		</c:if>
 
                    <c:if test="${adopcion.pet.owner.user.username == username}">
                    <a href='<spring:url value="/adoption/${adopcion.id}/requests" htmlEscape="true"/>'><spring:message code="button.requests"/></a>
                    </c:if>
                    
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
