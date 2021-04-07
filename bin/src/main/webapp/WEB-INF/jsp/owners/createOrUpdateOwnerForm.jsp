<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="owners">
    <h2>
        <div class="es"><c:if test="${owner['new']}">Nuevo </c:if> Dueño</div>
        <div class="en"><c:if test="${owner['new']}">New </c:if> Owner</div>
    </h2>
    <form:form modelAttribute="owner" class="form-horizontal" id="add-owner-form">
        <div class="form-group has-feedback">
        	<div class="es">
            <petclinic:inputField label="Nombre" name="firstName"/>
            <petclinic:inputField label="Apellidos" name="lastName"/>
            <petclinic:inputField label="Dirección" name="address"/>
            <petclinic:inputField label="Ciudad" name="city"/>
            <petclinic:inputField label="Teléfono" name="telephone"/>
            <petclinic:inputField label="Usuario" name="user.username"/>
            <petclinic:inputField label="Contraseña" name="user.password"/>
            </div>
            <div class="en">
            <petclinic:inputField label="Name" name="firstName"/>
            <petclinic:inputField label="Surname" name="lastName"/>
            <petclinic:inputField label="Address" name="address"/>
            <petclinic:inputField label="City" name="city"/>
            <petclinic:inputField label="Phone Number" name="telephone"/>
            <petclinic:inputField label="User" name="user.username"/>
            <petclinic:inputField label="Password" name="user.password"/>
            </div>     
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${owner['new']}">
                        <div class="es"><button class="btn btn-default" type="submit">Añadir Dueño</button></div>
                        <div class="en"><button class="btn btn-default" type="submit">Add Owner</button></div>
                    </c:when>
                    <c:otherwise>
                        <div class="es"><button class="btn btn-default" type="submit">Actualizar Dueño</button></div>
                        <div class="en"><button class="btn btn-default" type="submit">Update Owner</button></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>
