<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>

<!DOCTYPE html>
<html lang="en">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.host_version {
	display: flex;
	justify-content: center;
	align-item: center;
	background: url("Images/First/eme.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
}

.cls {
	padding-top: 130px;
	display: flex;
	justify-content: center;
	align-item: center;
}

.login {
	border: 2px solid black;
	border-radius: 1rem;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.75);
	width: 38rem;
	height: 44em;
	overflow: hidden;
	padding: top 50px;
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

h1 {
	display: grid;
	place-content: center;
	margin-top: -5rem;
	font-size: 2.5rem;
	margin-bottom: 75 px;
	color: blue;
}

input {
	background: transparent;
	width: 30rem;
	height: 2.5em;
	border: px solid black;
	padding: 2px;
}

label {
	font-size: 1.3rem;
	padding: 0.3rem;
	color: #111;
	font-weight: bold;
}

button {
	margin-top: 2rem;
	width: 20rem;
	height: 2.5em;
	font-weight: bold;
	border: 1px solid black;
	border-radius: 4px;
	align-items: center;
	background-color: blue;
	margin-left: 40px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0, 0.75);
	cursor: pointer;
	color: white;
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
</style>
</head>
<body class="host_version">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="cls p-3">
		<div class="login">
			<form class="form" action="PatientLogin" method="post">
				<h1>Login</h1>


				<%
				String credential = (String) session.getAttribute("credential");
				if (credential != null) {
					session.removeAttribute("credential");
				%>
				<div class="alert alert-danger" id="danger">You have enter
					wrong credentials.</div>
				<%
				}
				%>

				<label>User Name </label> <input type="text" name="uname"
					placeholder="Enter Name" required /> <label> Password</label> <input
					type="password" name="upass" placeholder="Enter Password" required />
				<p>
					<a>Forget password</a>
				</p>
				<button>Login</button>
				<br> <a class="text-center" href="patient-register.jsp">New
					Patient Register</a>

			</form>

		</div>
	</div>
</body>
</html>