<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Site Metas -->
    <title>View Patient</title>
    <meta name="description" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        .container {
            width: 80%; 
            max-width: 800px; 
            margin: 0 auto;
            background-color: #f0f0f0; 
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px; 
            height:400px; 
            margin-top:80px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%; 
            height:400px;
            text-align:center;
        }

        .table th,
        .table td {
            border: 1px solid black; 
            padding: 15px;
            text-align: left;
        }

        h2{
        
         color:blue;
        
        }
        
        a {
            text-align: center;
      
        }
        
      
    </style>
</head>

<body>

    <div class="container">
        <h2>Patient Details</h2>
        <%
            String patientId = request.getParameter("patient_id");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet resultset = null;

            try {
                conn = DatabaseConnection.getConnection();
                String sql = "SELECT * FROM tblpatient WHERE patient_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, patientId);
                resultset = pstmt.executeQuery();

                if (resultset.next()) {
        %>
        <table class="table table-bordered">
            <tr>
                <th>Patient ID</th>
                <td><%= resultset.getString("patient_id") %></td>
            </tr>
            <tr>
                <th>Patient Name</th>
                <td><%= resultset.getString("patient_name") %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= resultset.getString("patient_email") %></td>
            </tr>
            <tr>
                <th>Mobile</th>
                <td><%= resultset.getString("Patient_mobile") %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= resultset.getString("patient_address") %></td>
            </tr>
            <tr>
                <th>Disease</th>
                <td><%= resultset.getString("patient_disease") %></td>
            </tr>
            <tr>
                <th>Created At</th>
                <td><%= resultset.getString("created_at") %></td>
            </tr>
            <tr>
                <th>Source City</th>
                <td><%= resultset.getString("source_city") %></td>
            </tr>
            <tr>
                <th>Destination City</th>
                <td><%= resultset.getString("destination_city") %></td>
            </tr>
            <tr>
                <th>Ambulance Status</th>
                <td><%= resultset.getString("ambulance_status") %></td>
            </tr>
        </table>
        <%
                } else {
        %>
        <p>No patient found with ID <%= patientId %>.</p>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
        %>
        <p>Error retrieving patient details.</p>
        <%
            } finally {
                if (resultset != null) try { resultset.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        <div class="text-center">
            <a href="admin-view-patient.jsp" class="btn btn-primary">Back to Ambulance List</a>
        </div>
    </div>

</body>

</html>
