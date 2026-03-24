<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
</head>

<body>

	<div class="container">

		<h2>Create Account</h2>

		<form action="register" method="post" name="registerForm" onsubmit="return validateRegisterForm()">
		

			<div class="input-group">
				<label>Name</label> <input type="text" name="name" required>
			</div>

			<div class="input-group">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="input-group">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<div class="input-group">
				<label>Role</label> <input type="text" name="role"
					placeholder="USER or ADMIN">
			</div>

			<button type="submit">Register</button>

			<div class="form-link">
				Already have account? <a href="login">Login</a>
			</div>

		</form>

	</div>
	<script
		src="<%=request.getContextPath()%>/resources/js/registerValidation.js"></script>
</body>
</html>