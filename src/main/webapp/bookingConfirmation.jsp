<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Booking Confirmed</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e6f2ff;
        margin: 0; padding: 0;
        color: #333;
        text-align: center;
    }
    header {
        background-color: #004080;
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
        background-color: #007acc;
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
        background-color: #005fa3;
    }
    .container {
        padding: 104px 20px 20px 20px;
        max-width: 500px;
        margin: 0 auto;
        position: relative;
    }
    .confirmation-img {
        margin-bottom: 24px;
        width: 100px;
        height: 100px;
        object-fit: contain;
        border-radius: 50%;
        background: #fff;
        box-shadow: 0 3px 14px rgba(0,188,212,0.18);
    }
    .celebrate-msg {
        font-size: 2rem;
        font-weight: bold;
        color: #007acc;
        margin-bottom: 12px;
    }
    a.button {
        display: inline-block;
        padding: 15px 40px;
        margin-top: 24px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-size: 18px;
        margin-right: 16px;
        font-weight: 500;
        box-shadow: 0 2px 12px rgba(0,123,187,0.06);
        transition: background 0.2s, box-shadow 0.2s;
    }
    a.button:hover {
        background-color: #005fa3;
        box-shadow: 0 4px 20px rgba(0,123,187,0.18);
    }
    @media (max-width: 600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 17px; }
        header nav a { font-size: 13px; padding: 5px 10px; }
        .container { padding: 90px 8px 24px 8px; }
        a.button { font-size: 14px; padding: 9px 14px;}
        .confirmation-img { width: 70px; height: 70px;}
        .celebrate-msg { font-size: 1.5rem;}
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Turfify</h1>
        <nav>
            <% if (session.getAttribute("user") != null) { %>
                <a href="userDashboard.jsp">Dashboard</a>
                <a href="logout.jsp">Logout</a>
            <% } else { %>
                <a href="loginSelection.jsp">Login</a>
            <% } %>
        </nav>
    </div>
</header>
<div class="container">
    <img src="https://cdn-icons-png.flaticon.com/512/845/845646.png" alt="Confirmed" class="confirmation-img"/>
    <div class="celebrate-msg">Booking Confirmed!</div>
    <p>Your turf booking was successful.<br>Get ready to play and have fun!</p>
    <a class="button" href="turfs.jsp">Book More Turfs</a>
    <a class="button" href="userDashboard.jsp">Go to Dashboard</a>
</div>
</body>
</html>
