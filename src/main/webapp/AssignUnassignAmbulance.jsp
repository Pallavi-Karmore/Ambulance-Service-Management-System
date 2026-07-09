<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>

<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>AMS</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"rel="stylesheet">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	
	 <style>

.host_version{
           
            display: flex;
            justify-content: center;
            align-item:center;
        }
         
    .cls{
       padding-top:130px;
        display: flex;
            justify-content: center;
            align-item:center;
      
    }
    
   .login{
    border: 2px solid black;
    border-radius:1rem ;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.75);
    width:38rem ;
    height: 44em;
    overflow: hidden;
    padding: top 50px; 
   
   }
   .form{
    display:grid;
    place-content: center ;
    box-sizing: border-box;
    background-size: cover;
    background-image: url("eme.jpg");
    height: 100%;
    width: 100%;
    background-repeat: no-repeat;
    background-position: center;
      }
      h1{
        display: grid;
        place-content: center;
        margin-top: -5rem;
        font-size: 2.5rem;
        margin-bottom: 75 px;
        color: blue;

      }
      input,select{
        background:transparent;
         width: 30rem;
        height: 2.5em;
        border: px solid black; 
        padding: 2px;  
      }
      label{
	    font-size: 1.3rem;
	    padding: 0.3rem;
	    color: #111;
	    font-weight: bold;

      }
      button{
        margin-top: 2rem;
        width:20rem;
        height:2.5em;
        font-weight: bold;
        border:1px solid black;
        border-radius:4px ;
        align-items: center;
        background-color: blue;
        margin-left:60px;
        box-shadow: 0 0 5px rgba(0,0,0,0,0.75);
        cursor: pointer;
        color:white;

      }
      p{
        margin:0.1rem 0 -1rem 0;
        padding: 0.3rem;
      }
      a{
        cursor: pointer;
        font-weight: bold;
      }

      .bxs-user{
        display: block;
        position: absolute;
        padding: 221px 0 0 335px;

      }
      .bxs-lock-alt{
        display: block;
        position: absolute;
        padding: 300px 0 0 335px;

      }
     


  </style>
</head>
<body class="host_version" >
  <jsp:include page="admin-header.jsp"></jsp:include>
  
   <%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	 <% 
            String patientId = request.getParameter("id");
            if(patientId != null) {
                try {
                    Connection connection = DatabaseConnection.getConnection();
                    String query = "SELECT * FROM tblpatient WHERE patient_id=?";
                    PreparedStatement statement = connection.prepareStatement(query);
                    statement.setString(1, patientId);
                    ResultSet resultSet = statement.executeQuery();
                    if(resultSet.next()) {
        %>
     <div class="cls p-3">
    <div class="login">
        <form class="form" action="UpdateStatusServlet"    method="post">
            <h1>Update Status </h1>
            
          
				
                <label for="patient_id">Patient ID:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
           
                 <label for="patient_id">Name:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
            
                <label for="patient_id">Email Id:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
                
                <label for="patient_id">Ambulance Id:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
                
                <label for="patient_id">Source City:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
                
                <label for="patient_id">Destination City:</label>
                <input type="text"  id="patient_id" name="patient_id" value="<%= resultSet.getString("patient_id") %>" readonly>
                
               
            
                <label for="status">Status:</label>
                <select  id="status" name="status" required>
                    <option value="Assigned">Assigned</option>
                    <option class="btn btn-denger" value="Pending">Pending</option>
                </select>
            
            
            <button type="submit">Update Status</button>
             </form>
        <% 
                    } else {
                        out.println("No patient found with ID: " + patientId);
                    }
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                out.println("Patient ID is not provided.");
            }
        %>
    </div>
    <%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>
