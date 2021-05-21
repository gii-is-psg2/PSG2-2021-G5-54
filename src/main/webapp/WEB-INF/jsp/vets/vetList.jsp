<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<petclinic:layout pageName="vets">
    <h2><spring:message code="menu.vet"/></h2>

    <table id="vetsTable" class="table table-striped">
        <thead>
        <tr>
            <th><spring:message code="table.name"/></th>
            <th><spring:message code="text.spec"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vets.vetList}" var="vet">
            <tr>
                <td>
                    <spring:url value="/vets/{vetId}/edit" var="vetUrl">
                        <spring:param name="vetId" value="${vet.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(vetUrl)}"><c:out value="${vet.firstName} ${vet.lastName}"/></a>
                </td>
                <td>
                 <c:out value="${vet.specialty} "/> 
               
                </td>
                <td class="text-left">
                	<a href="/vets/${vet.id}/delete">
                		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                	</a>
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
        
         <sec:authorize access="hasAuthority('admin')">
		<a class="btn btn-default" href='<spring:url value="/vets/new" htmlEscape="true"/>'>Add Vet</a>
	</sec:authorize>
    </table>
</petclinic:layout>
