<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
   
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

        h3 {
 margin-left:50px;
                   }

        .btn-group {
            display: flex;
        }

        .btn-group a {
            margin-right: 5px;
        }
        
        th#DestinationCity{
            width: 150px;
        }
        th#SourceCity {
            width: 130px;
        }
        th#patientName {
            width: 200px;
        }
         th#date {
            width: 150px;
        }
    </style>
</head>

<body class="host_version">
    <jsp:include page="admin-header.jsp"></jsp:include>

    <div class="container-fluid">
        <h3 class="header-line">View User Details</h3>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead class="bg-primary">
                        <tr>
                            <th>Patient Id</th>
                            <th id="patientName">Patient Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Disease</th>
                            <th id="date">Created At</th>
                            <th id="SourceCity">Source City</th>
                            <th id="DestinationCity">Destination City</th>
                            <th>Ambulance Status</th>
                            <th class="text-center">Action</th>
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
                                resultset = stmt.executeQuery("SELECT * FROM tblpatient");

                                while (resultset.next()) {
                        %>
                        <tr class="default">
                            <td><%= resultset.getString("patient_id") %></td>
                            <td><%= resultset.getString("patient_name") %></td>
                            <td><%= resultset.getString("patient_email") %></td>
                            <td><%= resultset.getString("Patient_mobile") %></td>
                            <td><%= resultset.getString("patient_address") %></td>
                            <td><%= resultset.getString("patient_disease") %></td>
                            <td><%= resultset.getString("created_at") %></td>
                            <td><%= resultset.getString("source_city") %></td>
                            <td><%= resultset.getString("destination_city") %></td>
                            <td>
                                <%
                                    String ambulanceStatus = resultset.getString("ambulance_status");
                                    if (ambulanceStatus != null) {
                                        if (ambulanceStatus.equals("Pending")) {
                                %>
                                <a class="btn btn-danger"><%= ambulanceStatus %></a>
                                <%
                                        } else {
                                %>
                                <a class="btn btn-success"><%= ambulanceStatus %></a>
                                <%
                                        }
                                    }
                                %>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <a href="view-patient.jsp?patient_id=<%= resultset.getString("patient_id") %>" class="btn btn-info">View</a>
                                    <a class="btn btn-danger" href="DeletePatientServlet?patient_id=<%= resultset.getString("patient_id") %>" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                                </div>
                            </td>
                        </tr>
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
        $(function () {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');

            if (message === 'success') {
                alert('Record deleted successfully.');
            } else if (message === 'error') {
                alert('Error deleting record.');
            }
        });
    </script>
</body>

</html>
