<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, owners, vets or error"%>

<style>
.en {
  display: none;
}
</style>

<script>
function changeLanguageEsp() {
  	var a= document.getElementsByClassName("es");
  	for (var i = 0; i < a.length; i++) {
   	   a.item(i).style.display = "block";
   	}
  	
  	var b = document.getElementsByClassName("en");
  	for (var i = 0; i < b.length; i++) {
   	   b.item(i).style.display = "none";
   	}
}

function changeLanguageEng() {
  	var a= document.getElementsByClassName("es");
  	for (var i = 0; i < a.length; i++) {
   	   a.item(i).style.display = "none";
   	}
  	
  	var b = document.getElementsByClassName("en");
  	for (var i = 0; i < b.length; i++) {
   	   b.item(i).style.display = "block";
   	}
	}
</script>

<nav class="navbar navbar-default" role="navigation">
<button onclick="changeLanguageEsp()">Espa�ol</button>
<button onclick="changeLanguageEng()">English</button>

	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<spring:url value="/" htmlEscape="true" />"><span></span></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#main-navbar">
				<span class="sr-only"><os-p>Toggle navigation</os-p></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="main-navbar">
			<ul class="nav navbar-nav">

				<petclinic:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					<div class="es"><span>Inicio</span></div>
					<div class="en"><span>Home</span></div>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'owners'}" url="/owners/find"
					title="find owners">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="es"><span>Buscar Due�os</span></div>
					<div class="en"><span>Find Owners</span></div>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'vets'}" url="/vets"
					title="veterinarians">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<div class="es"><span>Veterinarios</span></div>
					<div class="en"><span>Vets</span></div>
				</petclinic:menuItem>
				
				<petclinic:menuItem active="${name eq 'adopciones'}" url="/adopciones"
					title="adopciones">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<span>Adopciones</span>
				</petclinic:menuItem>
				
				<petclinic:menuItem active="${name eq 'reservas'}" url="/reservas"
					title="reservas">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<span>Hotel</span>
				</petclinic:menuItem>

                <petclinic:menuItem active="${name eq 'causes'}" url="/causes"
                                    title="causes">
                    <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                    <span>Causes</span>
                </petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'error'}" url="/oups"
					title="trigger a RuntimeException to see how it is handled">
					<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					<span>Error</span>
				</petclinic:menuItem>

			</ul>




			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="!isAuthenticated()">
					<div class="es">
					<li><a href="<c:url value="/login" />">Acceso</a></li>
					<li><a href="<c:url value="/users/new" />">Registro</a></li>
					</div>
					<div class="en">
					<li><a href="<c:url value="/login" />">Login</a></li>
					<li><a href="<c:url value="/users/new" />">Register</a></li>
					</div>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>�
							<strong><sec:authentication property="name" /></strong> <span
							class="glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul class="dropdown-menu">
							<li>
								<div class="navbar-login">
									<div class="row">
										<div class="col-lg-4">
											<p class="text-center">
												<span class="glyphicon glyphicon-user icon-size"></span>
											</p>
										</div>
										<div class="col-lg-8">
											<p class="text-left">
												<strong><sec:authentication property="name" /></strong>
											</p>
											<p class="text-left">
												<a href="<c:url value="/logout" />"
													class="btn btn-primary btn-block btn-sm">Logout</a>
											</p>
										</div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
<!-- 							
                            <li> 
								<div class="navbar-login navbar-login-session">
									<div class="row">
										<div class="col-lg-12">
											<p>
												<a href="#" class="btn btn-primary btn-block">My Profile</a>
												<a href="#" class="btn btn-danger btn-block">Change
													Password</a>
											</p>
										</div>
									</div>
								</div>
							</li>
-->
						</ul></li>
				</sec:authorize>
			</ul>
		</div>



	</div>
</nav>
