<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Update Ambulance Status</title>
</head>

<body>
   
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Update Ambulance Status</h2>
                <form action="UpdateAmbulanceStatusServlet" method="post">
                   <div class="form-group">
						    <label for="ambulanceId">Ambulance ID:</label>
						    <input type="text" class="form-control" id="ambulanceId" name="ambulanceId" value="<%= session.getAttribute("ambulanceId") %>" readonly>
						     </div>
				  <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="Pending">Pending</option>
                            <option value="Assigned">Assigned</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Status</button>
                </form>
            </div>
        </div>
    </div>
   
</body>

</html>
