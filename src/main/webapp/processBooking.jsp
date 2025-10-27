<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String turfId = request.getParameter("turfId");
    String bookingDate = request.getParameter("bookingDate");
    String timeSlot = request.getParameter("timeSlot");
    String paymentMethod = request.getParameter("paymentMethod");
    String transactionId = request.getParameter("transactionId");
    
    // Get user ID from session
    String userId = (String) session.getAttribute("userId");
    
    if(userId == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/turfify", "root", "password");
        
        // Insert booking
        String sql = "INSERT INTO bookings (user_id, turf_id, booking_date, time_slot, payment_method, transaction_id, status, created_at) VALUES (?, ?, ?, ?, ?, ?, 'pending', NOW())";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userId);
        ps.setString(2, turfId);
        ps.setString(3, bookingDate);
        ps.setString(4, timeSlot);
        ps.setString(5, paymentMethod);
        
        if(paymentMethod.equals("qrcode")) {
            ps.setString(6, transactionId);
        } else {
            ps.setNull(6, Types.VARCHAR);
        }
        
        int result = ps.executeUpdate();
        
        ps.close();
        conn.close();
        
        if(result > 0) {
            response.sendRedirect("bookingSuccess.jsp");
        } else {
            response.sendRedirect("bookingFailed.jsp");
        }
        
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
%>
