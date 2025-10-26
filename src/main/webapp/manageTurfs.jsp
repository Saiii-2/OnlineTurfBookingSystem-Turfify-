<%@ page import="java.sql.*, com.booking.util.DBConnection" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Manage Turfs</title>
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
        padding: 100px 30px 30px 30px;
        max-width: 900px;
        margin: 0 auto;
    }
    form {
        background: white; padding: 20px;
        border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        margin-bottom: 30px;
    }
    input[type="text"], input[type="number"] {
        width: 100%; padding: 10px; margin: 10px 0;
        border: 1px solid #ccc; border-radius: 6px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #cc3300; color: white; border: none;
        padding: 12px 20px; border-radius: 6px;
        cursor: pointer; font-size: 16px;
    }
    input[type="submit"]:hover { background-color: #991f00; }
    table {
        width: 100%; border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ccc; padding: 12px;
        text-align: left;
        vertical-align: middle;
    }
    th { background-color: #cc3300; color: white; }
    form.inline-form { display: inline; margin: 0; padding: 0; }
    button.action-btn {
        padding: 5px 14px;
        background-color: #cc3300;
        color: white;
        border: none;
        font-weight: 600;
        border-radius: 4px;
        font-size: 14px;
        box-shadow: none;
        outline: none;
        display: inline-block;
        cursor: pointer;
        line-height: 1.1;
        min-width: 0;
        min-height: 0;
        margin: 0;
        background-clip: padding-box;
        white-space: nowrap;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    button.action-btn:hover, button.action-btn:focus {
        background-color: #b12400;
    }
</style>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Online Turf Booking - Admin</h1>
        <nav>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="container">
    <h2>Manage Turfs</h2>

    <!-- Add Turf Form -->
    <form method="post" action="TurfServlet">
        <h3>Add New Turf</h3>
        <label>Turf Name:</label>
        <input type="text" name="turfName" required/>
        <label>Location:</label>
        <input type="text" name="location" required/>
        <label>Type:</label>
        <input type="text" name="turfType" required/>
        <label>Price Per Hour:</label>
        <input type="number" name="price" step="0.01" required/>
        <input type="submit" value="Add Turf"/>
    </form>

    <!-- List Existing Turfs -->
    <table>
        <tr>
            <th>Turf Name</th>
            <th>Location</th>
            <th>Type</th>
            <th>Price Per Hour</th>
            <th>Actions</th>
        </tr>
        <%
            try (Connection con = DBConnection.getConnection();
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM turfs")) {

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("turf_name") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("turf_type") %></td>
            <td><%= rs.getDouble("price_per_hour") %></td>
            <td>
                <form class="inline-form" method="post" action="TurfServlet">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="turfId" value="<%= rs.getInt("turf_id") %>"/>
                    <button type="submit" class="action-btn" onclick="return confirm('Delete this turf?')">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Error loading turfs.");
            }
        %>
    </table>
</div>
</body>
</html>
