<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->

<petclinic:layout pageName="owners">

    <div class="es"><h2>Buscar Dueños</h2></div>
    <div class="en"><h2>Find Owner</h2></div>

    
    <form:form modelAttribute="owner" action="/owners" method="get" class="form-horizontal"
               id="search-owner-form">
        <div class="form-group">
            <div class="control-group" id="lastName">
                <div class="es"><label class="col-sm-2 control-label">Apellidos </label></div>
                <div class="en"><label class="col-sm-2 control-label">Surname </label></div>
                <div class="col-sm-10">
                    <form:input class="form-control" path="lastName" size="30" maxlength="80"/>
                    <span class="help-inline"><form:errors path="*"/></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="es"><button type="submit" class="btn btn-default">Buscar Dueño</button></div>
                <div class="en"><button type="submit" class="btn btn-default">Find Owner</button></div>
            </div>
        </div>

    </form:form>

    <br/> 
    <sec:authorize access="hasAuthority('admin')">
		<div class="es"><a class="btn btn-default" href='<spring:url value="/owners/new" htmlEscape="true"/>'>Añadir Dueño</a></div>
		<div class="en"><a class="btn btn-default" href='<spring:url value="/owners/new" htmlEscape="true"/>'>Add Owner</a></div>
	</sec:authorize>
	
</petclinic:layout>
