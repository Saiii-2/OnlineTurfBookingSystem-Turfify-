<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Turfify</title>
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
        width: 100%;
        padding-top: 88px;
        padding-bottom: 30px;
        text-align: center;
    }
    .main-banner h1 {
        font-size: 2.5rem; font-weight: bold; color: #006434;
        margin-bottom: 8px;
    }
    .main-banner .lead {
        font-size: 23px; font-weight: 700; margin-bottom:35px; color: #00391d;
    }
    .sports-section {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 38px;
        margin-bottom: 50px;
        width: 100%;
    }
    .sport-row {
        display: flex;
        align-items: flex-start;
        gap: 38px;
        margin: 0 auto;
        max-width: 950px;
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 18px #00703f26;
        padding: 28px 44px 18px 44px;
    }
    .sport-image {
        min-width: 300px;
        max-width: 350px;
        width: 37vw;
        height: 190px;
        border-radius: 18px;
        object-fit: cover;
        box-shadow: 0 4px 22px #00995b0c;
        margin-bottom: 0;
    }
    .sport-desc-block {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        padding-top: 0;
    }
    .sport-title {
        font-size: 1.6rem;
        font-weight: 800;
        color: #047f35;
        margin: 0 0 8px 0;
    }
    .sport-desc {
        font-size: 1.12rem;
        color: #333950;
        margin-bottom: 0;
        font-weight: 500;
    }
    /* Responsive */
    @media (max-width: 990px) {
        .sport-row { flex-direction: column; align-items:center; gap:10px; padding:18px 2vw;}
        .sport-image {width: 97vw; min-width:170px; height:29vw; max-width:400px;}
        .sport-desc-block {align-items: center; text-align:center;}
    }
    /* Contact/Footer Section */
    footer {
        background: #003060; padding: 35px 8vw 16px 8vw; color: #fff; margin-top: 40px;
    }
    .footer-container {
        display: flex; flex-wrap: wrap; justify-content: space-between; align-items: flex-start; gap: 2rem;
    }
    .footer-about, .footer-contact, .footer-img {
        flex: 1 1 180px; margin-bottom: 30px;
    }
    .footer-about h3, .footer-contact h3 {margin-bottom: 12px;}
    .footer-img img {width: 100%; max-width: 188px; border-radius: 10px;}
    @media (max-width: 850px) {
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
        <h1>Turfify</h1>
        <nav>
            <a href="loginSelection.jsp">Login</a>
        </nav>
    </div>
</header>

<div class="main-banner">
    <h1>Book the best sports turfs near you easily.</h1>
    <div class="lead">
      Find the perfect turf for Cricket, Football, Volleyball, Badminton, and Basketball—all in one place!
    </div>
    <div class="sports-section">
        <!-- Cricket (players in action) -->
        <div class="sport-row">
            <img class="sport-image" src="https://boxcricketnearme.com/wp-content/uploads/2025/05/converted_image-2025-05-07T222914.648.webp" alt="Cricket Turf Players">
            <div class="sport-desc-block">
                <div class="sport-title">Cricket Turf</div>
                <div class="sport-desc">
                    Reserve world-class cricket pitches for nets or matches, with lush green turf and lighting. Great for practice, tournaments, and leagues.
                </div>
            </div>
        </div>
        <!-- Football (players in action) -->
        <div class="sport-row">
            <img class="sport-image" src="https://images.livemint.com/rf/Image-621x414/LiveMint/Period1/2015/09/12/Photos/turf-kHJF--621x414@LiveMint.jpg" alt="Football Turf Players">
            <div class="sport-desc-block">
                <div class="sport-title">Football Turf</div>
                <div class="sport-desc">
                    Play the beautiful game on premium, artificial football turfs. Perfect for 5s, 7s, or 11-a-side games with friends or club teams. Floodlights and seating available.
                </div>
            </div>
        </div>
        <!-- Volleyball (players in action) -->
        <div class="sport-row">
            <img class="sport-image" src="https://www.greatsportstech.com/wp-content/uploads/2023/03/iaf.jpg" alt="Volleyball Turf Players">
            <div class="sport-desc-block">
                <div class="sport-title">Volleyball Court</div>
                <div class="sport-desc">
                    Enjoy thrilling volleyball games on high-quality indoor and outdoor courts, suitable for both casual and competitive tournaments.
                </div>
            </div>
        </div>
        <!-- Badminton (players in action) -->
        <div class="sport-row">
            <img class="sport-image" src="https://playo.gumlet.io/TURFUPKHARADIBADMINTON20230801075948414670/TurfUpKharadiBadminton1690877129313.jpg?auto=compress,format&h=300" alt="Badminton Turf Players">
            <div class="sport-desc-block">
                <div class="sport-title">Badminton Court</div>
                <div class="sport-desc">
                    Play singles or doubles on cushioned, non-slip badminton courts. Spots for families, regular shuttlers, and professional coaching available.
                </div>
            </div>
        </div>
        <!-- Basketball (players in action) -->
        <div class="sport-row">
            <img class="sport-image" src="https://www.integralgrass.com/wp-content/uploads/2022/09/artificial-turf.jpg" alt="Basketball Turf Players">
            <div class="sport-desc-block">
                <div class="sport-title">Basketball Court</div>
                <div class="sport-desc">
                    Train or compete on well-maintained basketball turfs with robust flooring, clear markings, and quality amenities for all levels.
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-about">
            <h3>About Turfify</h3>
            <p>Your trusted platform for booking sports turfs online across India, connecting you with verified venues and great matches for all sports.</p>
        </div>
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p>Email: <a href="mailto:support@turfify.com">support@turfify.com</a></p>
            <p>Phone: <a href="tel:+919876543210">+91 98765 43210</a></p>
            <p>Address: 123 Sports City Road, Chennai, Tamil Nadu</p>
        </div>
        <div class="footer-img">
            <img src="https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=600&q=80" alt="Sports Turf" />
        </div>
    </div>
    <div style="text-align:center; color:#bbb; padding:10px 0;">
        &copy; 2025 Turfify. All rights reserved.
    </div>
</footer>
</body>
</html>
