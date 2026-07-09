<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
	<nav class="megamenu navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="active" href="driver-dashboard.jsp">Home</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="patient-request-driver-for-ambulance.jsp">Patients Request For Ambulance</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="add-ambulance-driver.jsp">Add Ambulance</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-view-ambulance.jsp">View Ambulance</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-ambulance-status.jsp">Ambulance Status</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="caret"></span> My Account</a>
						<ul class="dropdown-menu">
							<li><a href="driver-profile.jsp">My Profile</a></li>
							<li><a href="driver-change-password.jsp">Change Password</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>