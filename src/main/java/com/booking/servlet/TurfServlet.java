package com.booking.servlet;

import com.booking.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/TurfServlet")
public class TurfServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM turfs")) {

            request.setAttribute("turfs", rs);
            request.getRequestDispatcher("turfs.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving turfs");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            String turfIdStr = request.getParameter("turfId");
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement("DELETE FROM turfs WHERE turf_id = ?")) {
                ps.setInt(1, Integer.parseInt(turfIdStr));
                ps.executeUpdate();
                response.sendRedirect("manageTurfs.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error deleting turf");
            }
            return; // Exit after delete operation
        }

        // Insert/Add new turf
        String turfName = request.getParameter("turfName");
        String location = request.getParameter("location");
        String turfType = request.getParameter("turfType");
        String priceStr = request.getParameter("price");

        if (turfName == null || location == null || turfType == null || priceStr == null) {
            response.getWriter().println("Missing input parameters.");
            return;
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "INSERT INTO turfs (turf_name, location, turf_type, price_per_hour) VALUES (?, ?, ?, ?)")) {

            ps.setString(1, turfName);
            ps.setString(2, location);
            ps.setString(3, turfType);
            ps.setDouble(4, Double.parseDouble(priceStr));
            ps.executeUpdate();

            response.sendRedirect("manageTurfs.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error adding turf");
        }
    }
}
