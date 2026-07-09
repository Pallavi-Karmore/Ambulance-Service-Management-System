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
            padding: 5px;
            margin: 0;
        }

        .panel-body {
            border: 10px solid black;
            padding: 20px;
            max-width: 1600px;
            justify-content: center;
            padding-left: 50px;
            margin-left: 180px;
            margin-top: 20px;
        }

        h3 {
            margin-left: 180px;
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

    <div class="container-fluid">
        <h3 class="header-line">View Ambulance</h3>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead class="bg-primary">
                        <tr>
                            <th>Patient Id</th>
                            <th>Patient Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Disease</th>
                            <th>Created At</th>
                            <th>Source City</th>
                            <th>Destination City</th>
                            <th>Ambulance Status</th>
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
                                    <a href="view-patient.jsp?patient_id=<%= resultset.getString("patient_id") %>" class="btn btn-info">update</a>
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
