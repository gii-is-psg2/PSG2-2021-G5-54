<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="owners">
    <jsp:attribute name="customScript">
        <script>
            $(function () {
                $("#date").datepicker({dateFormat: 'yy/mm/dd'});
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="es"><h2><c:if test="${visit['new']}">Nueva </c:if>Visita</h2></div>
        <div class="en"><h2><c:if test="${visit['new']}">New </c:if>Visit</h2></div>

        <div class="es"><b>Mascota</b></div>
        <div class="en"><b>Pet</b></div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th><div class="es">Nombre</div><div class="en">Name</div></th>
                <th><div class="es">Fecha de Nacimiento</div><div class="en">Birth Address</div></th>
                <th><div class="es">Tipo</div><div class="en">Type</div></th>
                <th><div class="es">Dueño</div><div class="en">Owner</div></th>
            </tr>
            </thead>
            <tr>
                <td><c:out value="${visit.pet.name}"/></td>
                <td><petclinic:localDate date="${visit.pet.birthDate}" pattern="yyyy/MM/dd"/></td>
                <td><c:out value="${visit.pet.type.name}"/></td>
                <td><c:out value="${visit.pet.owner.firstName} ${visit.pet.owner.lastName}"/></td>
            </tr>
        </table>

        <form:form modelAttribute="visit" class="form-horizontal">
            <div class="form-group has-feedback">
            	<div class="es">
                <petclinic:inputField label="Fecha" name="date"/>
                <petclinic:inputField label="Descripción" name="description"/>
                </div>
                <div class="en">
                <petclinic:inputField label="Date" name="date"/>
                <petclinic:inputField label="Description" name="description"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="petId" value="${visit.pet.id}"/>
                    <div class="es"><button class="btn btn-default" type="submit">Añadir Visita</button></div>
                    <div class="en"><button class="btn btn-default" type="submit">Add Visit</button></div>
                </div>
            </div>
        </form:form>

        <br/>
        <div class="es"><b>Visitas Previas</b></div>
        <div class="en"><b>Previous Visits</b></div>
        <table class="table table-striped">
            <tr>
                <th><div class="es">Fecha</div><div class="en">Date</div></th>
                <th><div class="es">Descripción</div><div class="en">Description</div></th>
            </tr>
            <c:forEach var="visit" items="${visit.pet.visits}">
                <c:if test="${!visit['new']}">
                    <tr>
                        <td><petclinic:localDate date="${visit.date}" pattern="yyyy/MM/dd"/></td>
                        <td><c:out value="${visit.description}"/></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </jsp:body>

</petclinic:layout>
