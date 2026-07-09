<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"rel="stylesheet">
	

<script src="js/modernizer.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
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
            margin-left: 20px;
            margin-right: 20px;
            
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
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="user-header.jsp"></jsp:include>
	
	<div class="container-fluid">
		<h3 class="header-line">All Ambulance</h3>
		
		
				         <div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead class="bg-primary">
									<tr>
										<th>#</th>
										<th>Ambulance_Vehicle_No</th>
										<th>Ambulance Type</th>
										<th>Driver_Name</th>
										<th>Mobile No</th>
										<th>License_No</th>
										<th>State</th>
										<th>City</th>
										<th>Created At</th>
										<th>Vehicle Status</th>
									</tr>
								</thead>
								<tbody>
									<%
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance");
										while (resultset.next()) {
									%>
									<tr class="default">
										<td><%=resultset.getString("id")%></td>
										<td><%=resultset.getString("ambulance_vehicle_no")%></td>
										<td><%=resultset.getString("ambulance_type")%></td>
										<td><%=resultset.getString("driver_name")%></td>
										<td><%=resultset.getString("driver_mobile")%></td>
										<td><%=resultset.getString("driver_lincense_no")%></td>
										<td><%=resultset.getString("state")%></td>
										<td><%=resultset.getString("city")%></td>
										<td><%=resultset.getString("created_at")%></td>
										<%
											if (resultset.getString("status").equals("Available")) {
										%>
										<td><button type="button" class="btn btn-success btn-lg">Available</button></td>
										<%
											} else {
										%>
										<td><button type="button" class="btn btn-danger">Not Available</button></td>
										<%
											}
										%>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
	
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
