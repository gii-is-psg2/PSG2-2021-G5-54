<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="error">

    <spring:url value="/resources/images/pets.png" var="petsImage"/>
    <img src="${petsImage}"/>

    <div class="es"><h2>Hubo un error...</h2></div>
    <div class="en"><h2>Oh no! Error...</h2></div>

    <p>${exception.message}</p>

</petclinic:layout>
