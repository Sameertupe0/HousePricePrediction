<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css">
	
	
<link rel="stylesheet"
href="<%=request.getContextPath()%>/resources/css/states.css">
</head>

<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<h2>Admin Panel</h2>

		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></li>
			<li><a href="users">Manage Users</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/states">Manage States</a></li>
			<li><a href="#">Manage Properties</a></li>
			<li><a href="#">View Predictions</a></li>
			<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	<div class="main-content">

		<h1>Manage States</h1>

		<form action="addState" method="post">

			<input type="text" name="name" placeholder="Enter State Name"
				required>

			<button type="submit">Add State</button>

		</form>


		<div class="table-container">

			<table class="user-table">

				<thead>
					<tr>
						<th>ID</th>
						<th>State Name</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach var="s" items="${states}">

						<tr>

							<td>${s.id}</td>
							<td>${s.name}</td>

							<td><a class="btn delete" href="deleteState?id=${s.id}">Delete</a>
							</td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

	</div>

</body>
</html>