<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.booking.util.DBConnection"%>
<html>
<head>
<title>Book Turf</title>
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
        gap: 12px;
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
    }
    form {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    }
    input, select {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #007acc;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        border-radius: 6px;
    }
    input[type="submit"]:hover {
        background-color: #005fa3;
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking</h1>
        <nav>
            <a href="turfs.jsp">Back to Turfs</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Book Turf</h2>
    <%
        String turfId = request.getParameter("turfId");
        String turfName = "";
        if (turfId != null) {
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement("SELECT turf_name FROM turfs WHERE turf_id = ?")) {
                ps.setInt(1, Integer.parseInt(turfId));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    turfName = rs.getString("turf_name");
                }
            } catch (SQLException e) {
                out.println("Error fetching turf details");
            }
        }
    %>
    <form action="BookingServlet" method="post">
        <label>Turf:</label>
        <input type="text" name="turfName" value="<%= turfName %>" readonly/>
        <input type="hidden" name="turfId" value="<%= turfId %>"/>
        <label for="bookingDate">Booking Date:</label>
        <input type="date" id="bookingDate" name="bookingDate" required min="<%= java.time.LocalDate.now() %>"/>
        <label for="timeSlot">Time Slot:</label>
        <select id="timeSlot" name="timeSlot" required>
            <option value="06:00-07:00">06:00-07:00</option>
            <option value="07:00-08:00">07:00-08:00</option>
            <option value="08:00-09:00">08:00-09:00</option>
            <option value="09:00-10:00">09:00-10:00</option>
            <option value="10:00-11:00">10:00-11:00</option>
        </select>
        <input type="submit" value="Confirm Booking"/>
    </form>
</div>
</body>
</html>
