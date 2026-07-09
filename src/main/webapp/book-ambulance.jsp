<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
   

 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
    
    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>

    <style>
        .host_version {
            display: flex;
            justify-content: center;
            align-item:center;
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
            padding-top: 50px; 
             margin-top:140px;
            margin-left: 100px;
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
            margin-bottom: 75px;
            color: blue;
        }
        
        input, textarea {
            background: transparent;
            width: 30rem;
            height: 2.5em;
            border: px solid black; 
            padding: 2px;
            margin-left: 30px;  
        }
        
        input, select {
            background: transparent;
            width: 30rem;
            height: 3rem;
            border: px solid black; 
            padding: 2px;  
        }
        
        label {
            font-size: 1.3rem;
            padding: 0.3rem;
            color: #111;
            font-weight: bold;
            margin-left: 30px;  
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
        margin-left:80px;
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
        
        .form-container {
            float: left;
            margin-right: 20px;
        }

        .map-container {
            float: left;
            width: 600px;
            height: 600px;
            border: 1px solid black;
            margin-top:140px;
            margin-left:140px;
        }

        #map {
            width: 595px;
            height: 595px;
        }
        .leaflet-routing-container .leaflet-routing-alt {
          height: 50px;
            width: 200px; 
            overflow: hidden;
              background-color: rgba(0, 0, 0, 0) !important;
                background-color: transparent !important;
    
    }
    </style>
</head>
<body class="host_version">
   <%
    if (session.getAttribute("uname") != null && !session.getAttribute("uname").equals("")) {
        String bookingId = (String) session.getAttribute("bookingId");
        if (bookingId == null) {
            bookingId = DatabaseConnection.generateUniqueBookingId(); 
            session.setAttribute("bookingId", bookingId);
        }
%>
    <jsp:include page="user-header.jsp"></jsp:include>
    
    <div class="row">
        <div class="login">
            <form role="form" action="BookAmbulance" method="post" class="form" >
                <h1>Book Ambulance</h1>
                <div class="form-group">
                    <label>Booking ID</label>
                    <input type="text" name="bookingId" value="<%= bookingId %>" readonly>
                </div>
                <div class="form-group">
                    <label>Patient Disease</label>
                    <textarea name="pdisease" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label>Ambulance Vehicle No</label>
                    <input type="text" name="vehicleNo" value="<%= request.getParameter("avn") %>" readonly>
                </div>
                <div class="form-group">
                    <label>Source Address</label>
                    <input type="text" id="saddress" name="scity" " oninput="updateMap()" />
                </div>
                <div class="form-group">
                    <label>Destination Address</label>
                    <input type="text" id="daddress" name="dcity" oninput="updateMap()" />
                </div>
                <button type="submit">Book Ambulance</button>
            </form>
            </div>
        </div>
        <div class="map-container ">
            <div id="map" class="map"></div>
        </div>

        <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>

         <script>
        var map = L.map('map').setView([20.5937, 78.9629], 6); // Centered on India
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        var routingControl;

        function geocode(address, callback) {
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        var latlng = data[0];
                        callback(latlng.lat, latlng.lon);
                    } else {
                        alert('Geocode for ' + address + ' was not successful.');
                    }
                });
        }

        function updateMap() {
            var source = document.getElementById('saddress').value;
            var destination = document.getElementById('daddress').value;
            if (source && destination) {
                geocode(source, function (lat1, lon1) {
                    geocode(destination, function (lat2, lon2) {
                        if (routingControl) {
                            map.removeControl(routingControl);
                        }
                        routingControl = L.Routing.control({
                            waypoints: [
                                L.latLng(lat1, lon1),
                                L.latLng(lat2, lon2)
                            ],
                            routeWhileDragging: true,
                            summaryTemplate: '<h3>{distance}, {time}</h3>'
                        }).addTo(map);

                        
                    });
                });
            }
        }

        



 
        function debounce(func, wait) {
            let timeout;
            return function() {
                const later = () => {
                    clearTimeout(timeout);
                    func();
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        }

        var debouncedUpdateMap = debounce(updateMap, 300);

        document.getElementById('bookForm').onsubmit = function(event) {
            event.preventDefault();
            var form = event.target;
            var formData = new FormData(form);
            fetch(form.action, {
                method: 'POST',
                body: formData
            }).then(response => response.text())
              .then(data => {
                  var urlParams = new URLSearchParams(window.location.search);
                  urlParams.set('success', 'true');
                  window.location.search = urlParams.toString();
              })
              .catch(error => {
                  var urlParams = new URLSearchParams(window.location.search);
                  urlParams.set('success', 'false');
                  window.location.search = urlParams.toString();
              });
        }

        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('success') === 'true') {
                alert('Ambulance booked successfully!');
            } else if (urlParams.get('success') === 'false') {
                alert('Failed to book ambulance. Please try again.');
            }
        }
    </script>
    <jsp:include page="footer.jsp"></jsp:include>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>
</html>
