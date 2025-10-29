# 🏟️ Online Turf Booking System – *Turfify*

## 📘 Project Overview
The **Online Turf Booking System** (Turfify) is a dynamic web application built using **Java (Servlets & JSP)** and **MySQL**, designed to simplify the process of booking sports turfs online.  
It allows users to register, log in, book available turfs, view their bookings, and manage their profiles.  
Admins can manage turfs, view bookings, and monitor overall activity.

---

## 🛠️ Tech Stack

| Layer | Technology Used |
|-------|------------------|
| **Frontend** | HTML, CSS, JSP |
| **Backend** | Java Servlets, JDBC |
| **Database** | MySQL |
| **Server** | Apache Tomcat |
| **IDE** | Eclipse IDE (Enterprise Edition) |
| **Version Control** | Git & GitHub |

---

## 📂 Project Structure

```
OnlineTurfBooking/
│
├── src/main/java/com/booking/
│   ├── servlet/
│   │   ├── AdminServlet.java
│   │   ├── BookingServlet.java
│   │   ├── BookingCancelServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── TurfServlet.java
│   │   ├── UserServlet.java
│   │   └── DeleteUserServlet.java
│   │
│   └── util/
│       ├── DBConnection.java
│       └── DBConnectionTest.java
│
├── src/main/webapp/
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── adminDashboard.jsp
│   ├── adminLogin.jsp
│   ├── bookingConfirmation.jsp
│   ├── bookTurf.jsp
│   ├── loginSelection.jsp
│   ├── logout.jsp
│   ├── manageTurfs.jsp
│   ├── processBooking.jsp
│   ├── register.jsp
│   ├── registrationError.jsp
│   ├── registrationSuccess.jsp
│   ├── turfs.jsp
│   ├── userDashboard.jsp
│   ├── userLogin.jsp
│   └── viewBookings.jsp
│
└── DatabaseCodes.sql
```

---

## ⚙️ Database Configuration

Create a MySQL database named `OnlineTurfBookingDB`.

### SQL Schema Example
```sql
CREATE DATABASE OnlineTurfBookingDB;
USE OnlineTurfBookingDB;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE turfs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    turf_name VARCHAR(100),
    location VARCHAR(100),
    price_per_hour DECIMAL(10,2),
    availability BOOLEAN
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    turf_id INT,
    booking_date DATE,
    time_slot VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (turf_id) REFERENCES turfs(id)
);
```

---

## ⚙️ Configuration Steps

### 1️⃣ Setup in Eclipse
1. Open **Eclipse IDE for Enterprise Java Developers**.  
2. Create a new **Dynamic Web Project** → Name it `OnlineTurfBooking`.  
3. Add **Tomcat Server (v9 or above)**.  
4. Connect **MySQL JDBC Driver** (add `mysql-connector-j.jar` to `lib` folder or classpath).  

### 2️⃣ Configure Database
Update `DBConnection.java` with your credentials:
```java
private static final String URL = "jdbc:mysql://localhost:3306/OnlineTurfBookingDB";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### 3️⃣ Run the Project
- Right-click the project → **Run As → Run on Server**  
- Default URL: `http://localhost:8080/OnlineTurfBooking/`

---

## 🧑‍💻 Features

### 🔹 User Module
- User Registration & Login  
- Browse available turfs  
- Book turfs with date/time slots  
- View and cancel bookings  
- Logout functionality  

### 🔹 Admin Module
- Admin login dashboard  
- Add / Edit / Delete turfs  
- View all user bookings  
- Manage users  

---

## 📸 Screens (Example)
- `index.jsp` – Landing Page  
- `register.jsp` – Registration Page  
- `loginSelection.jsp` – Login type selection (User/Admin)  
- `adminDashboard.jsp` – Admin panel  
- `userDashboard.jsp` – User panel  
- `bookingConfirmation.jsp` – Confirmation message  

---

## 🚀 Future Enhancements
- Payment Gateway Integration  
- Turf Availability Calendar  
- Email Notifications for Booking  
- User Reviews & Ratings  

---

## 👨‍💻 Author
**Merla Purna Saiteja**  
📧 [saiteja.merla789@gmail.com](mailto:saiteja.merla789@gmail.com)  
💻 Sathyabama University – B.E. CSE (2023–2027)
