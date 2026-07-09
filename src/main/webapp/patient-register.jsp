<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        .host_version {
            display: flex;
            justify-content: center;
            align-item: center;
        }
        .cls {
            padding-top: 130px;
        }
        .login {
            border: 2px solid black;
            border-radius: 1rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.75);
            width: 38rem;
            height: 44em;
            overflow: hidden;
            background-color: #f9f9f9;
        }
        .form {
            display: grid;
            place-content: center;
            box-sizing: border-box;
            background-size: cover;
            background-image: url("eme.jpg");
            height: 100%;
            width: 100%;
            background-repeat: no-repeat;
            background-position: center;
        }
        h2 {
          
           text-align:center;
            margin-top: -5rem;
            font-size: 2.5rem;
            margin-top: 20px;
            color: blue;
        }
        input {
            background: transparent;
            width: 30rem;
            height: 2.5em;
            padding: 2px;
        }
        label {
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
        p {
            margin: 0.1rem 0 -1rem 0;
            padding: 0.3rem;
        }
        a {
            cursor: pointer;
            font-weight: bold;
        }
        .bxs-user {
            display: block;
            position: absolute;
            padding: 221px 0 0 335px;
        }
        .bxs-lock-alt {
            display: block;
            position: absolute;
            padding: 300px 0 0 335px;
        }
        .alert {
            display: none;
        }
        a {
            margin-left: 40px;
        }
    </style>

    <script>
        $(document).ready(function(){
            if ($("#success").length) {
                $("#success").show();
                setTimeout(function() {
                    $("#success").fadeOut("slow");
                }, 8000);
            }
            if ($("#failure").length) {
                $("#failure").show();
                setTimeout(function() {
                    $("#failure").fadeOut("slow");
                }, 8000);
            }
        });
    </script>
</head>
<body class="host_version">
  <jsp:include page="header.jsp"></jsp:include>
    <div class="cls p-3">
     <%
                    String successMessage = (String) session.getAttribute("success-message");
                    String failureMessage = (String) session.getAttribute("failure-message");
                    if (successMessage != null) {
                        session.removeAttribute("success-message");
                %>
                <div class="alert alert-success" id="success"><%= successMessage %></div>
                <%
                    }
                    if (failureMessage != null) {
                        session.removeAttribute("failure-message");
                %>
                <div class="alert alert-danger" id="failure"><%= failureMessage %></div>
                <%
                    }
                %>
        <div class="login">
            <form class="form" action="AccountCreate" method="post">
                <h2>Registration Form</h2>   
                <label>Patient Id</label>
                <%
                    String patientId = DatabaseConnection.generatePatientId();
                %>
                <input type="text" value="<%= patientId %>" name="patientId" readonly />
                <label>Patient Name</label>
                <input type="text" name="patientName" required/>
                <label>Email Id</label>
                <input type="text" name="emailId" onblur="ValidateEmail()" required/>
                <label>Mobile No</label>
                <input type="text" name="mobile" id="txtMB" onblur="return ValidateMobNumber('txtMB')" required/>
                <label>Address</label>
                <input type="text" name="address" required/>
                <label>User Name</label>
                <input type="text" name="uname" required/>
                <label>Password</label>
                <input type="password" name="upass" required />
                <button type="submit" id="btnValidate">Create Account</button>
                <a class="for-pwd" href="patient-login.jsp">Already registered, Please Login</a>
            </form>
        </div>
    </div>
</body>
</html>
