<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.booking.util.DBConnection"%>
<html>
<head>
<title>Admin Dashboard</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0; padding: 0;
        color: #333;
        background: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
        background-size: cover;
    }
    body::before {
        content: "";
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        z-index: -1;
        background: rgba(255,230,230,0.70);
        backdrop-filter: blur(2px) brightness(1.06);
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
        box-shadow: 0 4px 6px rgba(0,0,0,0.11);
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
    .hero-banner {
        width: 100%;
        max-height: 320px;
        overflow: hidden;
        margin-top: 64px;
        box-shadow: 0 6px 8px rgba(0,0,0,0.09);
        border-radius: 0 0 24px 24px;
        position: relative;
    }
    .hero-banner img {
        width: 100%;
        min-height: 240px;
        object-fit: cover;
        opacity: 0.88;
        filter: saturate(1.2) contrast(1.25);
    }
    .container {
        padding: 30px 30px 30px 30px;
        max-width: 1200px;
        margin: -40px auto 0 auto;
        position: relative;
        z-index: 1;
        background: rgba(255,255,255,0.80);
        border-radius: 18px;
        box-shadow: 0 3px 24px rgba(0,0,0,0.10);
    }
    .admin-cards {
        display: flex;
        gap: 30px;
        margin-top: 32px;
        flex-wrap: wrap;
    }
    .card {
        background: linear-gradient(120deg, #e0ffd9 50%, #d0e9fe 100%);
        border-radius: 16px;
        box-shadow: 0 3px 10px rgba(33,150,83,0.15);
        padding: 26px 30px 22px 30px;
        width: 270px;
        min-height: 160px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        position: relative;
        transition: transform 0.18s;
    }
    .card:hover {
        transform: translateY(-7px) scale(1.03);
        box-shadow: 0 6px 18px rgba(33,150,83,0.21);
    }
    .card h3 {
        margin: 0 0 10px 0;
        font-size: 1.19rem;
        color: #166734;
        font-weight: 600;
    }
    .card p {
        margin: 0;
        font-size: 1rem;
        color: #17405e;
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
    .toggle-user-btn {
        background: #e93218;
        color: #fff;
        border: none;
        border-radius: 7px;
        padding: 12px 30px;
        font-size: 18px;
        font-weight: 600;
        margin: 34px 0 19px 0;
        cursor: pointer;
        box-shadow: 0 2px 7px rgba(180,40,0,0.08);
        transition: background 0.22s;
    }
    .toggle-user-btn:hover {
        background: #a61608;
    }
    .user-detail-panel {
        display: none;
        margin: 18px 0;
        background: #fffaf7;
        border-radius: 14px;
        box-shadow: 0 2px 18px rgba(255,80,40,0.09);
        padding: 26px 14px 24px 14px;
        width: 95%;
        max-width: 600px;
    }
    .user-detail-table {
        width: 100%;
        border-collapse: collapse;
    }
    .user-detail-table th, .user-detail-table td {
        padding: 14px 8px;
        border-bottom: 1px solid #ffe1d7;
        text-align: left;
        font-size: 16px;
    }
    .user-detail-table th {
        background: #ff926b;
        color: #fff;
        font-weight: 700;
    }
    .user-detail-table tr:last-child td {
        border-bottom: none;
    }
    @media (max-width: 880px) {
        .admin-cards { flex-direction: column; gap: 16px;}
        .card { width: 98%;}
    }
    @media (max-width: 600px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 15px; }
        header nav a { font-size: 13px; padding: 5px 10px; }
        .container { padding: 12px 8px 24px 8px;}
        .btn-link { padding: 8px 18px; font-size: 14px;}
        .admin-cards { flex-direction: column; gap: 10px;}
        .user-detail-panel { max-width: 98vw;}
        .user-detail-table th, .user-detail-table td { font-size:13px; padding:7px 2px;}
    }
</style>
<script>
function toggleUserPanel() {
    var panel = document.getElementById("userPanel");
    if (panel.style.display === "none" || panel.style.display === "") {
        panel.style.display = "block";
    } else {
        panel.style.display = "none";
    }
}
</script>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Turfify - Admin</h1>
        <nav>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="hero-banner">
    <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b" alt="Turf Field Banner">
</div>
<div class="container">
    <h2>Welcome, Admin <%= session.getAttribute("admin") %>!</h2>
    <p>Manage turfs, bookings, and users from here.</p>
    <div class="admin-cards">
        <div class="card">
            <h3>Manage Turfs</h3>
            <p>Easily add, update, or remove turf listings from the platform.</p>
            <a href="manageTurfs.jsp" class="btn-link">Go to Turfs</a>
        </div>
        <div class="card">
            <h3>View Bookings</h3>
            <p>Review all upcoming bookings and customer information in detail.</p>
            <a href="viewBookings.jsp" class="btn-link">View Bookings</a>
        </div>
        <div class="card">
            <h3>User Management</h3>
            <p>Access and manage user accounts and permissions efficiently.</p>
        </div>
    </div>
    <!-- User Management Panel -->
    <h3 style="margin-top:45px;">User Management</h3>
    <button class="toggle-user-btn" onclick="toggleUserPanel()">Show Users</button>

    <div class="user-detail-panel" id="userPanel">
        <table class="user-detail-table">
            <tr>
                <th>Username</th>
                <th>Email</th>
            </tr>
            <%
                // Change SELECT ... gmail FROM users -> SELECT ... email FROM users
                try (Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT username, email FROM users")) {
                    ResultSet rs = ps.executeQuery();
                    boolean any = false;
                    while (rs.next()) {
                        any = true;
                        String username = rs.getString("username");
                        String email = rs.getString("email");
            %>
            <tr>
                <td><%= username %></td>
                <td><%= email %></td>
            </tr>
            <%
                    }
                    if (!any) {
            %>
            <tr>
                <td colspan="2">No users found.</td>
            </tr>
            <%
                    }
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="2">Error fetching users: <%= e.getMessage() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
</body>
</html>
