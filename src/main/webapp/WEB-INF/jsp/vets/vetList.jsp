<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="vets">
    <div class="es"><h2>Veterinarios</h2></div>
    <div class="en"><h2>Vets</h2></div>

    <table id="vetsTable" class="table table-striped">
        <thead>
        <tr>
            <th><div class="es">Nombre</div><div class="en">Name</div></th>
            <th><div class="es">Especialidad</div><div class="en">Specialty</div></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vets.vetList}" var="vet">
            <tr>
                <td>
                    <c:out value="${vet.firstName} ${vet.lastName}"/>
                </td>
                <td>
                    <c:forEach var="specialty" items="${vet.specialties}">
                        <c:out value="${specialty.name} "/>
                    </c:forEach>
                    <div class="es"><c:if test="${vet.nrOfSpecialties == 0}">ninguna</c:if></div>
                    <div class="en"><c:if test="${vet.nrOfSpecialties == 0}">none</c:if></div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <table class="table-buttons">
        <tr>
            <td>
                <div class="es"><a href="<spring:url value="/vets.xml" htmlEscape="true" />">Ver como XML</a></div>
                <div class="en"><a href="<spring:url value="/vets.xml" htmlEscape="true" />">See as XML</a></div>
            </td>            
        </tr>
    </table>
</petclinic:layout>
