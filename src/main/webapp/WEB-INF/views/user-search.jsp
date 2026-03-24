<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Search Property</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboard.css">
<style>
/* Optional: add basic table styling */
table {
    width:100%;
    border-collapse: collapse;
    margin-top: 20px;
}
table th, table td {
    border:1px solid #ccc;
    padding:8px;
    text-align:left;
}
table th {
    background:#f1f5f9;
}
.book-btn {
    background:#0f172a;
    color:white;
    padding:5px 10px;
    text-decoration:none;
    border-radius:4px;
}
.book-btn:hover {
    background:#1e293b;
}
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>User Panel</h2>
    <ul>
        <li><a href="<%=request.getContextPath()%>/user/dashboard">Dashboard</a></li>
        <li><a href="<%=request.getContextPath()%>/user/search">Search Property</a></li>
        <li><a href="<%=request.getContextPath()%>/user/predict">Predict Price</a></li>
        <li><a href="<%=request.getContextPath()%>/user/myBookings">My Bookings</a></li>
        <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">

    <h1>Search Property 🔍</h1>

    <!-- Search Form -->
    <div class="search-box">
        <form action="searchProperty" method="post" class="form-grid">
            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" required>
            </div>
            <div class="form-group">
                <label>State</label>
                <input type="text" name="state" required>
            </div>
            <div class="form-group full-width">
                <button class="search-btn">Search</button>
            </div>
        </form>
    </div>

    <!-- Results -->
    <div class="result-box">
        <h3>Results:</h3>

        <c:if test="${empty properties}">
            <p class="no-data">No properties found.</p>
        </c:if>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>City ID</th>
                    <th>State</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${properties}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.title}</td>
                        <td>${p.city_id}</td>
                        <td>${p.state}</td>
                        <td>₹${p.price}</td>
                        <td>
                            <a class="book-btn" href="${pageContext.request.contextPath}/user/bookProperty?id=${p.id}">
                                Book Now
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>

</div>

</body>
</html>