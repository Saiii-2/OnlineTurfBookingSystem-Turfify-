<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Admin Dashboard</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #ffe6e6;
        margin: 0; padding: 0;
        color: #333;
    }
    header {
        background-color: #cc3300;
        color: white;
        padding: 0;
        display: flex;
        align-items: center;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        height: 64px;
    }
    .header-container {
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: space-between;
        padding: 0 32px;
    }
    header h1 {
        margin: 0;
        font-weight: 700;
        font-size: 2.1rem;
        line-height: 64px;
        letter-spacing: 1px;
    }
    header nav {
        display: flex;
        align-items: center;
        gap: 12px;
        height: 64px;
    }
    header nav a {
        color: white;
        text-decoration: none;
        padding: 9px 22px;
        border-radius: 4px;
        background-color: #cc3300;
        font-size: 17px;
        font-weight: bold;
        border: none;
        display: flex;
        align-items: center;
        height: 38px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    header nav a:hover {
        background-color: #991f00;
    }
    .container {
        padding: 100px 30px 30px 30px;
        max-width: 1200px;
        margin: 0 auto;
    }
    .btn-link {
        padding: 13px 28px;
        background: #cc3300;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-size: 18px;
        margin-bottom: 18px;
        display: inline-block;
        margin-right: 20px;
        font-weight: 500;
    }
    .btn-link:hover {
        background: #991f00;
    }
    @media (max-width: 600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 15px; }
        header nav a { font-size: 13px; padding: 5px 10px; }
        .container { padding: 95px 8px 24px 8px;}
        .btn-link { padding: 8px 18px; font-size: 14px;}
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking - Admin</h1>
        <nav>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Welcome, Admin <%= session.getAttribute("admin") %>!</h2>
    <p>Manage turfs, bookings, and users from here.</p>
    <a href="manageTurfs.jsp" class="btn-link">Manage Turfs</a>
    <a href="viewBookings.jsp" class="btn-link">View Bookings</a>
</div>
</body>
</html>
