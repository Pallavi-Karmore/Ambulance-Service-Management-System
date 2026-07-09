<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>AMS</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <!-- Colors CSS -->
    <link rel="stylesheet" href="css/colors.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            width: 1600px;
            justify-content: center;
            margin-top: 20px;
 margin-left:50px;
                   }

        h3 {
 margin-left:50px;
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
    <jsp:include page="admin-header.jsp"></jsp:include>

    <div class="container-fluid">
        <h3 class="header-line"> View Ambulance</h3>
        <div class="panel-body">
            <div class="table-responsive">
               <% 
                    String message = (String) request.getAttribute("message");
                    if (message != null && !message.isEmpty()) {
                        if (message.equals("success")) {
                %>
                <script>
                    alert("Record updated successfully.");
                </script>
                <% 
                        } else if (message.equals("deleteSuccess")) {
                %>
                <script>
                    alert("Record deleted successfully.");
                </script>
                <% 
                        } else if (message.equals("deleteError")) {
                %>
                <script>
                    alert("Error deleting record.");
                </script>
                <% 
                        }
                    } 
                %>
                
                <table class="table table-bordered" id="dataTable">
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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet resultset = null;
                            try {
                                conn = DatabaseConnection.getConnection();
                                stmt = conn.createStatement();
                                resultset = stmt.executeQuery("SELECT * FROM tblambulance");

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
										<td><span class="btn btn-success"><%=resultset.getString("status")%></span></td>

										<%
											} else {
										%><td><span class="btn btn-danger"><%=resultset.getString("status")%></span></td>

										<%
											}
										%>
										<td>
									  <div class="btn-group">
										
										<a class="btn btn-primary btn-sm"href="admin-check-ambulance.jsp?id=<%=resultset.getString("id")%>">update</a>
                                        <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this ambulance record?')" href="DeleteAmbulanceServlet?id=<%=resultset.getString("id")%>">Delete</a>
										
										</div>
										</td>
                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <br>

   <script type="text/javascript">
        $(document).ready(function () {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');

            if (message) {
                if (message === 'success') {
                    alert('Record Deleted  successfully.');
                } else if (message === 'error') {
                    alert('Error deleting record.');
                }
                
                // Clear the URL parameter to prevent the message from showing on refresh
                const newUrl = window.location.href.split('?')[0];
                window.history.replaceState({}, document.title, newUrl);
            }
        });
    </script>
</body>

</html>
