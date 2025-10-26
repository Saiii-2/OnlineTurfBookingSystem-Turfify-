<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Registration Successful</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e6f2ff;
        margin: 0; padding: 0; color: #333; text-align: center;
    }
    header {
        background-color: #004080; color: white;
        padding: 0; display: flex; align-items: center;
        position: fixed; width: 100%; top: 0; z-index: 1000;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1); height: 64px;
    }
    .header-container { display: flex; width: 100%; align-items: center;
        justify-content: space-between; padding: 0 32px; }
    header h1 {
        font-size: 2.2rem; font-weight: 700; margin: 0; line-height: 64px;
        letter-spacing: 1px; white-space: nowrap;
    }
    .container { padding: 100px 20px 20px 20px;}
    .success-message {
        font-size: 1.5rem; margin-bottom: 32px; color: #006600; font-weight: 600;
    }
    a.button {
        display: inline-block; padding: 15px 40px; margin-top: 18px;
        background-color: #007acc; color: white; text-decoration: none;
        border-radius: 8px; font-size: 18px; margin-right: 16px;
    }
    a.button:hover { background-color: #005fa3; }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking</h1>
        <nav>
            <a href="userLogin.jsp" class="button">Login</a>
            <a href="index.jsp" class="button" style="background:#0066cc;">Home</a>
        </nav>
    </div>
</header>
<div class="container">
    <div class="success-message">
        Registration successful!<br>
        Welcome, <%= request.getAttribute("username") != null ? request.getAttribute("username") : "User" %>.<br>
        You can now login to your account.
    </div>
    <a class="button" href="userLogin.jsp">Go to Login</a>
</div>
</body>
</html>
