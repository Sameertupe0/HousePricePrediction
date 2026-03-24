<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Property</title>

<!-- Custom CSS -->
<style>
    /* Reset & Base */
    * { margin:0; padding:0; box-sizing:border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    body { display: flex; min-height: 100vh; background: #f4f6f9; color: #1f2937; }

    /* Sidebar */
    .sidebar {
        width: 250px; background: #1e293b; color: #fff; padding: 30px 20px; flex-shrink: 0;
    }
    .sidebar h2 { margin-bottom: 30px; font-size: 1.8rem; text-align: center; }
    .sidebar ul { list-style: none; }
    .sidebar ul li { margin-bottom: 20px; }
    .sidebar ul li a { color: #fff; text-decoration: none; font-weight: 500; display: block; padding: 8px 12px; border-radius: 6px; }
    .sidebar ul li a:hover { background: #0ea5e9; }

    /* Main Content */
    .main-content {
        flex: 1; padding: 40px; background: #f4f6f9;
    }
    .main-content h1 { margin-bottom: 30px; font-size: 2rem; color: #0f172a; }

    /* Form Styling */
    form {
        background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        max-width: 700px; margin: 0 auto;
    }
    label { display: block; margin-bottom: 6px; font-weight: 600; color: #0f172a; }
    input[type="text"],
    input[type="number"],
    select {
        width: 100%; padding: 12px; margin-bottom: 20px; border: 1px solid #cbd5e1;
        border-radius: 8px; transition: 0.3s;
    }
    input[type="text"]:focus,
    input[type="number"]:focus,
    select:focus { border-color: #0ea5e9; outline: none; }

    button {
        background: #0ea5e9; color: #fff; padding: 15px 30px; font-size: 1rem;
        border: none; border-radius: 8px; cursor: pointer; font-weight: bold;
        transition: 0.3s;
    }
    button:hover { background: #0284c7; }

    /* Responsive */
    @media (max-width: 768px) {
        body { flex-direction: column; }
        .sidebar { width: 100%; display: flex; justify-content: center; padding: 20px; }
        .sidebar ul { display: flex; gap: 15px; }
        .sidebar ul li { margin: 0; }
        .main-content { padding: 20px; }
    }
</style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/properties">Manage Properties</a></li>
        <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
    </ul>
</div>

<div class="main-content">
<h1>Edit Property</h1>

<form action="updateProperty" method="post">
    <input type="hidden" name="id" value="${property.id}">

    <label>Title</label>
    <input type="text" name="title" value="${property.title}" required>

    <label>Price</label>
    <input type="number" name="price" value="${property.price}" required>

    <label>Bedrooms</label>
    <input type="number" name="bedrooms" value="${property.bedrooms}">

    <label>Bathrooms</label>
    <input type="number" name="bathrooms" value="${property.bathrooms}">

    <label>Area (sqft)</label>
    <input type="number" name="area" value="${property.area}">

    <label>Property Type</label>
    <select name="property_type">
        <option value="Apartment" ${property.property_type=='Apartment'?'selected':''}>Apartment</option>
        <option value="House" ${property.property_type=='House'?'selected':''}>House</option>
        <option value="Villa" ${property.property_type=='Villa'?'selected':''}>Villa</option>
    </select>

    <label>City</label>
    <select name="city_id" required>
        <option value="">Select City</option>
        <c:forEach var="c" items="${cities}">
            <option value="${c.id}" ${property.city_id==c.id?'selected':''}>${c.name}</option>
        </c:forEach>
    </select>

    <label>Location</label>
    <input type="text" name="location" value="${property.location}">

    <label>Latitude</label>
    <input type="text" name="latitude" value="${property.latitude}" readonly>

    <label>Longitude</label>
    <input type="text" name="longitude" value="${property.longitude}" readonly>

    <button type="submit">Update Property</button>
</form>

</div>
</body>
</html>