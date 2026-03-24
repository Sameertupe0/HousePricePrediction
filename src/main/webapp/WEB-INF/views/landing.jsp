<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>House Price Prediction</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    /* Reset & Base */
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
    body { background: #f5f7fa; color: #1f2937; line-height: 1.6; }

    /* Navbar */
    nav {
        display: flex; justify-content: space-between; align-items: center;
        padding: 20px 50px; background: #0f172a; color: #fff; position: sticky; top: 0; z-index: 100;
    }
    nav h1 { font-size: 1.8rem; }
    nav a { color: #fff; text-decoration: none; margin-left: 20px; font-weight: 600; transition: 0.3s; }
    nav a:hover { color: #0ea5e9; }

    /* Hero Section */
    .hero {
        display: flex; flex-direction: column; justify-content: center; align-items: center;
        text-align: center; padding: 120px 20px; 
        background: url('https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format&fit=crop&w=1470&q=80') center/cover no-repeat;
        color: white; position: relative;
    }
    .hero::before {
        content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0,0,0,0.5); z-index: 1;
    }
    .hero-content { position: relative; z-index: 2; max-width: 700px; }
    .hero h2 { font-size: 3rem; margin-bottom: 20px; }
    .hero p { font-size: 1.2rem; margin-bottom: 40px; }
    .hero .btn { background: #0ea5e9; color: #fff; padding: 15px 30px; border-radius: 8px; font-weight: 600; text-decoration: none; transition: 0.3s; }
    .hero .btn:hover { background: #0284c7; }

    /* Features Section */
    .features { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; padding: 80px 50px; max-width: 1200px; margin: 0 auto; }
    .card {
        background: #fff; padding: 30px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        transition: transform 0.3s, box-shadow 0.3s; text-align: center;
    }
    .card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.1); }
    .card img { width: 80px; height: 80px; margin-bottom: 20px; }
    .card h3 { font-size: 1.5rem; margin-bottom: 15px; color: #0f172a; }
    .card p { color: #475569; }

    /* Footer */
    footer { text-align: center; padding: 30px; background: #0f172a; color: #fff; margin-top: 50px; }

    /* Responsive */
    @media (max-width: 768px) {
        nav { flex-direction: column; gap: 15px; padding: 15px 20px; }
        .hero h2 { font-size: 2.2rem; }
        .hero p { font-size: 1rem; }
        .features { padding: 50px 20px; }
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav>
    <h1>House Price Prediction</h1>
    <div>
        <a href="login">Login</a>
        <a href="#features">Explore</a>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h2>Discover Your Dream Property</h2>
        <p>Search properties, predict prices, and manage your bookings—all in one place. Start your journey now!</p>
        <a class="btn" href="login">Get Started</a>
    </div>
</section>

<!-- Features Section -->
<section class="features" id="features">
    <div class="card">
        <img src="https://img.icons8.com/color/96/000000/search-property.png" alt="Search Properties">
        <h3>Search Properties</h3>
        <p>Find properties across cities and states with ease. Filter by location, price, and more.</p>
    </div>
    <div class="card">
        <img src="https://img.icons8.com/color/96/000000/money-bag.png" alt="Predict Price">
        <h3>Predict Price</h3>
        <p>Use our intelligent prediction system to estimate property prices accurately.</p>
    </div>
    <div class="card">
        <img src="https://img.icons8.com/color/96/000000/booking.png" alt="Manage Bookings">
        <h3>Manage Bookings</h3>
        <p>Keep track of your bookings, see details, and manage your property interests efficiently.</p>
    </div>
</section>

<!-- Footer -->
<footer>
    &copy; 2026 House Price Prediction | All Rights Reserved
</footer>

</body>
</html>
