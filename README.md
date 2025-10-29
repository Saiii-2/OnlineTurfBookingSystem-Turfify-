Turfify – Online Turf Booking System
Turfify is a web-based platform for booking sports turfs online. It allows users to browse available turfs, check time slots, make bookings, and receive confirmations. Admins can manage turf listings, booking records, user accounts, and monitor transactions. The project uses Java, JSP, HTML, CSS, MySQL, and runs on Apache Tomcat.

Features
User registration/login

Browse all available turfs (cricket, football, volleyball, badminton, basketball)

Turf image gallery and descriptions

Book turf for specific date and time slots

Online payment tracking

View booking history

Admin login for turf management and booking reports

Sports-ground themed landing page

Technology Stack
Java (Backend/Business Logic)

JSP & Servlets (Frontend/Controllers)

HTML, CSS (Frontend/UI)

MySQL (Database)

Apache Tomcat (Web Server)

Maven (Build Tool)

Prerequisites;-
JDK 17 or newer
Apache Tomcat 9+
MySQL Server 8+
Maven
Git

How to Set Up
Clone the Repository

git clone https://github.com/Saiii-2/OnlineTurfBookingSystem-Turfify-.git
Database Setup

Create a MySQL database named onlineturfbookingdb(DatabaseCodes.sql).

Import the provided SQL schema and data (if available) from DatabaseCodes.sql and DatabaseCodes.sql.

Update database credentials in src/main/resources/db.properties or in your Java config files.

Build the Project

text
mvn clean install
Deploy to Tomcat

Copy the generated .war file from /target to Tomcat's /webapps directory.

Start the Tomcat server.

Access the app at http://localhost:8080/Turfify

Running Locally
Start MySQL, ensure the turfify database and tables are present.

Run Tomcat server and deploy the .war file.

Open the application in your browser.

Default Demo Credentials
User: demo_user / password

Admin: admin_user / adminpassword

Usage
Browse turfs via homepage image banner.

Click on turf cards for details and available slots.

Select date/time, enter booking info, proceed to payment (simulated/track reference).

Registered users can view and manage their bookings.

Admins can view all turfs, bookings, users, and generate management reports.

Contributing
Feel free to open issues or submit pull requests for enhancing UI/UX, adding features, fixing bugs, or updating documentation.
