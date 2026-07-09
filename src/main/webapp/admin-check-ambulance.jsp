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



<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"rel="stylesheet">


<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

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
      
    }
    
   .login{
    border: 2px solid black;
    border-radius:1rem ;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.75);
    width:38rem ;
    height: 44em;
    overflow: hidden;
    padding: top 50px; 
    margin-left:1180px;
   
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
        height:3rem;
        font-weight: bold;
        border:2px solid black;
        border-radius: 1rem;
        align-items: center;
        background-color: blue;
        margin-left:50px;
      
        box-shadow: 0 0 5px rgba(0,0,0,0,0.75);
        cursor: pointer;

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
  <div class="cls p-3">
    <div class="login">
        <form class="form" action="ApproveAmbulance"  method="post">
            <h1>My Profile</h1>
                
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where id='" + request.getParameter("id") + "'");
								while (resultset.next()) {
							%>
							
								
							
								<label>Ambulance Vehicle No</label> <input 
									type="text" name="avn" value="<%=resultset.getString("ambulance_vehicle_no")%>" readonly />
							
								<label>Ambulance Type</label> <input type="text"
									 name="ambulanceType" value="<%=resultset.getString("ambulance_type")%>" readonly />
							
							
								<label>Driver Name </label> <input 
									type="text" name="driverName" value="<%=resultset.getString("driver_name")%>" readonly />
							
								<label>Mobile No </label> <input
									type="text" name="mobile" value="<%=resultset.getString("driver_mobile")%>" readonly />
							
								<label>License No</label> <input 
									type="text" name="licenseNo" value="<%=resultset.getString("driver_lincense_no")%>" readonly />
							
								
								<label>City</label> <input  type="text"
									name="city" value="<%=resultset.getString("city")%>" readonly />
							
						        <label for="status">Status:</label>
						        <select id="status" name="status" required>
						            <option value="Available">Available</option>
						            <option value="Unavailable">Unavailable</option>
						        </select>
						             
                                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                               <button type="submit" class="btn btn-info">Update</button>
                              
                              <% 
								}
							%>
						</form>
					</div>
				</div>
			</div>

		</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  
</body>
<script type="text/javascript">
    $(function() {
        $('#success').delay(3000).fadeOut('slow');
    });
</script>
</html>
