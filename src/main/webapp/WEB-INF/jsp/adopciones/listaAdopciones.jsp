<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="adopciones">
	<h2>Adopciones</h2>

	<table id="adoptarTable" class="table table-striped">
		<thead>
			<tr>
				<th style="width: 100px;">Nombre de la mascota</th>
				<th style="width: 100px;">Especie</th>
				<th style="width: 100px;">Direccion</th>
				<th style="width: 100px;">Ciudad</th>
				<th style="width: 100px;">Boton adoptar</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${adopciones}" var="adopcion">
				<tr>
					<td><c:out value="${adopcion.pet}" /></td>
					<td><c:out value="${adopcion.pet.type}" /></td>
					<td><c:out value="${adopcion.owner.address}" /></td>
					<td><c:out value="${adopcion.owner.city}" /></td>
					<td><spring:url value="/adopciones/{adopcionId}/adopcion"
							var="adopcion">
							<spring:param name="adopcionId" value="${adopcion.id}" />
						</spring:url> <a href="${fn:escapeXml(adopcion)}" class="btn btn-default">Adoptar</a></td>
						</tr>
						
			</c:forEach>





		</tbody>
	</table>










</petclinic:layout>