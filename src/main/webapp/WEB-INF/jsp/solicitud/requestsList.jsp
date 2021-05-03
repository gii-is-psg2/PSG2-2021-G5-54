<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="requests">
    <h2><div class="es">Solicitudes</div><div class="en">Requests</div></h2>

    <table id="requestsTable" class="table table-striped table-header">
        <thead>
        <tr>
             <th style="width: 150px;"><div class="es">Nombre</div><div class="en">Name</div></th>
             <th style="width: 150px;"><div class="es">Dirección</div><div class="en">Address</div></th>
             <th style="width: 150px;"><div class="es">Teléfono</div><div class="en">Phone</div></th>
             <th style="width: 150px;"><div class="es">Fecha</div><div class="en">Date</div></th>
             <th style="width: 150px;">Info</th>
			<th style="width: 150px;"><div class="es">Opciones</div><div class="en">Options</div></th>
            
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requests}" var="request">
            <tr>
                <td>
                    <c:out value="${request.newOwner.firstName} "/><c:out value="${request.newOwner.lastName}"/>
                </td>
                <td>
                    <c:out value="${request.newOwner.address}"/>
                </td>
                <td>
                    <c:out value="${request.newOwner.telephone}"/>
                </td>
                <td>
                    <c:out value="${request.requestDate}"/>
                </td>
                <td>
                    <c:out value="${request.info}"/>
                </td>
                <c:choose>
                	<c:when test="${username == request.adoption.pet.owner.user.username}">
                    	<td>
                    		<a href='<spring:url value="/adoption/${request.adoption.id}/requests/${request.id}/accept" htmlEscape="true"/>'>
                    		<div class="es">Aceptar</div><div class="en">Accept</div>
                    		</a>
                		</td>
                    </c:when>
                    
                </c:choose>
  
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
