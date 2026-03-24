<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboard.css">
</head>

<body>

<div class="sidebar">
<h2>User Panel</h2>

<ul>
<li><a href="#">Dashboard</a></li>
<li><a href="<%=request.getContextPath()%>/user/search">Search Property</a></li>
<li><a href="<%=request.getContextPath()%>/user/predict">Predict Price</a></li>
<li><a href="<%=request.getContextPath()%>/user/myBookings">My Bookings</a></li>
<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
</ul>

</div>

<div class="main-content">

<h1>Welcome User</h1>

<div class="cards">

<div class="card">
<h3>Properties Available</h3>
<p>60</p>
</div>

<div class="card">
<h3>My Bookings</h3>
<p>4</p>
</div>

<div class="card">
<h3>Predictions Done</h3>
<p>10</p>
</div>

</div>

</div>

</body>
</html>