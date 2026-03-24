<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Predict Price</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/dashboard.css">

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>User Panel</h2>

    <ul>
        <li><a href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/user/search">Search Property</a></li>
        <li><a href="${pageContext.request.contextPath}/user/predict">Predict Price</a></li>
        <li><a href="${pageContext.request.contextPath}/user/myBookings">My Bookings</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">

    <h1>Predict House Price 🏠</h1>

    <!-- FORM BOX -->
    <div class="search-box">

        <form id="predictForm" class="form-grid">

            <div class="form-group">
                <label>Area (sq ft)</label>
                <input type="number" id="area" required>
            </div>

            <div class="form-group">
                <label>Bedrooms</label>
                <input type="number" id="bedrooms" required>
            </div>

            <div class="form-group">
                <label>Bathrooms</label>
                <input type="number" id="bathrooms" required>
            </div>

            <div class="form-group">
                <label>City</label>
                <select id="city_id">
                    <option value="1">Nagpur</option>
                    <option value="2">Mumbai</option>
                    <option value="3">Pune</option>
                </select>
            </div>

            <div class="form-group">
                <label>Property Type</label>
                <select id="property_type">
                    <option value="Apartment">Apartment</option>
				<option value="House">House</option>
				<option value="Villa">Villa</option>
                </select>
            </div>

            <div class="form-group full-width">
                <button type="submit" class="search-btn">Predict Price</button>
            </div>

        </form>

    </div>

    <!-- RESULT -->
    <div class="result-box" id="resultBox" style="display:none;">
        <h3>Estimated Price</h3>
        <h2 id="priceResult"></h2>
    </div>

</div>

<!-- JS -->
<script>
document.getElementById("predictForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const data = {
        area: document.getElementById("area").value,
        bedrooms: document.getElementById("bedrooms").value,
        bathrooms: document.getElementById("bathrooms").value,
        city_id: document.getElementById("city_id").value,
        property_type: document.getElementById("property_type").value
    };

    fetch("${pageContext.request.contextPath}/predictPrice", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(result => {
        document.getElementById("resultBox").style.display = "block";
        document.getElementById("priceResult").innerText = "₹ " + result.predicted_price;
    })
    .catch(err => {
        alert("Prediction failed!");
        console.error(err);
    });
});
</script>

</body>
</html>