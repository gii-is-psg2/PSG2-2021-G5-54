<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="reservas">
<jsp:body>
    <h2>
        Reserva
    </h2>
    <form:form modelAttribute="reserva" class="form-horizontal" id="add-reserva-form" action="/reservas/save">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Fecha inicio" name="fechaInicio"/>
            <petclinic:inputField label="Fecha fin" name="fechaFin"/>
            <petclinic:selectFieldMap name="pet" label="Mascota" names="${mascotas}" size="5"/>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <input type="hidden" name="id" value="${reserva.id}"/>
               <button class="btn btn-default" type="submit">Guardar</button>
            </div>
        </div>
    </form:form>
    </jsp:body>
</petclinic:layout>