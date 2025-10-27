<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>User Dashboard</title>
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
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    header nav a:hover {
        background-color: #0052a3;
    }
    .container {
        padding: 100px 30px 30px 30px;
        max-width: 1200px;
        margin: 0 auto;
    }
    h2, h3 {
        margin-top: 0;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
        vertical-align: middle;
    }
    th {
        background-color: #004080;
        color: white;
    }
    form {
        margin: 0;
    }
    input[type="submit"] {
        background-color: #007acc;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
    }
    input[type="submit"]:hover {
        background-color: #005fa3;
    }
    a.view-turfs-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 30px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-size: 16px;
    }
    a.view-turfs-btn:hover {
        background-color: #005fa3;
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Turfify</h1>
        <nav>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Welcome, <%= session.getAttribute("user") %>!</h2>
    <p>Browse available turfs and make your bookings.</p>
    <a class="view-turfs-btn" href="TurfServlet">View Turfs</a>

    <h3>Your Bookings</h3>
    <table>
        <tr>
            <th>Booking ID</th>
            <th>Turf Name</th>
            <th>Date</th>
            <th>Time Slot</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            String username = (String) session.getAttribute("user");
            if (username != null) {
                try (Connection con = com.booking.util.DBConnection.getConnection();
                     PreparedStatement ps = con.prepareStatement(
                        "SELECT b.booking_id, t.turf_name, b.booking_date, b.time_slot, b.status " +
                        "FROM bookings b " +
                        "JOIN users u ON b.user_id = u.user_id " +
                        "JOIN turfs t ON b.turf_id = t.turf_id " +
                        "WHERE u.username = ? ORDER BY b.booking_date DESC")) {
                    ps.setString(1, username);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("booking_id") %></td>
            <td><%= rs.getString("turf_name") %></td>
            <td><%= rs.getDate("booking_date") %></td>
            <td><%= rs.getString("time_slot") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <%
                    String status = rs.getString("status");
                    if ("Booked".equalsIgnoreCase(status)) {
                %>
                <form method="post" action="BookingCancelServlet" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
                    <input type="hidden" name="bookingId" value="<%= rs.getInt("booking_id") %>"/>
                    <input type="submit" value="Cancel"/>
                </form>
                <%
                    } else {
                        out.print("-");
                    }
                %>
            </td>
        </tr>
        <%
                    }
                } catch (Exception e) {
                    out.println("Error loading bookings.");
                }
            }
        %>
    </table>
</div>
</body>
</html>
