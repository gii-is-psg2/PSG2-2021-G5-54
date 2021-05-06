<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="acceptRequest">
        <h2>
            <div class="es">Aceptar Solicitud</div><div class="en">Accept Request</div>
        </h2>

        <div>
            <table id="requestsTable" class="table table-striped table-header">
                <thead>
                <tr>
                    <th style="width: 150px;"><div class="es">Nombre</div><div class="en">Name</div></th>
                    <th style="width: 150px;"><div class="es">Dirección</div><div class="en">Address</div></th>
                    <th style="width: 150px;"><div class="es">Teléfono</div><div class="en">Phone</div></th>
                    <th style="width: 150px;"><div class="es">Fecha</div><div class="en">Date</div></th>
                    <th style="width: 150px;">Info</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <c:out value="${request.newOwner.firstName} "/><c:out value="${request.newOwner.lastName}"/>
                        </td>
                        <td>
                            <c:out value="${request.newOwner.address}"/>
                        </td>
                        <td>
                            <c:out value="${request.newOwner.telephone}"/>
                        </td>
                        <td>
                            <c:out value="${request.requestDate}"/>
                        </td>
                        <td>
                            <c:out value="${request.info}"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <form:form modelAttribute="solicitud" class="form-horizontal" id="add-adoption-form">
            <div class="form-group">
               <div class="col-sm-offset-2 col-sm-3"></div>
                   <button class="btn  btn-success" type="submit"><div class="es">Confirmar</div><div class="en">Confirm</div>></button>
               </div>
           </div>
       </form:form>
</petclinic:layout>