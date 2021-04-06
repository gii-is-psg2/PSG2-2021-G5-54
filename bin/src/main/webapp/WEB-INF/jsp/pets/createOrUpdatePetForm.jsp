<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="owners">
    <jsp:attribute name="customScript">
        <script>
            $(function () {
                $("#birthDate").datepicker({dateFormat: 'yy/mm/dd'});
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <h2>
            <div class="es"><c:if test="${pet['new']}">Nueva </c:if> Mascota</div>
            <div class="en"><c:if test="${pet['new']}">New </c:if> Pet</div>
        </h2>
        <form:form modelAttribute="pet"
                   class="form-horizontal">
            <input type="hidden" name="id" value="${pet.id}"/>
            <div class="form-group has-feedback">
                <div class="form-group">
                    <div class="es"><label class="col-sm-2 control-label">Dueño</label></div>
                    <div class="en"><label class="col-sm-2 control-label">Owner</label></div>
                    <div class="col-sm-10">
                        <c:out value="${pet.owner.firstName} ${pet.owner.lastName}"/>
                    </div>
                </div>
                <div class="es">
                <petclinic:inputField label="Nombre" name="name"/>
                <petclinic:inputField label="Fecha de Nacimiento" name="birthDate"/>
                </div>
                <div class="en">
                <petclinic:inputField label="Name" name="name"/>
                <petclinic:inputField label="Birth Date" name="birthDate"/>
                </div>
                <div class="control-group">
                    <div class="es">
                    <petclinic:selectField name="type" label="Tipo " names="${types}" size="5"/>
                    </div>
                    <div class="en">
                    <petclinic:selectField name="type" label="Type " names="${types}" size="5"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <c:choose>
                        <c:when test="${pet['new']}">
                            <div class="es"><button class="btn btn-default" type="submit">Añadir Mascota</button></div>
                            <div class="en"><button class="btn btn-default" type="submit">Add Pet</button></div>
                        </c:when>
                        <c:otherwise>
                            <div class="es"><button class="btn btn-default" type="submit">Actualizar Mascota</button></div>
                            <div class="en"><button class="btn btn-default" type="submit">Update Pet</button></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </form:form>
        <c:if test="${!pet['new']}">
        </c:if>
    </jsp:body>
</petclinic:layout>
