<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Dropdown Menu with Search Box | CodingNepal</title>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;    
  font-family: 'Poppins', sans-serif;
}
.wrapper {
list-style:none;
  background: #d50000;
  position: fixed;
  width: 100%;
}
.wrapper nav {
  position: relative;
  display: flex;
  width: 100%;
  margin: 0 auto;
  height: 70px;
  align-items: center;
  justify-content: space-between;
  padding-right: 80px;
    background-color:#ff1744;
}
nav .content {
  display: flex;
  align-items: center;
  width: 100%;
  justify-content: space-between;
  padding-top: 10px;
}
nav .content .links {
  display: flex;
  margin-left: auto;
  padding-top: 10px;
}
.content .logo a {
  color: #fff;
  font-size: 15px;
  font-weight: 600;
  padding-left: 120px;
}
.content .links li {
  list-style: none;
  line-height: 70px;
}
.content .links li a,
.content .links li label {
  color: #fff;
  font-size: 18px;
  padding: 9px 9px;
  border-radius: 5px;
  transition: all 0.3s ease;
  text-decoration: none;
}
.content .links li label {
  display: none;
}
.content .links li a:hover,
.content .links li label:hover {
  background: blue;
}
.wrapper .search-icon,
.wrapper .menu-icon {
  color: #fff;
  font-size: 18px;
  cursor: pointer;
  line-height: 70px;
  width: 70px;
  text-align: center;
}
.wrapper .menu-icon {
  display: none;
}

/* Dropdown Menu code start */
.content .links ul {
  position: absolute;
  background: #171c24;
  top: 80px;
  z-index: -1;
  opacity: 0;
  visibility: hidden;
}
.content .links li:hover > ul {
  top: 70px;
  opacity: 1;
  visibility: visible;
  transition: all 0.3s ease;
}
.content .links ul li a {
  display: block;
  width: 100%;
  line-height: 30px;
  border-radius: 0px !important;
  background: #d50000;
  
}
.content .links ul ul {
  position: absolute;
  top: 0;
  right: calc(-100% + 8px);
}
.content .links ul li {
  position: relative;
}
.content .links ul li:hover ul {
  top: 0;
}

/* Responsive code start */
@media screen and (max-width: 1250px) {
  nav .content .links {
    margin-left: 30px;
  }
  .content .links li a {
    padding: 8px 13px;
  }
}

@media screen and (max-width: 900px) {
  .wrapper .menu-icon {
    display: block;
  }
  .wrapper #show-menu:checked ~ .menu-icon i::before {
    content: "\f00d";
  }
  nav .content .links {
    display: block;
    position: fixed;
    background: #14181f;
    height: 100%;
    width: 100%;
    top: 70px;
    left: -100%;
    margin-left: 0;
    max-width: 350px;
    overflow-y: auto;
    padding-bottom: 100px;
    transition: all 0.3s ease;
  }
  nav #show-menu:checked ~ .content .links {
    left: 0%;
  }
  .content .links li {
    margin: 15px 20px;
  }
  .content .links li a,
  .content .links li label {
    line-height: 40px;
    font-size: 15px;
    display: block;
    padding: 8px 18px;
    cursor: pointer;
  }
  .content .links li a.desktop-link {
    display: none;
  }

  /* dropdown responsive code start */
  .content .links ul,
  .content .links ul ul {
    position: static;
    opacity: 1;
    visibility: visible;
    background: none;
    max-height: 0px;
    overflow: hidden;
  }
  .content .links #show-features:checked ~ ul,
  .content .links #show-services:checked ~ ul,
  .content .links #show-items:checked ~ ul {
    max-height: 100vh;
  }
  .content .links ul li {
    margin: 7px 20px;
  }
  .content .links ul li a {
    font-size: 18px;
    line-height: 30px;
    border-radius: 5px !important;
  }
}

@media screen and (max-width: 400px) {
  .content .logo a {
    font-size: 27px;
  }
  .wrapper .search-box {
    max-width: calc(100% - 70px);
  }
  .wrapper .search-box .go-icon {
    width: 30px;
    right: 0;
  }
  .wrapper .search-box input {
    padding-right: 30px;
  }
 
}
  </style>
</head>
<body>
  <div class="wrapper">
    <nav>
    
      <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label>
      <div class="content">
        <div class="logo"><a href="#"><i class="fa-solid fa-truck-medical fa-2x"></i> Med+</a></div>
        <ul class="links">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="addAmbulance.jsp">Add-Ambulence</a></li>
          <li><a href="admin-view-ambulance.jsp">View Ambulances</a></li>
          <li><a href="admin-view-patient.jsp">View-patient</a></li>
          <li><a href="patient-request-driver-for-ambulance.jsp">user-request</a></li>
          <li><a href="admin-view-patients-complaint-feedback.jsp">Feedback/Complaints</a></li>
          <li><a href="admin-generate-report.jsp">Report</a></li>
          <li>
            <a href="#" class="desktop-link">My-Account</a>
            <ul>
              <li><a href="admin-profile.jsp">My Profile</a></li>
              <li><a href="admin-change-password.jsp">Change Password</a></li>
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</body>
</html>
