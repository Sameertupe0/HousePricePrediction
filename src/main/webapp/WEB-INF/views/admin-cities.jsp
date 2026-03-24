<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Manage Cities</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/cities.css">

<!-- Leaflet Map CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />

<!-- Leaflet Map JS -->
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

</head>

<body>

	<!-- Sidebar -->

	<div class="sidebar">

		<h2>Admin Panel</h2>

		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/users">Manage
					Users</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/states">Manage
					States</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/cities">Manage
					Cities</a></li>
			<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>

	</div>


	<!-- Main Content -->

	<div class="main-content">

		<h1>Manage Cities</h1>


		<!-- Add City Form -->

		<form action="addCity" method="post">

			<label>City Name</label> <input type="text" name="name" required>

			<br> <br> <label>State</label> <select name="state_id"
				required>

				<option value="">Select State</option>

				<c:forEach var="s" items="${states}">

					<option value="${s.id}">${s.name}</option>

				</c:forEach>

			</select> <br> <br> <label>Latitude</label> <input type="text"
				id="latitude" name="latitude" readonly> <br> <br>
			<label>Longitude</label> <input type="text" id="longitude"
				name="longitude" readonly> <br> <br> <br> <label>Location</label>
			<input type="text" placeholder="Area/ locality" name="location">
			<br> <br>

			<!-- MAP -->

			<div id="map" style="height: 400px; width: 100%; margin-top: 20px;"></div>

			<br>

			<button type="submit">Add City</button>

		</form>


		<!-- Cities Table -->

		<div class="table-container">

			<table class="user-table">

				<thead>

					<tr>
						<th>ID</th>
						<th>City</th>
						<th>State ID</th>
						<th>Latitude</th>
						<th>Longitude</th>
						<th>Location</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<c:forEach var="c" items="${cities}">

						<tr>

							<td>${c.id}</td>
							<td>${c.name}</td>
							<td>${c.state_id}</td>
							<td>${c.latitude}</td>
							<td>${c.longitude}</td>
							<td>${c.location}</td>

							<td><a class="btn delete" href="deleteCity?id=${c.id}">Delete</a>
							</td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

	</div>


	<!-- Leaflet Map Script -->

	<script>

var map = L.map('map').setView([20.5937, 78.9629], 5);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

var marker;

map.on('click', function(e){

    var lat = e.latlng.lat;
    var lng = e.latlng.lng;

    // Fill latitude & longitude
    document.getElementById("latitude").value = lat;
    document.getElementById("longitude").value = lng;

    if(marker){
        map.removeLayer(marker);
    }

    marker = L.marker([lat,lng]).addTo(map);

    // Reverse Geocoding to get location name
    fetch("https://nominatim.openstreetmap.org/reverse?format=json&lat=" + lat + "&lon=" + lng)
    .then(response => response.json())
    .then(data => {

        if(data.display_name){
            document.querySelector("input[name='location']").value = data.display_name;
        }

    });

});

</script>

</body>
</html>