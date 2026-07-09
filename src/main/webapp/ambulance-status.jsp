<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">




<!-- Modernizer for Portfolio -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	<style>	
	 body {
            height: auto;
            background-image: url("eme.jpg");
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            height: 46rem;
            font-weight: 400;
        }

        .container-fluid {
            padding-top: 130px;
        }

        table,
        thead,
        tr {
            border: 1px solid;
        }

        td,
        th {
            padding: 3px;
            margin: 0;
        }

        .panel-body {
            border: 10px solid black;
            padding: 20px;
            max-width: 1600px;
            justify-content: center;
            margin-top: 20px;
        }

        h3 {
            margin-left: 70px;
        }

        .btn-group {
            display: flex;
        }

        .btn-group a {
            margin-right: 5px;
        }
    </style>
</head>

<body class="host_version">
<jsp:include page="user-header.jsp"></jsp:include>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	
	<div class="container-fluid">
				<h3 class="header-line">Booking Ambulance Status</h3>
				
		<div class="row">
			<div class="col-md-12">
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead class="bg-primary">
									<tr>
										<th>Patient Id</th>
										<th>Patient_Name</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Address</th>
										<th>Disease</th>
										<th>Ambulance Id</th>
										<th>Source_City</th>
										<th>Destination_City</th>
							            <th>Date</th>
										
										<th>Status</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection
										.getResultFromSqlQuery("select * from tblpatient where patient_name='" + session.getAttribute("pname") + "'");
								while (resultset.next()) {
								%>
								<tbody>
									<tr class="default">
										<td><%=resultset.getString("patient_id")%></td>
										<td><%=resultset.getString("patient_name")%></td>
										<td><%=resultset.getString("patient_email")%></td>
										<td><%=resultset.getString("Patient_mobile")%></td>
										<td><%=resultset.getString("patient_address")%></td>
										<td><%=resultset.getString("patient_disease")%></td>
										<td><%=resultset.getString("avn")%></td>
										<td><%=resultset.getString("source_city")%></td>
										<td><%=resultset.getString("destination_city")%></td>
										<td><%=resultset.getString("created_at")%></td>
										
										<%
											if (resultset.getString("ambulance_status") != null) {
												if (resultset.getString("ambulance_status").equals("Assigned")) {
										%>
										<td><button type="button" class="btn btn-success">Assigned</button>
</td>
										<%
											} else {
										%>
										<td><button type="button" class="btn btn-danger">Pending</button>
</td>
										<%
											}
										}
										%>
										
										
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%
		} 
	
	%>
</body>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
</script>
</html>