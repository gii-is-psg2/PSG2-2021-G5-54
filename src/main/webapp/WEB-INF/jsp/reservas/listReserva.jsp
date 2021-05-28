<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<petclinic:layout pageName="reservas">
    <h2><spring:message code="head.books"/></h2>
        <table id="reservasTable" class="table">
        <thead>
        <tr>
            <th><spring:message code="table.date_in"/></th>
            <th><spring:message code="table.date_end"/></th>
            <th><spring:message code="text.pet"/></th>             
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reserva}" var="reserva">
            <tr class="active">     
                <td>                    
                    <c:out value="${reserva.fechaInicio}"/>
                </td>
                <td>
                    <c:out value="${reserva.fechaFin}"/>
                </td>
                <td>
                    <c:out value="${reserva.pet}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <sec:authorize access="hasAuthority('owner')">
    	<a class="btn btn-default" href='<spring:url value="/reservas/new" htmlEscape="true"/>'><spring:message code="button.add"/></a>
	</sec:authorize>
</petclinic:layout>