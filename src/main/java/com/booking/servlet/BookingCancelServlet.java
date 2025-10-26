package com.booking.servlet;

import com.booking.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BookingCancelServlet")
public class BookingCancelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("user") : null;

        if (username == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        String bookingIdStr = request.getParameter("bookingId");
        if (bookingIdStr == null) {
            response.getWriter().println("Booking ID is missing.");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            // Verify booking belongs to logged in user
            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT b.booking_id FROM bookings b " +
                    "JOIN users u ON b.user_id = u.user_id " +
                    "WHERE b.booking_id = ? AND u.username = ? AND b.status = 'Booked'");
            psCheck.setInt(1, Integer.parseInt(bookingIdStr));
            psCheck.setString(2, username);
            ResultSet rs = psCheck.executeQuery();

            if (!rs.next()) {
                response.getWriter().println("Invalid booking or already cancelled.");
                return;
            }

            // Update booking status to Cancelled
            PreparedStatement psUpdate = con.prepareStatement("UPDATE bookings SET status='Cancelled' WHERE booking_id = ?");
            psUpdate.setInt(1, Integer.parseInt(bookingIdStr));
            psUpdate.executeUpdate();

            response.sendRedirect("userDashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error cancelling booking.");
        }
    }
}
