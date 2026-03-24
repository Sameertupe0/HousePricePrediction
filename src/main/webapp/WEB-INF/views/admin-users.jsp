<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css">
</head>

<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<h2>Admin Panel</h2>

		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></li>
			<li><a href="#">Manage Users</a></li>
			<li><a href="#">Manage Properties</a></li>
			<li><a href="#">View Predictions</a></li>
			<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	<div class="main-content">

		<h1>Manage Users</h1>

		<div class="table-container">

			<table class="user-table">

				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach var="u" items="${users}">

						<tr>

							<td>${u.id}</td>
							<td>${u.name}</td>
							<td>${u.email}</td>

							<td><span
								class="${fn:toUpperCase(u.status) == 'ACTIVE' ? 'active' : 'blocked'}">
									${u.status} </span></td>

							<td><a class="btn delete" href="deleteUser?id=${u.id}">Delete/</a>

								<c:if test="${fn:toUpperCase(u.status) == 'ACTIVE'}">
									<a class="btn block" href="blockUser?id=${u.id}">Block</a>
								</c:if> <c:if test="${fn:toUpperCase(u.status) == 'BLOCKED'}">
									<a class="btn activate" href="activateUser?id=${u.id}">Activate</a>
								</c:if></td>

						</tr>

					</c:forEach>

				</tbody>

			</table>


		</div>

	</div>

</body>
</html>