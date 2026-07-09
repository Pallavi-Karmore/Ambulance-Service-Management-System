<%@ page import="java.sql.*, com.connection.DatabaseConnection" %>
<%
    String patientId = request.getParameter("id");
    String avn = request.getParameter("avn");
    String sourceCity = null;
    String ambulanceCity = null;

    if (patientId != null && !patientId.isEmpty()) {
        String sqlPatient = "SELECT source_city FROM tblpatient WHERE patient_id = ?";
        try {
            PreparedStatement stmt = DatabaseConnection.getConnection().prepareStatement(sqlPatient);
            stmt.setString(1, patientId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                sourceCity = rs.getString("source_city");
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (avn != null && !avn.isEmpty()) {
        String sqlAmbulance = "SELECT city FROM tblambulance WHERE ambulance_vehicle_no = ?";
        try {
            PreparedStatement stmt = DatabaseConnection.getConnection().prepareStatement(sqlAmbulance);
            stmt.setString(1, avn);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ambulanceCity = rs.getString("city");
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display Area on Map</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        h2 {
            color: red;
            text-align: center;
            margin-top:20px;
            margin-bottom:20px;
            
           
        }
        #map {
            width: 1200px;
            height: 595px;
        }
        
        .container{
            margin-top:80px;
            float: left;
            width:  1600px;
                        
             margin-left:80px;
                
        }
        .map-container {
            float: left;
            width:  1204px;
            height: 600px;
            border: 1px solid black;
            margin-left: 220px;
        }
        .leaflet-routing-container .leaflet-routing-alt {
          height: 1px;
            width: 200px; 
            overflow: hidden;
            
    }
    .icon-container{
    
    color:#d50000 ;
    }
    </style>
</head>
<body>
        <jsp:include page="admin-header.jsp"></jsp:include>
         <h2>User-Status</h2>

   <div class="container">
   <h2>User Status </h2>
    <div class="map-container">
    
        <div id="map"></div>
    </div>
    </div>

    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
  <script>
        var map = L.map('map').setView([20.5937, 78.9629], 5); // Centered on India

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        function geocode(address, isAmbulanceCity, callback) {
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        var latlng = data[0];
                        callback(latlng.lat, latlng.lon, isAmbulanceCity);
                    } else {
                        alert('Geocode for ' + address + ' was not successful.');
                    }
                });
        }

        function calculateDistance(lat1, lon1, lat2, lon2) {
            var R = 6371; 
            var dLat = deg2rad(lat2 - lat1);
            var dLon = deg2rad(lon2 - lon1);
            var a = 
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var distance = R * c; 
            return distance;
        }

        function deg2rad(deg) {
            return deg * (Math.PI / 180);
        }

        var sourceCity = '<%= sourceCity %>';  
        var ambulanceCity = '<%= ambulanceCity %>'; 
        if (sourceCity && sourceCity.trim() !== "" && ambulanceCity && ambulanceCity.trim() !== "") {
            geocode(sourceCity, false, function(lat1, lon1) {
                var sourceMarker = L.marker([lat1, lon1]).addTo(map);
                sourceMarker.bindPopup("<b>Source City:</b> " + sourceCity).openPopup();
                map.setView([lat1, lon1], 6);

                geocode(ambulanceCity, true, function(lat2, lon2) {
                    var ambulanceIcon = L.divIcon({
                        className: 'custom-div-icon',
                        html: '<div class="icon-container"><i class="fas fa-ambulance fa-4x"></i></div>',
                        iconSize: [30, 30],
                        iconAnchor: [15, 30]
                    });

                    var ambulanceMarker = L.marker([lat2, lon2], { icon: ambulanceIcon }).addTo(map);
                    ambulanceMarker.bindPopup("<b>Ambulance City:</b> " + ambulanceCity).openPopup();

                    var latlngs = [
                        [lat1, lon1],
                        [lat2, lon2]
                    ];

                    L.Routing.control({
                        waypoints: [
                            L.latLng(lat1, lon1),
                            L.latLng(lat2, lon2)
                        ],
                        routeWhileDragging: true,
                        showAlternatives: true,
                        lineOptions: {
                            styles: [{color: 'red', opacity: 0.6, weight: 4}]
                        }
                    }).addTo(map);

                    var distance = calculateDistance(lat1, lon1, lat2, lon2);
                    sourceMarker.bindPopup("<b>Source City:</b> " + sourceCity + "<br><b>Ambulance City:</b> " + ambulanceCity + "<br><b>Distance:</b> " + distance.toFixed(2) + " km").openPopup();
                    ambulanceMarker.bindPopup("<b>Ambulance City:</b> " + ambulanceCity + "<br><b>Source City:</b> " + sourceCity + "<br><b>Distance:</b> " + distance.toFixed(2) + " km").openPopup();
                });
            });
        } else {
            alert('Patient or ambulance not found, or no source city available.');
        }

    </script>
</body>
</html>