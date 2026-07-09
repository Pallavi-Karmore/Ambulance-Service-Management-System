<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Create Account</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">

    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />

    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #map {
        margin-top:60px;
           width:500px;
        height: 400px;
        }
    </style>
</head>

<body>

    <div class="form-control">
        <form id="accountForm" method="post" class="form">
          
            <label>Address</label>
            <input type="text" name="address" id="address" placeholder="Enter Address" onblur="fetchAndUpdateMap()" />

            <label>Mobile No</label>
            <input type="text" name="mobile" id="txtMB" onblur="return ValidateMobNumber('txtMB')" />

           
        </form>

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
        var userMarker;

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

        function updateMap(address) {
            if (!address) {
                alert('No valid address found');
                return;
            }

            navigator.geolocation.getCurrentPosition(function (position) {
                var lat1 = position.coords.latitude;
                var lon1 = position.coords.longitude;

                if (userMarker) {
                    map.removeLayer(userMarker);
                }

                userMarker = L.marker([lat1, lon1]).addTo(map)
                    .bindPopup('You are here')
                    .openPopup();

                geocode(address, function (lat2, lon2) {
                    if (routingControl) {
                        map.removeControl(routingControl);
                    }

                    routingControl = L.Routing.control({
                        waypoints: [
                            L.latLng(lat1, lon1),
                            L.latLng(lat2, lon2)
                        ],
                        routeWhileDragging: true,
                        createMarker: function (i, waypoint, n) {
                            var marker = L.marker(waypoint.latLng).bindPopup(i === 0 ? 'Your Location' : 'Destination');
                            return marker;
                        }
                    }).on('routesfound', function(e) {
                        var routes = e.routes;
                        var summary = routes[0].summary;
                        console.log('Distance: ' + (summary.totalDistance / 1000).toFixed(2) + ' km, Time: ' + Math.round(summary.totalTime / 60) + ' minutes');
                    }).addTo(map);
                });
            }, function (error) {
                alert('Geolocation error: ' + error.message);
            });
        }

        function fetchAndUpdateMap() {
            var address = document.getElementById('address').value;
            if (address) {
                updateMap(address);
            }
        }

        function submitForm() {
            var form = document.getElementById('accountForm');
            var formData = new FormData(form);

            fetch('AccountCreate', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    updateMap(data.address);
                } else {
                    alert('Account creation failed.');
                }
            })
            .catch(error => console.error('Error:', error));
        }

        function ValidateEmail() {
            // Add email validation logic here
        }

        function ValidateMobNumber(id) {
            // Add mobile number validation logic here
        }
    </script>
</body>

</html>
