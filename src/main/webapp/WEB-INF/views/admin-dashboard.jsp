<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css">
</head>

<body>

	<div class="sidebar">
		<h2>Admin Panel</h2>

		<ul>
			<li><a href="#">Dashboard</a></li>
			<li><a href="users">Manage Users</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/states">Manage States</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/cities">Manage Cities</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/properties">Manage Properties</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/view-predictions">View Predictions</a></li>
			<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>

	</div>

	<div class="main-content">

		<h1>Welcome Admin</h1>

		<div class="cards">

			<div class="card">
				<h3>Total Users</h3>
				<p>${totalUsers}</p>
			</div>

			<div class="card">
				<h3>Total Properties</h3>
				<p>${totalProperties}</p>
			</div>

			
		</div>

	</div>

</body>
</html>