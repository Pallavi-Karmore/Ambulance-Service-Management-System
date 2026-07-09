<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Metas -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Site Metas -->
    <title>Book Ambulance</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Book Ambulance</h2>
        <form action="BookAmbulanceServlet" method="post">
            <div class="form-group">
                <label>Patient ID</label>
                <input type="text" class="form-control" name="patient_id" required>
            </div>
            <div class="form-group">
                <label>Ambulance ID</label>
                <input type="text" class="form-control" name="ambulance_id" required>
            </div>
            <div class="form-group">
                <label>Source City</label>
                <input type="text" class="form-control" name="source_city" required>
            </div>
            <div class="form-group">
                <label>Destination City</label>
                <input type="text" class="form-control" name="destination_city" required>
            </div>
            <button type="submit" class="btn btn-primary">Book Ambulance</button>
        </form>
    </div>
</body>
</html>
