<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Patient Details</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
    <div class="container">
        <h2>Patient Details</h2>
        <%
            ResultSet patientDetails = (ResultSet) request.getAttribute("patientDetails");
            if (patientDetails != null) {
                patientDetails.beforeFirst(); // Move cursor to the start
                while (patientDetails.next()) {
        %>
        <table class="table table-bordered">
            <tr>
                <th>Patient ID</th>
                <td><%= patientDetails.getString("patient_id") %></td>
            </tr>
            <tr>
                <th>Patient Name</th>
                <td><%= patientDetails.getString("patient_name") %></td>
            </tr>
            <tr>
                <th>Mobile</th>
                <td><%= patientDetails.getString("patient_mobile") %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= patientDetails.getString("patient_address") %></td>
            </tr>
            <!-- Add other patient details as needed -->
        </table>
        <%
                }
            } else {
        %>
        <p>No patient details found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
