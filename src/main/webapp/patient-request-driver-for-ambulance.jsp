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
            margin-left:50px;
           
           
            margin-top: 20px;
        }

        h2 {
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
        <h2 class="header-line">User Request</h2>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead class="bg-primary">
                        <tr>
                            <th>Patient Id</th>
                            <th>Patient_Name</th>
                            <th>Address</th>
                            <th>Disease</th>
                            <th>Ambulance Id</th>
                            <th>Type</th>
                            <th>Source_City</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% 
                       try {
    Connection connection = DatabaseConnection.getConnection();
    String query = "SELECT tblpatient.patient_id, tblpatient.patient_name, tblpatient.created_at, tblpatient.patient_mobile, tblpatient.patient_address, " +
            "tblpatient.patient_disease, tblpatient.avn, tblpatient.source_city, tblpatient.destination_city, tblpatient.ambulance_status, " +
            "tblambulance.ambulance_vehicle_no, tblambulance.ambulance_type " +
            "FROM tblpatient LEFT JOIN tblambulance ON tblpatient.avn = tblambulance.ambulance_vehicle_no";

    PreparedStatement statement = connection.prepareStatement(query);
    ResultSet resultSet = statement.executeQuery();
    while (resultSet.next()) {
%>
<tr>
                            <td><%= resultSet.getString("patient_id") %></td>
                            <td><%= resultSet.getString("patient_name") %></td>
                            <td><%= resultSet.getString("patient_address") %></td>
                            <td><%= resultSet.getString("patient_disease") %></td>
                            <td><%= resultSet.getString("avn") %></td>
                            <td><%= resultSet.getString("ambulance_type") %></td> 
                            <td><%= resultSet.getString("source_city") %></td>
                            <td><%= resultSet.getString("destination_city") %></td>
                            <td><%= resultSet.getString("created_at") %></td>
                            
    
                            
                            <%
                                if (resultSet.getString("ambulance_status") != null) {
                                    if (resultSet.getString("ambulance_status").equals("Assigned")) {
                            %>
                            <td><button type="button" class="btn btn-success">Assigned</button></td>
                            <%
                                    } else {
                            %>
                            <td><button type="button" class="btn btn-danger">Pending</button></td>
                            <%
                                    }
                                }
                            %>
                            <td>
                            <div class="btn-group">
                            <a class="btn btn-primary btn-sm" href="AssignUnassignAmbulance.jsp?id=<%= resultSet.getString("patient_id") %>">Update</a>
                            <a class="btn btn-success btn-sm" href="map.jsp?id=<%= resultSet.getString("patient_id") %>&avn=<%= resultSet.getString("avn") %>">View</a>
                            
                            </div>
                            </td>
                        </tr>
                        <%
                                }
                                resultSet.close();
                                statement.close();
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                        %>
                        <tr>
                            <td colspan="11">Error: <%= e.getMessage() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
