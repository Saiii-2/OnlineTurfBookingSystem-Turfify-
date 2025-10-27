package com.booking.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import com.booking.util.DBConnection;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String username = request.getParameter("username");
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE username=?")) {
            ps.setString(1, username);
            ps.executeUpdate();
        } catch(Exception e) {
            // Log or handle error (optional)
        }
        response.sendRedirect("adminDashboard.jsp"); // Or user management JSP
    }
}
