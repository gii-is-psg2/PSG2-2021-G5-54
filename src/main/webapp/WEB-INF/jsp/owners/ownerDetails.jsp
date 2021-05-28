<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page pageEncoding="UTF-8" %>

<petclinic:layout pageName="owners">

	<h2><spring:message code="head.details"/></h2>

    <table class="table table-striped">
        <tr>
            <th><spring:message code="table.name"/></th>
            <td><c:out value="${owner.firstName} ${owner.lastName}"/></td>
        </tr>
        <tr>
            <th><spring:message code="form.address"/></th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th><spring:message code="form.city"/></th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th><spring:message code="form.phone"/></th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
    </table>
	<sec:authorize access="hasAuthority('admin')">
    <spring:url value="{ownerId}/edit" var="editUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(editUrl)}" class="btn btn-default"><spring:message code="button.edit"/></a>

    <spring:url value="{ownerId}/pets/new" var="addUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(addUrl)}" class="btn btn-default"><spring:message code="button.add_pet"/></a>
	</sec:authorize>
	
    <br/>
    <br/>
    <br/>
    
    <h2><spring:message code="head.pets_visits"/></h2>

    <table class="table table-striped">
        <c:forEach var="pet" items="${owner.pets}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt><spring:message code="table.name"/></dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt><spring:message code="table.birth"/></dt>
                        <dd><petclinic:localDate date="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt><spring:message code="table.type"/></dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th><spring:message code="table.visit_date"/></th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><petclinic:localDate date="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <a href="${fn:escapeXml(petUrl)}"><spring:message code="button.edit"/></a>
                            </td>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <a href="${fn:escapeXml(visitUrl)}"><spring:message code="button.add"/></a>
                            </td>
                          
                          
                          <c:set var="aux" value="0"/>
                        <c:forEach var="adop" items="${la}">
                        	<c:choose>
                        		<c:when test="${adop.pet.id == pet.id}">
                        			<dt><spring:message code="menu.adop"/></dt>
                        			<dd>
                        			<a href='<spring:url value="/adoption/${adop.id}/requests" htmlEscape="true"/>'><spring:message code="menu.adop"/></a>
                        			<br/>
                        			<a href='<spring:url value="/adoption/${adop.id}/delete/owner/${owner.id}" htmlEscape="true"/>'><spring:message code="text.delete"/></a>
                        			</dd>
                        			<c:set var="aux" value="1"/>
                        		</c:when>	
                        	</c:choose>
                        </c:forEach>
                        
                        
                        	
                        		<dt>
                           	 	<spring:url value="/adoption/pet/{petId}/new" var="adoptionUrl">
                              	 	 <spring:param name="petId" value="${pet.id}"/>
                            		</spring:url>
                           		 <a href="${fn:escapeXml(adoptionUrl)}"><spring:message code="button.solic"/></a>
                        		</dt>
                        
                            
                            <td class="text-left">
                            <sec:authorize access="hasAuthority('admin')">
                				<a href="/owners/${owner.id}/pets/${pet.id}/delete">
                					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                				</a>
                			</sec:authorize>
                			</td>  
                        </tr>
                    </table>
                </td>
            </tr>

        </c:forEach>
    </table>

</petclinic:layout>
