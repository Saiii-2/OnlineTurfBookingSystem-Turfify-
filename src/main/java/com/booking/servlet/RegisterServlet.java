package com.booking.servlet;

import com.booking.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            // Check for duplicate username
            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            psCheck.setString(1, uname);
            ResultSet rs = psCheck.executeQuery();
            if (rs.next()) {
            	request.setAttribute("errorMsg", "Username already exists!");
            	request.getRequestDispatcher("registrationError.jsp").forward(request, response);

                return;
            }

            // Correct order of columns (username, password, email, phone)
            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO users(username, password, email, phone) VALUES (?, ?, ?, ?)"
            );
            psInsert.setString(1, uname);
            psInsert.setString(2, password);
            psInsert.setString(3, email);
            psInsert.setString(4, phone);
            psInsert.executeUpdate();

            request.setAttribute("username", uname); // Or any data you want to show
            request.getRequestDispatcher("registrationSuccess.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); // For debugging in your Tomcat log/console
            response.getWriter().println("Error during registration: " + e.getMessage());
        }
    }
}
