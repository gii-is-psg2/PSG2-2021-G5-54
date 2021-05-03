<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="adoptions">
    <h2>
    <div class="es">Adopciones</div>
    <div class="en">Adoptions</div>
    </h2>

    <table id="adoptionsTable" class="table table-striped table-header">
        <thead>
        <tr>
            <th style="width: 150px;"><div class="es">Nombre</div><div class="en">Name</div></th>
            <th style="width: 150px;"><div class="es">Fecha de Nacimiento</div><div class="en">Birth Date</div></th>
            <th style="width: 150px;"><div class="es">Tipo</div><div class="en">Type</div></th>
			<th style="width: 150px;"><div class="es">Info</div><div class="en">Info</div></th>
            <th style="width: 150px;"><div class="es">Opciones</div><div class="en">Options</div></th>
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
                			<a href='<spring:url value="/adoption/${adopcion.id}/requests/new" htmlEscape="true"/>'><div class="es">Solicitar</div><div class="en">Request</div></a>
                			</c:if>
                		
                		</c:if>
 
                    <c:if test="${adopcion.pet.owner.user.username == username}">
                    <a href='<spring:url value="/adoption/${adopcion.id}/requests" htmlEscape="true"/>'><div class="es">Solicitudes</div><div class="en">Requests</div></a>
                    </c:if>
                    
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
