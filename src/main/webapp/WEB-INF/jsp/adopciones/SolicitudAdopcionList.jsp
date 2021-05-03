<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="solicitudes"> 
	<h2>Solicitudes</h2>
	<table id="Tablasolicitudes" class="table table-striped">
	<thead>
		<tr>

			<th style="width: 100px;">Nombre de la mascota</th>
			<th style="width: 100px;">Especie</th>
			<th style="width: 100px;">Direccion</th>
			<th style="width: 100px;">Ciudad</th>
			<th style="width: 100px;">Descripcion</th>
			<th style="width: 100px;">aceptar</th>
			<th style="width: 100px;">denegar</th>
		</tr>
		</thead>
			<tbody>
			<c:forEach items="${solicitudes}" var="solicitudes">
				<tr>
					<td><c:out value="${solicitudes.adopcion.pet.name}" /></td>
					<td><c:out value="${solicitudes.adopcion.pet.type}" /></td>
					<td><c:out value="${solicitudes.adopcion.owner.address}" /></td>
					<td><c:out value="${solicitudes.adopcion.owner.city}" /></td>
					<td><c:out value="${solicitudes.descripcion}" /></td>
					<td><spring:url value="/adopciones/{adoptionId}/{adoptionRequestId}/aceptar" var="adoption">
							<spring:param name="adoptionId" value="${solicitudes.adopcion.id}" />
							<spring:param name="adoptionRequestId" value="${solicitudes.id}" />
						</spring:url> <a href="${fn:escapeXml(adoption)}" class="btn btn-default">Aceptar</a>
					</td>
					<td><spring:url value="/adopciones/{adoptionId}/{adoptionRequestId}/denegar" var="adoption">
							<spring:param name="adoptionId" value="${solicitudes.adopcion.id}" />
							<spring:param name="adoptionRequestId" value="${solicitudes.id}" />
						</spring:url> <a href="${fn:escapeXml(adoption)}" class="btn btn-default">Denegar</a>
					</td>
				</tr>

			</c:forEach>
		</tbody>
	
	</table>
</petclinic:layout>
