-- 1. Create Database
CREATE DATABASE IF NOT EXISTS onlineturfbookingdb;
USE onlineturfbookingdb;

-- 2. Admin Table
CREATE TABLE IF NOT EXISTS admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO admin (username, password) VALUES
('admin', 'admin123');

-- 3. Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

INSERT INTO users (username, password, email, phone) VALUES
('testuser', 'test123', 'testuser@example.com', '9876543210'),
('saiii9999', 'Saiii@9999', 'saiteja.merla789@gmail.com', '7396134013'),
('saiii999', '123456789', 'saiteja.merla2005@gmail.com', '7396134014'),
('saiii', '123456789', 'saiteja.merla789@gmail.com', '7396134013'),
('linga', 'Linga@123', 'linga@gmail.com', '7601041559'),
('Harshith', 'Harshith', 'harshithpydisetty@gmail.com', '7416330604'),
('demo', 'Demo@123', 'demo@gmail.com', '7416330604'),
('demoo', '123456789', 'demoo@gmail.com', '1234567890');

-- 4. Turfs Table
CREATE TABLE IF NOT EXISTS turfs (
    turf_id INT PRIMARY KEY AUTO_INCREMENT,
    turf_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    turf_type VARCHAR(50) NOT NULL,
    price_per_hour DECIMAL(10,2) NOT NULL,
    availability INT DEFAULT 1
);

-- Sample turfs for first N (add more as needed)
INSERT INTO turfs (turf_name, location, turf_type, price_per_hour, availability) VALUES
('Victory Sports Arena', 'Chennai', 'Football', 600.00, 1),
('Green Field', 'Chennai', 'Cricket', 800.00, 1),
('Green Field', 'chennai', 'Football', 550.00, 1),
('Pickle''s Arena', 'Chennai,Tamilnadu', 'Pickle Ball', 400.00, 1),
('Victory Sports Arena', 'Chennai', 'Football', 600.00, 1),
('Green Field', 'Chennai', 'Cricket', 800.00, 1),
('Arena Sports Hub', 'Bangalore', 'Football', 750.00, 1),
('StadiumX Cricket', 'Bangalore', 'Cricket', 920.00, 1),
('Hyderabad Sports Club', 'Hyderabad', 'Football', 500.00, 1),
('Secunderabad Smashers', 'Hyderabad', 'Badminton', 300.00, 1),
('Bombay Turf Zone', 'Mumbai', 'Football', 650.00, 1),
('Oval Maidan', 'Mumbai', 'Cricket', 1200.00, 1),
('Galaxy Turf', 'Pune', 'Football', 500.00, 1),
('SuperServe', 'Pune', 'Badminton', 250.00, 1),
('Goa Beachside Arena', 'Goa', 'Beach Football', 400.00, 1),
('Sunset Sports', 'Goa', 'Volleyball', 280.00, 1),
('Falcons Arena', 'Delhi', 'Basketball', 450.00, 1),
('Turbo Turf', 'Delhi', 'Football', 700.00, 1),
('Eden Gardens', 'Kolkata', 'Cricket', 1500.00, 1),
('Hoop Dreams Court', 'Kolkata', 'Basketball', 320.00, 1),
('Net Masters', 'Bangalore', 'Badminton', 120.00, 1),
('Paradise Playzone', 'Hyderabad', 'Volleyball', 200.00, 1),
('Rush Turf', 'Ahmedabad', 'Football', 350.00, 1),
('Power Center', 'Ahmedabad', 'Basketball', 270.00, 1),
('Rajasthan Runners', 'Jaipur', 'Cricket', 770.00, 1),
('High5 Arena', 'Jaipur', 'Football', 650.00, 1),
('Smash Court', 'Lucknow', 'Badminton', 90.00, 1),
('Blitz Courts', 'Lucknow', 'Volleyball', 200.00, 1),
('Central Turf', 'Nagpur', 'Football', 380.00, 1),
('Skyline Arena', 'Nagpur', 'Basketball', 200.00, 1),
('Evergreen Fields', 'Chandigarh', 'Cricket', 550.00, 1),
('Champion Grounds', 'Chandigarh', 'Football', 600.00, 1),
('Riverside Sports', 'Surat', 'Football', 280.00, 1),
('Unity Arena', 'Surat', 'Basketball', 160.00, 1),
('PlayOn Mansion', 'Bhopal', 'Badminton', 150.00, 1),
('Pushkar Sports Town', 'Ajmer', 'Football', 230.00, 1),
('Desert Dynamos', 'Jodhpur', 'Volleyball', 110.00, 1),
('Vijayawada AllStars', 'Vijayawada', 'Cricket', 450.00, 1),
('Vizag Strikers', 'Visakhapatnam', 'Volleyball', 150.00, 1),
('Green Tree Arena', 'Trivandrum', 'Football', 325.00, 1),
('CourtX', 'Coimbatore', 'Basketball', 140.00, 1),
('Talented Turfs', 'Coimbatore', 'Cricket', 395.00, 1),
('EcoPlay Arena', 'Nagpur', 'Football', 210.00, 1),
('Red Eagles Net', 'Delhi', 'Badminton', 88.00, 1),
('Bombay Beach Smash', 'Mumbai', 'Volleyball', 95.00, 1),
('Central Square', 'Pune', 'Basketball', 150.00, 1),
('Big League Arena', 'Hyderabad', 'Football', 950.00, 1),
('Silver Sports', 'Delhi', 'Volleyball', 112.00, 1),
('Super Saver Court', 'Lucknow', 'Badminton', 70.00, 1),
('Pickle Paradise', 'Bangalore', 'Pickle Ball', 350.00, 1),
('Picklers Dream', 'Chennai', 'Pickle Ball', 320.00, 1);

-- 5. Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    turf_id INT,
    booking_date DATE,
    time_slot VARCHAR(20),
    status VARCHAR(20),
    payment_method VARCHAR(30),
    transaction_id VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (turf_id) REFERENCES turfs(turf_id)
);

INSERT INTO bookings (user_id, turf_id, booking_date, time_slot, status, payment_method, transaction_id) VALUES
(1,2,'2025-10-26','06:00-07:00','Cancelled',NULL,NULL),
(1,3,'2025-10-26','06:00-07:00','Cancelled',NULL,NULL),
(4,1,'2025-10-26','07:00-08:00','Cancelled',NULL,NULL),
(1,4,'2025-10-27','09:00-10:00','Booked',NULL,NULL),
(1,2,'2025-10-28','08:00-09:00','Cancelled',NULL,NULL),
(5,49,'2025-10-27','06:00-07:00','Booked',NULL,NULL),
(1,1,'2025-10-28','06:00-07:00','Cancelled',NULL,NULL),
(6,51,'2025-10-28','10:00-11:00','Cancelled',NULL,NULL),
(7,4,'2025-10-29','08:00-09:00','Cancelled',NULL,NULL),
(1,5,'2025-10-27','09:00-10:00','Booked',NULL,NULL),
(8,2,'2025-10-27','08:00-09:00','Cancelled',NULL,NULL),
(1,5,'2025-10-27','10:00-11:00','Booked',NULL,NULL);