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
    .hero-banner {
        width: 100%;
        max-height: 210px;
        overflow: hidden;
        margin-top: 64px;
        box-shadow: 0 6px 8px rgba(0,0,0,0.09);
        border-radius: 0 0 24px 24px;
        position: relative;
        background: #007acc;
    }
    .hero-banner img {
        width: 100%;
        min-height: 140px;
        object-fit: cover;
        opacity: 0.88;
        filter: saturate(1.1) contrast(1.14);
    }
    .container {
        padding: 38px 30px 30px 30px;
        max-width: 600px;
        margin: -70px auto 0 auto;
        position: relative;
        z-index: 1;
    }
    .booking-card {
        background: white;
        padding: 40px 30px 32px 30px;
        border-radius: 16px;
        box-shadow: 0 2px 16px rgba(0,132,233,0.13);
        margin-top: 0;
        margin-bottom: 20px;
    }
    .booking-card h2 {
        margin-top: 0; 
        margin-bottom: 24px;
        font-size: 1.7rem;
        color: #007acc;
        letter-spacing: .5px;
    }
    form label {
        text-align: left;
        display: block;
        font-weight: 600;
        color: #00365c;
    }
    input, select {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 16px;
    }
    input[readonly] {
        background: #f5faff;
        color: #00365c;
    }
    input[type="submit"] {
        background-color: #007acc;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 17px;
        border-radius: 7px;
        font-weight: 500;
        margin-top: 10px;
        box-shadow: 0 1px 6px rgba(0,110,230,0.10);
        transition: background 0.2s;
    }
    input[type="submit"]:hover {
        background-color: #005fa3;
    }
    .payment-option {
        display: flex;
        align-items: center;
        margin-bottom: 8px;
    }
    .payment-option input[type="radio"] {
        width: 18px;
        height: 18px;
        margin-right: 12px;
        accent-color: #007acc;
    }
    #qrCodeSection {
        display: none;
        background: #f5faff;
        padding: 15px;
        border-radius: 7px;
        margin: 16px 0 12px 0;
        border: 1px solid #cbe3fc;
        text-align: center;
    }
    #qrCodeSection img {
        margin: 8px 0 10px 0;
        border-radius: 7px;
        max-width: 160px;
        border: 1px solid #c5e3fc;
        background: #fff;
    }
    @media (max-width: 640px) {
        .header-container { padding: 0 8px; }
        header h1 { font-size: 15px; }
        header nav a { font-size: 13px; padding: 5px 10px; }
        .container { padding: 7px 4px 20px 4px;}
        .hero-banner { max-height:110px;}
        .booking-card { padding:18px 7px 15px 7px;}
        #qrCodeSection img { max-width: 110px; }
    }
</style>
<script>
function showQRSection() {
    document.getElementById('qrCodeSection').style.display = 'block';
    document.getElementById('transactionId').required = true;
}
function hideQRSection() {
    document.getElementById('qrCodeSection').style.display = 'none';
    document.getElementById('transactionId').required = false;
    document.getElementById('transactionId').value = '';
}
</script>
</head>
<body>
<header>
    <div class="header-container">
        <h1>Turfify</h1>
        <nav>
            <a href="turfs.jsp">Back to Turfs</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
</header>
<div class="hero-banner">
    <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b" alt="Turf Field Banner"/>
</div>
<div class="container">
    <div class="booking-card">
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
            <!-- Payment Method Section -->
            <label>Payment Method:</label>
            <div class="payment-option">
                <input type="radio" id="cash" name="paymentMethod" value="cash" required onclick="hideQRSection()">
                <label for="cash" style="font-weight: normal;">Cash</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="qrcode" name="paymentMethod" value="qrcode" required onclick="showQRSection()">
                <label for="qrcode" style="font-weight: normal;">QR Code</label>
            </div>
            <div id="qrCodeSection">
                <div>Scan the QR Code and pay:</div>
                <img src="indianbankqr.jpg" alt="Indian Bank QR Code">
                <div>Transaction ID: <span style="color:#d00;">*</span></div>
                <input type="text" id="transactionId" name="transactionId" placeholder="Enter Transaction ID">
            </div>
            <input type="submit" value="Confirm Booking"/>
        </form>
    </div>
</div>
</body>
</html>
