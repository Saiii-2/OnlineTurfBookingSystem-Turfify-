package com.booking.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/OnlineTurfBookingDB?useSSL=false&serverTimezone=UTC"; // or use your own DB name
        String user = "root"; // your MySQL username
        String password = "root"; // your password

        try {
            // Try to load the driver explicitly (sometimes needed in legacy setups)
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            System.out.println("Database connected successfully!");
            con.close();
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found! " + e);
        } catch (SQLException e) {
            System.out.println("Failed to connect: " + e.getMessage());
        }
    }
}
