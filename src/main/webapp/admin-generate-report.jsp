<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



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
	height: 200px;
	border: 1px solid black;
	padding: 20px; /* Increased padding around the content */
}

.card-body {
	color: black; /* Change text color */
}

.card-body:hover {
	color: blue; /* Change text color on hover */
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
					<a href="AllAmbulanceReports" class="icon-link"> <i
						class="fa-solid fa-truck-medical fa-6x"></i>
						<h3>
							Ambulances Report
							</h4></a>
				</div>
			</div>

		</div>

		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="AllPatientsReport" class="icon-link"> <i
						class="fa-solid fa-user fa-6x"></i> <br>
						<h3>
							Patients Report
							</h4></a>
				</div>
			</div>

		</div>

		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="AllPatientAmbulanceBookingReport" class="icon-link"> <i
						class="fa-solid fa-file-pdf fa-6x"></i> <br>
						<h3>
							Ambulance Booking
							</h4></a>
				</div>
			</div>

		</div>


		<div class="col-md-2 p-3">
			<div class="card">
				<div class="card-body text-center">
					<a href="FeedbackAndComplaint" class="icon-link"> <i
						class="fa-regular fa-comment-dots fa-6x"></i>
						<h3>Feedback& Complaint</h3>
					</a>
				</div>
			</div>

		</div>

	</div>
	<%
		}
%>





</body>
</html>
