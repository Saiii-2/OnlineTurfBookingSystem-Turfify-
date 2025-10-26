<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin Login</title>
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
        font-size: 2rem;
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
        max-width: 400px;
        margin: 0 auto;
    }
    form {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #cc3300;
        color: white;
        border: none;
        padding: 12px;
        width: 100%;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #991f00;
    }
    @media (max-width: 600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 15px; }
        header nav a { font-size: 13px; padding: 5px 10px; }
        .container { padding: 95px 8px 24px 8px;}
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking - Admin</h1>
        <nav>
            <a href="loginSelection.jsp">Login</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Admin Login</h2>
    <form action="AdminServlet" method="post">
        <label for="username">Username:</label><br/>
        <input type="text" id="username" name="username" required/><br/>
        <label for="password">Password:</label><br/>
        <input type="password" id="password" name="password" required/><br/>
        <input type="submit" value="Login"/>
    </form>
</div>
</body>
</html>
