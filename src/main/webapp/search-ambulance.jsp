<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<html lang="en">
<head>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"rel="stylesheet">
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
   
    margin: 0;
    display: flex;
    flex-direction: column;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.navbar {
    margin-bottom: 20px;
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.panel-body {
    border: 1px solid black;
    padding: 20px;
    width:1400px;
   
}

table,
thead,
tr {
    border: 1px solid;
    width: 100%; 
}

thead {
    background-color: blue;
}
.cls{
padding-top:50px;
padding-left:60px;
}
</style>
</head>
<body class="host_version">
    <% if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") { %>
    
        <jsp:include page="user-header.jsp"></jsp:include>
        
            <nav class="navbar navbar-default">
               
            </nav>
            <div class="header-line">Search Ambulance</div>
            
         <div class="col-md-3">
    <div class="cls">
        <h4 class="header-line">Search Ambulance</h4>
        <form class="form-inline" action="search-ambulance.jsp" method="post">
            <div class="input-group">
                <input type="text" class="form-control" id="city" placeholder="Enter city" name="city">
                <div style="width: 10px;"></div> <!-- Spacer -->
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">Search Ambulance</button>
                </div>
            </div>
        </form>
    </div>
</div>

               
            </form>
            <br>
          <div class="container">
				<%
					String bookAmbulance = (String) session.getAttribute("book-ambulance");
						if (bookAmbulance != null) {
						session.removeAttribute("book-ambulance");
				%>
				<div class="alert alert-success" id="success">Ambulance booking successfully.</div>
				<%
					}
				%>
				
					
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead class="bg-primary">
									<tr>
										<th>#</th>
										<th>Ambulance Vehicle No</th>
										<th>Ambulance Type</th>
										<th>Driver Name</th>
										<th>Mobile No</th>
										<th>License No</th>
										<th>State</th>
										<th>City</th>
										<th>Created At</th>
										<th>Vehicle Status</th>
										<th>Book Ambulance</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection
										.getResultFromSqlQuery("select * from tblambulance where city like '%" + request.getParameter("city") + "%'");
								while (resultset.next()) {
								%>
								<tbody>
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
										<td><span class="btn btn-success ">Available</span></td>
										<td><a href="book-ambulance.jsp?avn=<%=resultset.getString("ambulance_vehicle_no")%>"
											class="btn btn-warning btn-sm">Book Ambulance</a></td>
										<%
											} else {
										%>
										<td><span class="btn btn-danger btn-sm">Not Available</span></td>
										<%
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
