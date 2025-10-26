package com.booking.servlet;

import com.booking.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("user") : null;

        if (username == null) { // Not logged in
            response.sendRedirect("userLogin.jsp");
            return;
        }

        String turfIdStr = request.getParameter("turfId");
        String bookingDate = request.getParameter("bookingDate");
        String timeSlot = request.getParameter("timeSlot");

        try (Connection con = DBConnection.getConnection()) {

            // Get user id from username
            int userId = -1;
            PreparedStatement psUser = con.prepareStatement("SELECT user_id FROM users WHERE username = ?");
            psUser.setString(1, username);
            ResultSet rsUser = psUser.executeQuery();
            if (rsUser.next()) {
                userId = rsUser.getInt("user_id");
            } else {
                response.getWriter().println("User not found.");
                return;
            }

            // Check if slot is already booked
            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT * FROM bookings WHERE turf_id = ? AND booking_date = ? AND time_slot = ? AND status = 'Booked'");
            psCheck.setInt(1, Integer.parseInt(turfIdStr));
            psCheck.setDate(2, java.sql.Date.valueOf(bookingDate));
            psCheck.setString(3, timeSlot);
            ResultSet rsCheck = psCheck.executeQuery();
            if (rsCheck.next()) {
                response.getWriter().println("Slot already booked! <a href='turfs.jsp'>Go back</a>");
                return;
            }

            // Insert booking
            PreparedStatement psInsert = con.prepareStatement(
                    "INSERT INTO bookings(user_id, turf_id, booking_date, time_slot, status) VALUES (?, ?, ?, ?, 'Booked')");
            psInsert.setInt(1, userId);
            psInsert.setInt(2, Integer.parseInt(turfIdStr));
            psInsert.setDate(3, java.sql.Date.valueOf(bookingDate));
            psInsert.setString(4, timeSlot);
            psInsert.executeUpdate();

            response.sendRedirect("bookingConfirmation.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error processing booking.");
        }
    }
}
