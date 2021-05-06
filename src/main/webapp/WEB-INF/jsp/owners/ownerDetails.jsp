<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ page pageEncoding="UTF-8" %>

<petclinic:layout pageName="owners">

	<div class="es"><h2>Detalles del Dueño</h2></div>
    <div class="en"><h2>Owner Details</h2></div>

    <table class="table table-striped">
        <tr>
            <th><div class="es">Nombre</div><div class="en">Name</div></th>
            <td><c:out value="${owner.firstName} ${owner.lastName}"/></td>
        </tr>
        <tr>
            <th><div class="es">Dirección</div><div class="en">Address</div></th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th><div class="es">Ciudad</div><div class="en">City</div></th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th><div class="es">Teléfono</div><div class="en">Phone number</div></th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
    </table>

    <spring:url value="{ownerId}/edit" var="editUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <div class="es"><a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar Dueño</a></div>
    <div class="en"><a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Edit Owner</a></div>

    <spring:url value="{ownerId}/pets/new" var="addUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <div class="es"><a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Añadir Nueva Mascota</a></div>
    <div class="en"><a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Add New Pet</a></div>

    <br/>
    <br/>
    <br/>
    
    <div class="es"><h2>Mascotas y Visitas</h2></div>
    <div class="en"><h2>Pets and Visits</h2></div>

    <table class="table table-striped">
        <c:forEach var="pet" items="${owner.pets}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt><div class="es">Nombre</div><div class="en">Name</div></dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt><div class="es">Fecha de Nacimiento</div><div class="en">Birth Date</div></dt>
                        <dd><petclinic:localDate date="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt><div class="es">Tipo</div><div class="en">Type</div></dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th><div class="es">Fecha de Visita</div><div class="en">Visit Date</div></th>
                            <th><div class="es">Descripción</div><div class="en">Description</div></th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><petclinic:localDate date="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <div class="es"><a href="${fn:escapeXml(petUrl)}">Editar Mascota</a></div>
                                <div class="en"><a href="${fn:escapeXml(petUrl)}">Edit Pet</a></div>
                            </td>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <div class="es"><a href="${fn:escapeXml(visitUrl)}">Añadir Visita</a></div>
                                <div class="en"><a href="${fn:escapeXml(visitUrl)}">Edit Visit</a></div>
                            </td>
                          
                          
                          <c:set var="aux" value="0"/>
                        <c:forEach var="adop" items="${la}">
                        	<c:choose>
                        		<c:when test="${adop.pet.id == pet.id}">
                        			<dt>Adopcion</dt>
                        			<dd>
                        			<a href='<spring:url value="/adoption/${adop.id}/requests" htmlEscape="true"/>'>Ver</a>
                        			<br/>
                        			<a href='<spring:url value="/adoption/${adop.id}/delete/owner/${owner.id}" htmlEscape="true"/>'>Eliminar</a>
                        			</dd>
                        			<c:set var="aux" value="1"/>
                        		</c:when>	
                        	</c:choose>
                        </c:forEach>
                        
                        
                        	
                        		<dt>
                           	 	<spring:url value="/adoption/pet/{petId}/new" var="adoptionUrl">
                              	 	 <spring:param name="petId" value="${pet.id}"/>
                            		</spring:url>
                           		 <a href="${fn:escapeXml(adoptionUrl)}">Solicitar</a>
                        		</dt>
                        
                            
                            <td class="text-left">
                				<a href="/owners/${owner.id}/pets/${pet.id}/delete">
                					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                				</a>
                			</td>  
                        </tr>
                    </table>
                </td>
            </tr>

        </c:forEach>
    </table>

</petclinic:layout>
