<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>View Predictions</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css">

<style>
.prediction-box {
	background: #fff;
	padding: 25px;
	border-radius: 10px;
	width: 400px;
}

.prediction-box input, .prediction-box select {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
}

.predict-btn {
	width: 100%;
	padding: 12px;
	background: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

.result {
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
	color: green;
}
</style>

</head>

<body>

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
			<li><a href="<%=request.getContextPath()%>/admin/properties">Manage
					Properties</a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/view-predictions">View
					Predictions</a></li>
			<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>
	</div>

	<div class="main-content">

		<h1>Property Price Prediction</h1>

		<div class="prediction-box">

			<label>Bedrooms</label> <input type="number" id="bedrooms"> <label>Bathrooms</label>
			<input type="number" id="bathrooms"> <label>Area
				(sqft)</label> <input type="number" id="area"> <label>City</label> <select
				id="city_id">
				<option value="1">Nagpur</option>
				<option value="2">Pune</option>
				<option value="3">Mumbai</option>
			</select> <label>Property Type</label> <select id="property_type">
				<option value="Apartment">Apartment</option>
				<option value="House">House</option>
				<option value="Villa">Villa</option>
			</select>

			<button class="predict-btn" onclick="predictPrice()">Predict
				Price</button>

			<div class="result" id="result"></div>

		</div>

	</div>

	<script>
function predictPrice(){

    fetch("<%=request.getContextPath()%>/predictPrice", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            bedrooms: document.getElementById("bedrooms").value,
            bathrooms: document.getElementById("bathrooms").value,
            area: document.getElementById("area").value,
            city_id: document.getElementById("city_id").value,
            property_type: document.getElementById("property_type").value
        })
    })
    .then(res => res.json())
    .then(data => {

        console.log("Response:", data); // 🔥 Debug

        document.getElementById("result").innerHTML =
            "💰 Predicted Price: ₹ " + (data.predicted_price || 0);

    })
    .catch(err => {
        console.error(err);
        document.getElementById("result").innerHTML = "Error fetching prediction";
    });

}

</script>

</body>
</html>