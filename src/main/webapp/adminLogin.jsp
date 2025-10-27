<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin Login</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        margin: 0; padding: 0; color: #333;
        /* Turf field background image for immersion */
        background: url('https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=1500&q=80') no-repeat center center fixed;
        background-size: cover;
        position: relative;
    }
    .overlay {
        position: fixed; top: 0; left: 0; right: 0; bottom: 0;
        background: rgba(145,40,0,0.15);
        z-index: 0;
        width: 100vw; height: 100vh;
        pointer-events: none;
    }
    header {
        background: rgba(204,51,0,0.98);
        color: white;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: fixed;
        width: 100%;
        top: 0; z-index: 10;
        box-shadow: 0 4px 6px rgba(0,0,0,0.13);
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
        font-size: 2.2rem;
        font-weight: 700;
        margin: 0; line-height: 64px;
        letter-spacing: 1px; white-space: nowrap;
    }
    header nav a {
        color: white;
        text-decoration: none;
        padding: 9px 22px;
        border-radius: 4px;
        background-color: #cc3300;
        font-size: 17px; font-weight: bold;
        height: 38px; margin-left: 20px;
        display: flex; align-items: center;
        transition: background 0.3s;
    }
    header nav a:hover {
        background-color: #991f00;
    }
    .center-content {
        width: 100vw; min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: relative;
        z-index: 2;
    }
    .login-card {
        background: rgba(255,255,255,0.88);
        box-shadow: 0 8px 32px rgba(204,51,0,0.11);
        backdrop-filter: blur(10px);
        border-radius: 18px;
        max-width: 370px; width: 96vw;
        padding: 38px 32px 30px 32px;
        margin-top: 92px;
        display: flex; flex-direction: column; align-items: stretch;
        z-index: 2;
        border: 1.8px solid rgba(204,51,0,0.11);
    }
    h2 {
        text-align: center; margin-bottom: 20px;
        font-size: 1.55rem; font-weight: 700; color: #7b0e11;
    }
    form {
        display: flex; flex-direction: column;
    }
    label {
        margin: 8px 0 4px 0; font-weight: 600;
    }
    input[type="text"], input[type="password"] {
        padding: 11px;
        border: 1px solid #bbb;
        border-radius: 6px;
        margin-bottom: 17px;
        font-size: 16px;
        background: rgba(255,255,255,0.94);
    }
    input[type="submit"] {
        background-color: #cc3300;
        color: #fff;
        padding: 14px;
        border: none;
        border-radius: 7px;
        font-size: 17px; font-weight: 600; cursor: pointer;
        box-shadow: 0 2px 8px rgba(204,51,0,0.10);
        margin-top: 8px;
        transition: background 0.3s;
    }
    input[type="submit"]:hover {
        background-color: #991f00;
    }
    @media (max-width:600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 17px; }
        .login-card {padding: 20px 7px 15px 7px;}
    }
</style>
</head>
<body>
<div class="overlay"></div>
<header>
    <div class="header-container">
        <h1>Turfify - Admin</h1>
        <nav>
            <a href="loginSelection.jsp">Login</a>
        </nav>
    </div>
</header>
<div class="center-content">
    <div class="login-card">
        <h2>Admin Login</h2>
        <form action="AdminServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required/>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required/>
            <input type="submit" value="Login"/>
        </form>
    </div>
</div>
</body>
</html>
