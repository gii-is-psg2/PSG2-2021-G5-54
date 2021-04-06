<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<script>
			    function validateForm(){
			    	var v_ini = document.forms["reservarForm"]["fechaInicio"].value;
			    	var v_fin = document.forms["reservarForm"]["fechaFin"].value;
			    	var v_regex = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
			    	if(!v_regex.test(v_ini) || v_ini == ""){
			    		alert("La fecha debe seguir el formato YYYY-MM-DD");
			            return false;
			    	}else if(!v_regex.test(v_fin) || v_fin == ""){
			    		alert("La fecha debe seguir el formato YYYY-MM-DD");
			            return false;
			    	}
			    	return true;
			    }
		    </script>

<petclinic:layout pageName="reservas">
<jsp:body>
    <h2>
        Reserva
    </h2>
    <form:form name="reservarForm" modelAttribute="reserva" class="form-horizontal" id="add-reserva-form" action="/reservas/save" onsubmit="return validateForm();">
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