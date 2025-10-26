<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Online Turf Booking</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e6f2ff;
        margin: 0; padding: 0; color: #333;
    }
    header {
        background-color: #004080; color: white;
        padding: 0; display: flex; align-items: center;
        position: fixed; width: 100%; top: 0; z-index: 1000;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1); height: 64px;
    }
    .header-container {
        display: flex; width: 100%; align-items: center;
        justify-content: space-between; padding: 0 32px;
    }
    header h1 {
        font-size: 2.2rem; font-weight: 700; margin: 0; line-height: 64px;
        letter-spacing: 1px; white-space: nowrap;
    }
    header nav {
        display: flex; align-items: center; height: 64px;
    }
    header nav a {
        color: white; text-decoration: none; padding: 9px 22px;
        border-radius: 4px; background-color: #0066cc; margin-left: 20px;
        font-size: 17px; font-weight: bold; height: 38px; display: flex;
        align-items: center; transition: background-color 0.3s ease;
    }
    header nav a:hover { background-color: #0052a3; }
    .main-banner {
        width: 100%; min-height: 240px; text-align: center; margin-top: 64px;
        background: #e6f2ff;
    }
    .main-banner img {
        width: 96%; max-width: 1150px; max-height: 340px;
        object-fit: cover; border-radius: 14px; box-shadow: 0 6px 24px #0002;
        margin: 2em auto 1em auto; display: block;
    }
    .container {
        padding: 24px 40px 20px 40px;
        max-width: 1100px;
        margin: 0 auto;
        background: #e6f2ff;
        text-align: center;
    }
    .features {
        display: flex;
        flex-wrap: wrap;
        gap: 20px; justify-content: center; margin: 36px 0;
    }
    .feature-card {
        background: #f5faff; border-radius: 12px;
        box-shadow: 0 2px 8px #0001; padding: 28px 18px;
        width: 270px; min-height: 140px;
        display: flex; flex-direction: column; align-items: center;
    }
    .feature-card img {
        width: 58px; height: 58px; margin-bottom: 16px;
    }
    .feature-card h3 { margin: 0 0 9px 0; }
    footer {
        background: #003060; padding: 30px 8vw 10px 8vw; color: #fff; margin-top: 80px;
    }
    .footer-container {
        display: flex; flex-wrap: wrap; justify-content: space-between; align-items: flex-start; gap: 2rem;
    }
    .footer-about, .footer-contact, .footer-img {
        flex: 1 1 180px; margin-bottom: 30px;
    }
    .footer-about h3, .footer-contact h3 {margin-bottom: 12px;}
    .footer-img img {width: 100%; max-width: 188px; border-radius: 10px;}
    @media (max-width: 900px) {
        .features {flex-direction: column;}
        .container {padding: 16px 8px;}
        .main-banner img {width: 99%; max-width: 600px;}
        .footer-container {flex-direction: column; align-items: center;}
        .footer-img img {margin: 0 auto;}
    }
    a { color: #7fd7ff; text-decoration: underline;}
    a:hover { color: #ffa733; }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking</h1>
        <nav>
            <a href="loginSelection.jsp">Login</a>
        </nav>
    </div>
</header>

<!-- Hero Banner Section -->
<div class="main-banner">
    <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1350&q=80"
         alt="Turf Banner" />
</div>

<!-- Welcome & Feature Section -->
<div class="container">
    <h2 style="font-size:2rem; margin-top:10px; margin-bottom:8px;"><b>Welcome to the Online Turf Booking System</b></h2>
    <p style="font-size:19px; max-width:740px; margin:18px auto 0 auto;">
        Book the best sports turfs near you easily.<br>Real-time <b>availability, verified venues, instant confirmation</b> and best rates—all in one place!
    </p>
    <div class="features">
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3534/3534069.png" alt="Booking" />
            <h3>Easy Booking</h3>
            <span>Book football, cricket, badminton turfs & many more across Chennai and India.</span>
        </div>
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/906/906175.png" alt="Instant Confirm" />
            <h3>Instant Confirmation</h3>
            <span>Check live slots and receive instant confirmation for your booking.</span>
        </div>
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/744/744465.png" alt="Support" />
            <h3>24x7 Support</h3>
            <span>Need help? Our support team is here round-the-clock.</span>
        </div>
    </div>
</div>

<!-- Contact/Footer Section -->
<footer>
    <div class="footer-container">
        <div class="footer-about">
            <h3>About Turf Booking</h3>
            <p>India’s #1 site for booking sports turfs online! Find, compare, and book the best venues in your city instantly.</p>
        </div>
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p>Email: <a href="mailto:support@turfbooking.com">support@turfbooking.com</a></p>
            <p>Phone: <a href="tel:+919876543210">+91 98765 43210</a></p>
            <p>Address: 123 Sports City Road, Chennai, Tamil Nadu</p>
        </div>
        <div class="footer-img">
            <img src="https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=600&q=80"
                 alt="Sports Turf" />
        </div>
    </div>
    <div style="text-align:center; color:#bbb; padding:10px 0;">
        &copy; 2025 Online Turf Booking. All rights reserved.
    </div>
</footer>
</body>
</html>
