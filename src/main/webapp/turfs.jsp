<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Available Turfs</title>
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
        font-size: 2.2rem;
        line-height: 64px;
        letter-spacing: 1px;
        white-space: nowrap;
    }
    header nav {
        display: flex;
        align-items: center;
        gap: 20px;
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
        height: 38px;
        display: flex;
        align-items: center;
        transition: background-color 0.3s ease;
    }
    header nav a:hover {
        background-color: #0052a3;
    }
    .container {
        padding: 100px 30px 30px 30px;
        max-width: 900px;
        margin: 0 auto;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
    }
    th {
        background-color: #004080;
        color: white;
    }
    a.book-btn {
        padding: 8px 16px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        border-radius: 6px;
    }
    a.book-btn:hover {
        background-color: #005fa3;
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking</h1>
        <nav>
            <a href="userDashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Available Turfs</h2>
    <table>
        <tr>
            <th>Turf Name</th>
            <th>Location</th>
            <th>Type</th>
            <th>Price Per Hour</th>
            <th>Action</th>
        </tr>
        <%
            ResultSet turfs = (ResultSet) request.getAttribute("turfs");
            if (turfs != null) {
                while (turfs.next()) {
        %>
        <tr>
            <td><%= turfs.getString("turf_name") %></td>
            <td><%= turfs.getString("location") %></td>
            <td><%= turfs.getString("turf_type") %></td>
            <td><%= turfs.getDouble("price_per_hour") %></td>
            <td><a class="book-btn" href="bookTurf.jsp?turfId=<%= turfs.getInt("turf_id") %>">Book Now</a></td>
        </tr>
        <%      }
            } else {
        %>
        <tr>
            <td colspan="5">No turfs available</td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
