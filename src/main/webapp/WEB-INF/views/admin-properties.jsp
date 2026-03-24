<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Manage Properties</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/resources/css/dashboard.css">

<!-- Leaflet CSS -->
<link rel="stylesheet"
href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/resources/css/properties.css">

<!-- Leaflet JS -->
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2>Admin Panel</h2>

<ul>
<li><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></li>
<li><a href="<%=request.getContextPath()%>/admin/users">Manage Users</a></li>
<li><a href="<%=request.getContextPath()%>/admin/states">Manage States</a></li>
<li><a href="<%=request.getContextPath()%>/admin/cities">Manage Cities</a></li>
<li><a href="<%=request.getContextPath()%>/admin/properties">Manage Properties</a></li>
<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
</ul>

</div>


<!-- Main Content -->

<div class="main-content">

<h1>Manage Properties</h1>


<!-- Add Property Form -->

<form action="addProperty" method="post">

<label>Property Title</label>
<input type="text" name="title" required>

<br><br>

<label>Price</label>
<input type="number" name="price" required>

<br><br>

<label>Bedrooms</label>
<input type="number" name="bedrooms">

<br><br>

<label>Bathrooms</label>
<input type="number" name="bathrooms">

<br><br>

<label>Area (sqft)</label>
<input type="number" name="area">

<br><br>

<label>Property Type</label>
<select name="property_type">

<option value="Apartment">Apartment</option>
<option value="House">House</option>
<option value="Villa">Villa</option>

</select>

<br><br>

<label>City</label>

<select name="city_id" required>

<option value="">Select City</option>

<c:forEach var="c" items="${cities}">

<option value="${c.id}">
${c.name}
</option>

</c:forEach>

</select>

<br><br>

<label>Location</label>
<input type="text" name="location" placeholder="Area / locality">

<br><br>

<label>Latitude</label>
<input type="text" id="latitude" name="latitude" readonly>

<br><br>

<label>Longitude</label>
<input type="text" id="longitude" name="longitude" readonly>

<br><br>


<!-- Map -->

<label>Search Property Location</label>
<input type="text" id="searchLocation" placeholder="Search address or area">
<button type="button" onclick="searchLocation()">Search</button>

<br><br>

<div id="map" style="height:400px;width:100%;margin-top:20px;"></div>

<br>

<button type="submit">Add Property</button>

</form>


<!-- Property Table -->

<div class="table-container">

<table class="user-table">

<thead>

<tr>

<th>ID</th>
<th>Title</th>
<th>Price</th>
<th>Bedrooms</th>
<th>Bathrooms</th>
<th>Area</th>
<th>Location</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<c:forEach var="p" items="${properties}">

<tr>

<td>${p.id}</td>
<td>${p.title}</td>
<td>${p.price}</td>
<td>${p.bedrooms}</td>
<td>${p.bathrooms}</td>
<td>${p.area}</td>
<td>${p.location}</td>

<td>

<a class="btn block"
href="editProperty?id=${p.id}">Edit</a>

<a class="btn delete"
href="deleteProperty?id=${p.id}">Delete</a>

</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>


<!-- Map Script -->

<script>

var map = L.map('map').setView([20.5937, 78.9629], 5);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

var marker;

map.on('click', function(e){

    var lat = e.latlng.lat;
    var lng = e.latlng.lng;

    document.getElementById("latitude").value = lat;
    document.getElementById("longitude").value = lng;

    if(marker){
        map.removeLayer(marker);
    }

    marker = L.marker([lat,lng]).addTo(map);

    // Get location name automatically

    fetch("https://nominatim.openstreetmap.org/reverse?format=json&lat=" + lat + "&lon=" + lng)

    .then(response => response.json())

    .then(data => {

        if(data.display_name){
            document.querySelector("input[name='location']").value = data.display_name;
        }

    });

});
function searchLocation(){

    var location = document.getElementById("searchLocation").value;

    if(location.trim() === ""){
        alert("Please enter a location");
        return;
    }

    var script = document.createElement("script");

    script.src =
    "https://nominatim.openstreetmap.org/search?format=json&limit=1&q="
    + encodeURIComponent(location)
    + "&json_callback=processSearch";

    document.body.appendChild(script);
}

/* callback function */

function processSearch(data){

    if(data.length === 0){
        alert("Location not found");
        return;
    }

    var lat = data[0].lat;
    var lon = data[0].lon;

    map.setView([lat, lon], 15);

    if(marker){
        map.removeLayer(marker);
    }

    marker = L.marker([lat, lon]).addTo(map);

    document.getElementById("latitude").value = lat;
    document.getElementById("longitude").value = lon;

    document.querySelector("input[name='location']").value =
        data[0].display_name;
}


document.getElementById("searchLocation")
.addEventListener("keydown", function(e){

    if(e.key === "Enter"){
        e.preventDefault();
        searchLocation();
    }

});
</script>



</body>
</html>