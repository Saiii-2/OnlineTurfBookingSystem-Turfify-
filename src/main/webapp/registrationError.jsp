<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Registration Error</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #ffe6e6;
        margin: 0; padding: 0; color: #cc0000; text-align: center;
    }
    header {
        background-color: #cc3300; color: white;
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
    .error-message {
        font-size: 1.3rem; margin-bottom: 32px; color: #cc0000; font-weight: 600;
    }
    a.button {
        display: inline-block; padding: 13px 32px; margin-top: 16px;
        background-color: #cc3300; color: white; text-decoration: none;
        border-radius: 8px; font-size: 17px; margin-right: 8px;
    }
    a.button:hover { background-color: #991f00; }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking</h1>
        <nav>
            <a href="register.jsp" class="button">Try Another Username</a>
            <a href="index.jsp" class="button" style="background:#0066cc;">Home</a>
        </nav>
    </div>
</header>
<div class="container">
    <div class="error-message">
        <%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "Registration failed!" %>
    </div>
    <a class="button" href="register.jsp">Try Again</a>
</div>
</body>
</html>
