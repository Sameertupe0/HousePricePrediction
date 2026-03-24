<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>My Bookings</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

/* Layout */
body{
    display:flex;
    min-height:100vh;
    background:#f1f5f9;
}

/* Sidebar */
.sidebar{
    width:240px;
    background:#0f172a;
    color:white;
    padding:25px 15px;
}

.sidebar h2{
    text-align:center;
    margin-bottom:30px;
}

.sidebar ul{
    list-style:none;
}

.sidebar ul li{
    margin:12px 0;
}

.sidebar ul li a{
    color:#cbd5f5;
    text-decoration:none;
    display:block;
    padding:10px 15px;
    border-radius:6px;
    transition:0.3s;
}

.sidebar ul li a:hover{
    background:#1e293b;
    color:white;
}

/* Content */
.content{
    flex:1;
    padding:30px;
}

.content h2{
    margin-bottom:20px;
    color:#1e293b;
}

/* Grid */
.booking-container{
    display:grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap:20px;
}

/* Card */
.card{
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.card h3{
    margin-bottom:10px;
    color:#0f172a;
}

.card p{
    margin:6px 0;
    color:#475569;
}

/* Empty */
.empty{
    color:#64748b;
    font-size:18px;
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>User Panel</h2>

    <ul>
        <li><a href="<%=request.getContextPath()%>/user/dashboard">Dashboard</a></li>
        <li><a href="<%=request.getContextPath()%>/user/searchProperty">Search Property</a></li>
        <li><a href="<%=request.getContextPath()%>/user/predictPricePage">Predict Price</a></li>
        <li><a href="<%=request.getContextPath()%>/user/myBookings">My Bookings</a></li>
        <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
    </ul>
</div>

<!-- Content -->
<div class="content">

    <h2>My Bookings</h2>

    <c:if test="${empty bookings}">
        <p class="empty">No bookings found</p>
    </c:if>

    <div class="booking-container">
        <c:forEach var="b" items="${bookings}">
            <div class="card">
                <h3>${b.title}</h3>
                <p><strong>City:</strong> ${b.city}</p>
                <p><strong>Price:</strong> ₹${b.price}</p>
                <p><strong>Date:</strong> ${b.date}</p>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>