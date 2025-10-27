<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>View Bookings</title>
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
        justify-content: space-between;
        position: fixed;
        width: 100%;
        top: 0; z-index: 1000;
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
        margin: 0; font-weight: 700;
        font-size: 2.2rem;
        letter-spacing: 1px;
        line-height: 64px;
    }
    header nav {
        display: flex;
        align-items: center;
        gap: 12px;
        height: 64px;
    }
    header nav a {
        color: white; text-decoration: none;
        padding: 9px 22px; border-radius: 4px;
        background-color: #cc3300;
        font-size: 17px; font-weight: bold;
        border: none; display: flex;
        align-items: center; height: 38px;
        cursor: pointer; transition: background-color 0.3s ease;
    }
    header nav a:hover {
        background-color: #991f00;
    }
    .container {
        padding: 100px 30px 30px 30px; max-width: 1000px; margin: 0 auto;
    }
    table {
        width: 100%; border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ccc; padding: 12px; text-align: left;
    }
    th { background-color: #cc3300; color: white; }
</style>
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
<div class="container">
    <h2>All Bookings</h2>
    <table>
        <tr>
            <th>Booking ID</th>
            <th>Username</th>
            <th>Turf Name</th>
            <th>Date</th>
            <th>Time Slot</th>
            <th>Status</th>
        </tr>
        <%
            try (Connection con = com.booking.util.DBConnection.getConnection();
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT b.booking_id, u.username, t.turf_name, b.booking_date, b.time_slot, b.status FROM bookings b JOIN users u ON b.user_id = u.user_id JOIN turfs t ON b.turf_id = t.turf_id ORDER BY b.booking_date DESC")) {

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("booking_id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("turf_name") %></td>
            <td><%= rs.getDate("booking_date") %></td>
            <td><%= rs.getString("time_slot") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("Error fetching booking data.");
            }
        %>
    </table>
</div>
</body>
</html>
