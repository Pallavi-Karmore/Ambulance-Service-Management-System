<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">




<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"rel="stylesheet">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="java.js"></script>
	 <style>

.host_version{
           
            display: flex;
            justify-content: center;
            align-item:center;
        }
         
    .cls{
       padding-top:130px;
      
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
      
       input,select{
        background:transparent;
        width: 30rem;
        height: 3rem;
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
        margin-left:40px;
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
    <script>
    $(document).ready(function() {
        if ($("#success").length) {
            $("#success").show();
            setTimeout(function() {
                $("#success").fadeOut("slow");
            }, 4000);
        }
        if ($("#failure").length) {
            $("#failure").show();
            setTimeout(function() {
                $("#failure").fadeOut("slow");
            }, 4000);
        }
    });
</script>
    
</head>
<body class="host_version" >
  <jsp:include page="admin-header.jsp"></jsp:include>
  <%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
  <div class="cls p-3">
   <%
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            if (message != null) {
                if ("success".equals(messageType)) {
        %>
                    <div class="alert alert-success"><%= message %></div>
        <%
                } else if ("error".equals(messageType)) {
        %>
                    <div class="alert alert-danger"><%= message %></div>
        <%
                }
            }
        %>
  
    <div class="login">
       
        <form action="AddAmbulanceServlet" method="post" class="form">
        <h1>Add Ambulance</h1>
        
         
								<label>Driver Name</label> <input 
									type="text" name="dname" required/>
							
							
								<label>Driver Mobile No</label> <input  type="text"
									name="mobile" required/>
							
								<%
									String vehicleNo=DatabaseConnection.generateAmbulanceId();
								%>
								<label>Ambulance Vehicle No</label> <input
									type="text" name="vehicleNo" value="<%=vehicleNo%>" readonly/>
							
								<label>Ambulance Type</label> <select 
									type="text" name="ambulanceType">
									<option>Individual Ambulance</option>
									<option>Cardiac Ambulance</option>
									<option>Collective Ambulance</option>
									<option>Mobile ICU Ambulance</option>
									<option>Basic Life Support Ambulance</option>
									</select>
							
								<label>License No</label> <input 
									type="text" name="licenseNo" />
							
								<label>State</label> <select name="state" required />
								<option>Andhra Pradesh</option>
								<option>Arunachal Pradesh</option>
								<option>Assam</option>
								<option>Bihar</option>
								<option>Chhattisgarh</option>
								<option>Goa</option>
								<option>Gujarat</option>
								<option>Haryana</option>
								<option>Himachal Pradesh</option>
								<option>Jharkhand</option>
								<option>Karnataka</option>
								<option>Kerala</option>
								<option>Madhya Pradesh</option>
								<option>Maharashtra</option>
								<option>Manipur</option>
								<option>Meghalaya</option>
								<option>Mizoram</option>
								<option>Nagaland</option>
								<option>Odisha</option>
								<option>Punjab</option>
								<option>Rajasthan</option>
								<option>Sikkim</option>
								<option>Tamil Nadu</option>
								<option>Telangana</option>
								<option>Tripura</option>
								<option>Uttar Pradesh</option>
								<option>Uttarakhand</option>
								<option>West Bengal</option>
								</select>
							
								<label>City</label> <input
									type="text" name="city" required/>
							


							<button type="submit">Add Ambulance
							</button>

						</form>
      </div>
    </div>
    <%
		}
    %>
</body>
</html>