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
    <title>View Ambulance Requests</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Ambulance Requests</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Request ID</th>
                    <th>Patient ID</th>
                    <th>Ambulance ID</th>
                    <th>Source City</th>
                    <th>Destination City</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        conn = DatabaseConnection.getConnection();
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM ambulance_requests");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("request_id") %></td>
                    <td><%= rs.getInt("patient_id") %></td>
                    <td><%= rs.getString("ambulance_id") %></td>
                    <td><%= rs.getString("source_city") %></td>
                    <td><%= rs.getString("destination_city") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <form action="UpdateRequestStatusServlet" method="post">
                            <input type="hidden" name="request_id" value="<%= rs.getInt("request_id") %>">
                            <select name="status" class="form-control">
                                <option value="Pending" <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
                                <option value="Assigned" <%= rs.getString("status").equals("Assigned") ? "selected" : "" %>>Assigned</option>
                                <option value="Rejected" <%= rs.getString("status").equals("Rejected") ? "selected" : "" %>>Rejected</option>
                            </select>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
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
</body>
</html>
