<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="adopcion">

	<h3>Detalle por qué desea adoptar a esta mascota</h3>

	<table>id="Tablaadopciones" class="table table-striped"
	</table>
	<thead>
		<tr>

			<th style="width: 100px;">Nombre de la mascota</th>
			<th style="width: 100px;">Especie</th>
			<th style="width: 100px;">Direccion</th>
			<th style="width: 100px;">Ciudad</th>
			<th style="width: 100px;">Telefono</th>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td><c:out value="${pet.name}" /></td>
			<td><c:out value="${pet.type}" /></td>
			<td><c:out value="${pet.owner.address}" /></td>
			<td><c:out value="${pet.city}" /></td>
		</tr>
	<tbody>
		</table>
		<form:form modelAttribute="solicitudAdopcion" id="add-adopcion-form">
			<div calss="form-group">
				<div>
					<petclinic:inputField label="Descripcion de la adopcion"
						name="descripcion" />

					<button class="btn btn-default" type="submit">Adoptar</button>
				</div>
			</div>
		</form:form>
</petclinic:layout>