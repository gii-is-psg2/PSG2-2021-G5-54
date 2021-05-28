<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="contact">
	<h2>
		<fmt:message key="support" />
	</h2>
	<table class="table table-striped">
        <thead>
	        <tr>
	            <th><fmt:message key="form.firstname"/></th>
				<th>Email</th>
	        </tr>
        </thead>
        <tbody id="contactsBody">
        </tbody>
    </table>
</petclinic:layout>

<script>
window.addEventListener("load", setup, false);
var contactsBody;
var oJSON = {
    "operation": "core/get",
    "class": "Contact",
    "key": "SELECT Person WHERE email LIKE '%.es'"
    "output_fields": "friendlyname, email"
};
function setup() {
    contactsBody = $("#contactsBody");
    $.ajax({
        type: "POST",
        url: "http://localhost/itop/webservices/rest.php?version=1.3",
        dataType: "json",
        data: {
            auth_user: "apirest",
            auth_pwd: "@Apirest1234",
            json_data: JSON.stringify(oJSON)
        },
        crossDomain: "true"
    }).then(
        function(data, textStatus, jqXHR) {
            if (data.code === 0) {
                onLoadedData(Object.values(data.objects))
            }
        },
        function(jqXHR, textStatus, errorThrown) {
            putContactRow("Error", "Couldn't fetch data from server", "");
            console.debug(jqXHR);
        }
    );
}
function putContactRow(name, email, phone) {
	let tr = $("<tr>");
	tr.append($("<td>").text(name));
	tr.append($("<td>").text(email));
	tr.append($("<td>").text(phone));
    contactsBody.append(tr);
}
function onLoadedData(objects) {
    for (let contact of objects) {
        putContactRow(contact.fields.friendlyname, contact.fields.email);
    }
}
</script>