<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<petclinic:layout pageName="reservas">
    <h2>Reservas</h2>
        <table id="reservasTable" class="table table-striped">
        <thead>
        <tr>
            <th>Fecha inicio</th>
            <th>Fecha fin</th>             
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reservas}" var="reserva">
            <tr>     
                <td>                    
                    <c:out value="${reserva.fechaInicio}"/>
                </td>
                <td>
                    <c:out value="${reserva.fechaFin}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <sec:authorize access="hasAuthority('admin')">
    	<a class="btn btn-default" href='<spring:url value="/reservas/new" htmlEscape="true"/>'>Añadir reserva</a>
	</sec:authorize>
</petclinic:layout>