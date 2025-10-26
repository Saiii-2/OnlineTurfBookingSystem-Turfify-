<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Select Login Type</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e6f2ff;
        margin: 0; padding: 0;
        color: #333;
    }
    header {
        background-color: #004080;
        color: white;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
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
        font-size: 2rem;
        line-height: 64px;
        letter-spacing: 1px;
    }
    header nav {
        display: flex;
        align-items: center;
        height: 64px;
    }
    header nav a {
        color: white;
        text-decoration: none;
        padding: 9px 22px;
        border-radius: 4px;
        background-color: #0066cc;
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
        background-color: #0052a3;
    }
    .container {
        padding: 100px 30px 30px 30px;
        max-width: 600px;
        margin: 0 auto;
        text-align: center;
    }
    a.login-button {
        display: inline-block;
        margin: 20px;
        padding: 15px 40px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        font-size: 18px;
        font-weight: 600;
        border-radius: 10px;
        transition: background-color 0.3s ease;
    }
    a.login-button.admin {
        background-color: #cc3300;
    }
    a.login-button:hover {
        opacity: 0.9;
    }
    @media (max-width: 600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 17px; }
        header nav a { font-size: 12px; padding: 6px 10px; }
        .container { padding: 90px 8px 24px 8px;}
        a.login-button { font-size: 14px; padding: 9px 20px; margin: 16px 10px;}
    }
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
<div class="container">
    <h2>Select Login Type</h2>
    <a href="userLogin.jsp" class="login-button">User Login</a>
    <a href="adminLogin.jsp" class="login-button admin">Admin Login</a>
</div>
</body>
</html>
