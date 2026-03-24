<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
</head>

<body>

<div class="container">

<h2>User Login</h2>

<form action="${pageContext.request.contextPath}/login" method="post">


<div class="input-group">
<label>Email</label>
<input type="email" name="email" required>
</div>

<div class="input-group">
<label>Password</label>
<input type="password" name="password" required>
</div>

<button type="submit">Login</button>

<div class="form-link">
Don't have account? <a href="register">Register</a>
</div>

</form>

</div>
<script src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
</body>
</html>