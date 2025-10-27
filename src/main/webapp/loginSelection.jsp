<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Select Login Type</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        margin: 0; padding: 0;
        background: url('https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=1500&q=80') no-repeat center center fixed;
        background-size: cover;
        position: relative;
    }
    .overlay {
        position: fixed; top: 0; left: 0; right: 0; bottom: 0;
        background: rgba(18,36,56,0.33);
        z-index: 0;
        width: 100vw; height: 100vh;
        pointer-events: none;
    }
    header {
        background: rgba(0, 64, 128, 0.97);
        color: white;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: fixed;
        width: 100%;
        top: 0; z-index: 10;
        box-shadow: 0 4px 12px rgba(0,0,0,0.13);
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
        margin: 0; font-weight: 700; font-size: 2.2rem;
        letter-spacing: 1px; line-height: 64px; white-space: nowrap;
        text-shadow: 1px 2px 10px #2d639e77;
    }
    header nav a {
        color: white;
        text-decoration: none;
        padding: 9px 22px;
        border-radius: 4px;
        background-color: #1874d2;
        font-size: 17px; font-weight: bold;
        height: 38px; margin-left: 20px;
        display: flex; align-items: center;
        transition: background 0.3s;
    }
    header nav a:hover {
        background: #11508b;
    }
    .center-content {
        width: 100vw; min-height: 100vh;
        display: flex; flex-direction: column;
        justify-content: center; align-items: center;
        position: relative; z-index: 2;
    }
    .login-choice-card {
        background: rgba(255,255,255,0.87);
        box-shadow: 0 10px 40px rgba(0, 64, 128,0.17);
        backdrop-filter: blur(9px);
        border-radius: 22px;
        max-width: 430px; width: 97vw;
        padding: 48px 34px 38px 34px;
        margin-top: 98px;
        display: flex; flex-direction: column; align-items: center;
        border: 2px solid rgba(19, 53, 80, 0.07);
        z-index: 2;
    }
    .login-choice-card h2 {
        font-size: 2.1rem; font-weight: 800; letter-spacing: 1px;
        color: #073556; margin: 0 0 34px 0; text-align: center;
        text-shadow: 1px 2px 12px #3d80bd36;
    }
    .login-buttons {
        display: flex; flex-direction: row; gap: 29px;
        justify-content: center; align-items: center; flex-wrap: wrap;
        margin-bottom: 11px;
    }
    .login-btn {
        display: flex; flex-direction: column; align-items: center;
        justify-content: center;
        padding: 24px 48px 18px 48px;
        border-radius: 12px;
        font-size: 1.19rem; font-weight: bold;
        color: white;
        border: none;
        cursor: pointer;
        box-shadow: 0 4px 30px rgba(0,97,180,0.18);
        transition: transform 0.2s, box-shadow 0.3s;
        margin-bottom: 10px;
        text-decoration: none;
        position: relative;
    }
    .login-btn.user {
        background: linear-gradient(120deg, #1fa5ff 12%, #0772e8 85%);
    }
    .login-btn.admin {
        background: linear-gradient(120deg, #d5450a 20%, #940e02 91%);
    }
    .login-btn i {
        font-size: 2.15rem;
        margin-bottom: 6px;
        opacity: 0.87;
    }
    .login-btn:hover, .login-btn:focus {
        transform: translateY(-6px) scale(1.04);
        box-shadow: 0 8px 36px #0d418457;
        opacity: 0.97;
        text-decoration: none;
    }
    @media (max-width: 700px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 22px; }
        .login-choice-card { padding: 22px 7px 23px 7px; }
        .login-btn { padding: 18px 17px 12px 17px; font-size: 1rem;}
    }
</style>
<!-- For icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="overlay"></div>
<header>
    <div class="header-container">
        <h1>Turfify</h1>
        <nav>
            <a href="loginSelection.jsp">Login</a>
        </nav>
    </div>
</header>
<div class="center-content">
    <div class="login-choice-card">
        <h2>Select Login Type</h2>
        <div class="login-buttons">
            <a href="userLogin.jsp" class="login-btn user">
                <i class="fa fa-user-circle"></i>
                User Login
            </a>
            <a href="adminLogin.jsp" class="login-btn admin">
                <i class="fa fa-shield-halved"></i>
                Admin Login
            </a>
        </div>
    </div>
</div>
</body>
</html>
