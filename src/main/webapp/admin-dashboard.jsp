<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.row {
	padding-top: 330px;
	padding-left: 450px;
}

a {
	color: blue;
}

a:hover {
	color: blue;
}

text-center {
	color: white;
	text-align: center;
	paddint-top: 30px;
}

.container {
	margin-top: 120px;
}

.card {
	width: 200px;
	height: 200px;
	border: 1px solid black;
	padding: 20px;
}

.card-body {
	color: black;
}

.card-body:hover {
	color: blue;
}

.icon-link {
	text-decoration: none;
	color: inherit;
}
</style>

</head>

<body class="host_version">
	<jsp:include page="admin-header.jsp"></jsp:include>
	<%
	if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>

	<div class="row">
		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="addAmbulance.jsp" class="icon-link"> <i
						class="fa-regular fa-square-plus fa-6x"></i><br>
						<h3>Add Ambulance</h3></a>
				</div>
			</div>

		</div>

		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="patient-request-driver-for-ambulance.jsp"
						class="icon-link"> <i class="fa-solid fa-user fa-6x"></i> <br>
						<h3>
							User Request
							</h4></a>
				</div>
			</div>

		</div>

		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="admin-view-ambulance.jsp" class="icon-link"> <i
						class="fa-solid fa-truck-medical fa-6x"></i><br>
						<h3>
							Ambulance
							</h4></a>
				</div>
			</div>

		</div>


		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="logout.jsp" class="icon-link"> <i
						class="fa-solid fa-right-from-bracket fa-6x"></i>
						<h3>
							Logout
							</h4></a>
				</div>
			</div>

		</div>



	</div>

	</div>
	<%
	}
	%>





</body>
</html>
