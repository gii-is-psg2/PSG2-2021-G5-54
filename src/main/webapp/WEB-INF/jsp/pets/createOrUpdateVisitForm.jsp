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
        <h2><c:if test="${visit['new']}"><spring:message code="text.new"/></c:if><spring:message code="text.visit"/></h2>

        <b><spring:message code="text.pet"/></b>
        <table class="table table-striped">
            <thead>
            <tr>
                <th><spring:message code="table.name"/></th>
                <th><spring:message code="table.birth"/></th>
                <th><spring:message code="table.type"/></th>
                <th><spring:message code="text.owner"/></th>
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
                <petclinic:inputField translate="yes" label="head.date" name="date"/>
                <petclinic:inputField translate="yes" label="table.info" name="description"/>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="petId" value="${visit.pet.id}"/>
                    <button class="btn btn-default" type="submit"><spring:message code="button.add"/></button>
                </div>
            </div>
        </form:form>

        <br/>
        <b><spring:message code="text.visits"/></b>
        <table class="table table-striped">
            <tr>
                <th><spring:message code="head.date"/></th>
                <th><spring:message code="table.info"/></th>
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
