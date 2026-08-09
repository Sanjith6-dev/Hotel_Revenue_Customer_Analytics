CREATE DATABASE hotel_revenue_db;

USE hotel_revenue_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    customer_type VARCHAR(30)
);

INSERT INTO customers
(customer_id, customer_name, gender, age, city, customer_type)
VALUES
(1,'Arun Kumar','Male',28,'Chennai','Business'),
(2,'Priya Sharma','Female',32,'Bangalore','Leisure'),
(3,'Rahul Raj','Male',35,'Coimbatore','Business'),
(4,'Sneha Reddy','Female',27,'Hyderabad','Leisure'),
(5,'Vijay Kumar','Male',41,'Chennai','Business'),
(6,'Divya Mohan','Female',30,'Kochi','Leisure'),
(7,'Karthik S','Male',26,'Madurai','Business'),
(8,'Anjali Nair','Female',34,'Kochi','Leisure'),
(9,'Suresh Babu','Male',45,'Bangalore','Business'),
(10,'Meena Devi','Female',29,'Chennai','Leisure'),

(11,'Ravi Shankar','Male',38,'Coimbatore','Business'),
(12,'Lakshmi Priya','Female',31,'Madurai','Leisure'),
(13,'Manoj Kumar','Male',33,'Hyderabad','Business'),
(14,'Keerthana R','Female',25,'Chennai','Leisure'),
(15,'Pradeep S','Male',40,'Bangalore','Business'),
(16,'Aishwarya K','Female',28,'Coimbatore','Leisure'),
(17,'Naveen Raj','Male',36,'Kochi','Business'),
(18,'Pooja Menon','Female',33,'Kochi','Leisure'),
(19,'Surya Prakash','Male',29,'Madurai','Business'),
(20,'Harini M','Female',26,'Chennai','Leisure'),

(21,'Ajay Kumar','Male',37,'Hyderabad','Business'),
(22,'Nandhini S','Female',30,'Bangalore','Leisure'),
(23,'Deepak R','Male',43,'Coimbatore','Business'),
(24,'Swetha V','Female',24,'Madurai','Leisure'),
(25,'Mohan Das','Male',39,'Chennai','Business'),
(26,'Ramya Krishnan','Female',35,'Kochi','Leisure'),
(27,'Gokul M','Male',27,'Bangalore','Business'),
(28,'Janani S','Female',29,'Hyderabad','Leisure'),
(29,'Dinesh Kumar','Male',42,'Chennai','Business'),
(30,'Shalini R','Female',32,'Coimbatore','Leisure'),

(31,'Vasanth K','Male',31,'Madurai','Business'),
(32,'Kavya Nair','Female',27,'Kochi','Leisure'),
(33,'Ramesh B','Male',46,'Bangalore','Business'),
(34,'Monika S','Female',34,'Chennai','Leisure'),
(35,'Sathish Kumar','Male',36,'Hyderabad','Business'),
(36,'Deepa M','Female',28,'Madurai','Leisure'),
(37,'Vignesh R','Male',30,'Coimbatore','Business'),
(38,'Reshma P','Female',31,'Kochi','Leisure'),
(39,'Lokesh S','Male',44,'Chennai','Business'),
(40,'Swathi K','Female',26,'Bangalore','Leisure'),

(41,'Ganesh R','Male',34,'Madurai','Business'),
(42,'Bhavana S','Female',29,'Hyderabad','Leisure'),
(43,'Hari Prasad','Male',39,'Coimbatore','Business'),
(44,'Riya Thomas','Female',33,'Kochi','Leisure'),
(45,'Sanjay M','Male',28,'Chennai','Business'),
(46,'Nisha R','Female',30,'Bangalore','Leisure'),
(47,'Dharun K','Male',35,'Hyderabad','Business'),
(48,'Maya S','Female',27,'Madurai','Leisure'),
(49,'Vimal Kumar','Male',41,'Coimbatore','Business'),
(50,'Roshini P','Female',25,'Chennai','Leisure');

-- ROOM TABLE:
CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(30),
    price_per_night DECIMAL(10,2),
    capacity INT
);

INSERT INTO rooms
(room_id, room_number, room_type, price_per_night, capacity)
VALUES
(1,'101','Standard',2500,2),
(2,'102','Standard',2500,2),
(3,'103','Standard',2500,2),
(4,'104','Standard',2500,2),
(5,'105','Standard',2500,2),

(6,'201','Deluxe',4000,3),
(7,'202','Deluxe',4000,3),
(8,'203','Deluxe',4000,3),
(9,'204','Deluxe',4000,3),
(10,'205','Deluxe',4000,3),

(11,'301','Suite',6500,4),
(12,'302','Suite',6500,4),
(13,'303','Suite',6500,4),
(14,'304','Suite',6500,4),
(15,'305','Suite',6500,4),

(16,'401','Executive',8000,4),
(17,'402','Executive',8000,4),
(18,'403','Executive',8000,4),
(19,'404','Executive',8000,4),
(20,'405','Executive',8000,4);

-- BOOKING TABLE:
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    guests INT,
    booking_channel VARCHAR(30),
    booking_status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (room_id)
        REFERENCES rooms(room_id)
);

INSERT INTO bookings
(booking_id, customer_id, room_id, check_in, check_out,
 guests, booking_channel, booking_status)
VALUES
(1,1,1,'2026-01-05','2026-01-08',2,'Website','Completed'),
(2,2,6,'2026-01-07','2026-01-10',2,'Booking.com','Completed'),
(3,3,11,'2026-01-10','2026-01-14',3,'Website','Completed'),
(4,4,2,'2026-01-12','2026-01-15',2,'MakeMyTrip','Cancelled'),
(5,5,7,'2026-01-15','2026-01-18',2,'Website','Completed'),
(6,6,12,'2026-01-18','2026-01-22',4,'Booking.com','Completed'),
(7,7,3,'2026-01-20','2026-01-23',1,'Walk-in','Completed'),
(8,8,8,'2026-01-22','2026-01-25',2,'Website','Cancelled'),
(9,9,13,'2026-01-25','2026-01-29',3,'Booking.com','Completed'),
(10,10,4,'2026-01-27','2026-01-30',2,'Website','Completed'),

(11,11,16,'2026-02-02','2026-02-05',3,'Website','Completed'),
(12,12,14,'2026-02-04','2026-02-08',4,'MakeMyTrip','Completed'),
(13,13,5,'2026-02-07','2026-02-09',2,'Website','Cancelled'),
(14,14,10,'2026-02-10','2026-02-13',2,'Booking.com','Completed'),
(15,15,1,'2026-02-12','2026-02-16',2,'Website','Completed'),
(16,16,6,'2026-02-15','2026-02-18',2,'Walk-in','Completed'),
(17,17,17,'2026-02-18','2026-02-22',4,'Website','Completed'),
(18,18,2,'2026-02-20','2026-02-23',2,'MakeMyTrip','Cancelled'),
(19,19,7,'2026-02-22','2026-02-25',2,'Booking.com','Completed'),
(20,20,12,'2026-02-25','2026-03-01',3,'Website','Completed'),

(21,21,3,'2026-03-02','2026-03-05',1,'Website','Completed'),
(22,22,8,'2026-03-04','2026-03-08',2,'Booking.com','Completed'),
(23,23,18,'2026-03-07','2026-03-10',3,'Website','Completed'),
(24,24,4,'2026-03-10','2026-03-12',2,'MakeMyTrip','Cancelled'),
(25,25,9,'2026-03-12','2026-03-16',3,'Website','Completed'),
(26,26,15,'2026-03-15','2026-03-19',4,'Booking.com','Completed'),
(27,27,5,'2026-03-18','2026-03-21',2,'Walk-in','Completed'),
(28,28,10,'2026-03-20','2026-03-23',2,'Website','Completed'),
(29,29,1,'2026-03-22','2026-03-25',2,'Booking.com','Cancelled'),
(30,30,6,'2026-03-25','2026-03-29',2,'Website','Completed'),

(31,31,11,'2026-04-01','2026-04-04',3,'Website','Completed'),
(32,32,2,'2026-04-03','2026-04-06',2,'MakeMyTrip','Completed'),
(33,33,7,'2026-04-05','2026-04-09',2,'Booking.com','Completed'),
(34,34,19,'2026-04-08','2026-04-12',4,'Website','Cancelled'),
(35,35,3,'2026-04-10','2026-04-13',1,'Walk-in','Completed'),
(36,36,8,'2026-04-12','2026-04-15',2,'Website','Completed'),
(37,37,13,'2026-04-15','2026-04-19',3,'Booking.com','Completed'),
(38,38,4,'2026-04-18','2026-04-21',2,'Website','Completed'),
(39,39,9,'2026-04-20','2026-04-24',3,'MakeMyTrip','Cancelled'),
(40,40,20,'2026-04-23','2026-04-27',4,'Website','Completed'),

(41,41,5,'2026-05-01','2026-05-04',2,'Website','Completed'),
(42,42,10,'2026-05-03','2026-05-06',2,'Booking.com','Completed'),
(43,43,16,'2026-05-05','2026-05-08',2,'Walk-in','Completed'),
(44,44,6,'2026-05-08','2026-05-12',2,'Website','Cancelled'),
(45,45,17,'2026-05-10','2026-05-14',3,'Booking.com','Completed'),
(46,46,2,'2026-05-12','2026-05-15',2,'Website','Completed'),
(47,47,7,'2026-05-15','2026-05-18',2,'MakeMyTrip','Completed'),
(48,48,12,'2026-05-18','2026-05-22',4,'Website','Completed'),
(49,49,3,'2026-05-20','2026-05-23',1,'Booking.com','Cancelled'),
(50,50,8,'2026-05-22','2026-05-25',2,'Website','Completed');

-- PAYMENT TABLE:
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),

    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);

INSERT INTO payments
(payment_id, booking_id, payment_date, payment_method,
 payment_status, amount)
SELECT
    b.booking_id,
    b.booking_id,
    b.check_in,
    CASE
        WHEN b.booking_id % 5 = 1 THEN 'UPI'
        WHEN b.booking_id % 5 = 2 THEN 'Credit Card'
        WHEN b.booking_id % 5 = 3 THEN 'Debit Card'
        WHEN b.booking_id % 5 = 4 THEN 'Cash'
        ELSE 'Net Banking'
    END,
    CASE
        WHEN b.booking_status = 'Cancelled'
        THEN 'Refunded'
        ELSE 'Paid'
    END,
    DATEDIFF(b.check_out,b.check_in)
    * r.price_per_night
FROM bookings b
JOIN rooms r
    ON b.room_id = r.room_id;

-- FEEDBACK TABLES:
CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    booking_id INT,
    rating INT,
    cleanliness_rating INT,
    service_rating INT,
    review_text VARCHAR(255),
    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);

INSERT INTO feedback
(feedback_id, booking_id, rating,
 cleanliness_rating, service_rating, review_text)
VALUES
(1,1,5,5,5,'Excellent stay'),
(2,2,4,4,4,'Very good experience'),
(3,3,5,5,4,'Excellent room and service'),
(4,4,2,2,2,'Booking was cancelled'),
(5,5,4,4,5,'Good service'),
(6,6,5,5,5,'Excellent hospitality'),
(7,7,4,4,4,'Comfortable stay'),
(8,8,2,3,2,'Booking cancelled'),
(9,9,5,5,5,'Very comfortable'),
(10,10,4,4,4,'Good experience'),

(11,11,5,5,5,'Excellent executive room'),
(12,12,4,4,5,'Very good stay'),
(13,13,2,2,2,'Booking cancelled'),
(14,14,4,4,4,'Nice hotel'),
(15,15,5,5,5,'Excellent service'),
(16,16,4,4,4,'Good room'),
(17,17,5,5,5,'Outstanding experience'),
(18,18,2,2,3,'Booking cancelled'),
(19,19,4,4,4,'Comfortable stay'),
(20,20,5,5,4,'Very good'),

(21,21,4,4,4,'Good experience'),
(22,22,5,5,5,'Excellent stay'),
(23,23,5,5,5,'Amazing service'),
(24,24,2,2,2,'Booking cancelled'),
(25,25,4,4,4,'Good hotel'),
(26,26,5,5,5,'Excellent room'),
(27,27,4,4,4,'Comfortable'),
(28,28,5,5,5,'Very good service'),
(29,29,2,2,2,'Booking cancelled'),
(30,30,4,4,5,'Great experience'),

(31,31,5,5,5,'Excellent suite'),
(32,32,4,4,4,'Good stay'),
(33,33,5,5,5,'Excellent service'),
(34,34,2,2,2,'Booking cancelled'),
(35,35,4,4,4,'Nice stay'),
(36,36,5,5,5,'Excellent hospitality'),
(37,37,5,5,4,'Very comfortable'),
(38,38,4,4,4,'Good experience'),
(39,39,2,2,2,'Booking cancelled'),
(40,40,5,5,5,'Outstanding room'),

(41,41,4,4,4,'Good experience'),
(42,42,5,5,5,'Excellent stay'),
(43,43,5,4,5,'Very good service'),
(44,44,2,2,2,'Booking cancelled'),
(45,45,5,5,5,'Excellent room'),
(46,46,4,4,4,'Good hotel'),
(47,47,5,5,5,'Amazing experience'),
(48,48,5,5,5,'Excellent hospitality'),
(49,49,2,2,2,'Booking cancelled'),
(50,50,4,4,5,'Very good stay');

-- VERIFY ALL TABLES:
SELECT COUNT(*) AS customers FROM customers;

SELECT COUNT(*) AS rooms FROM rooms;

SELECT COUNT(*) AS bookings FROM bookings;

SELECT COUNT(*) AS payments FROM payments;

SELECT COUNT(*) AS feedback FROM feedback;

-- BASIC SQL QUERIES:
-- 1.ALL CUSTOMERS:
SELECT *
FROM customers;

-- 2.CUSTOMERS FROM CHENNAI:
SELECT *
FROM customers
WHERE city = 'Chennai';

-- 3.BUSINESS CUSTOMER:
SELECT *
FROM customers
WHERE customer_type = 'Business';

-- 4.COMPLETED BOOKINGS:
SELECT *
FROM bookings
WHERE booking_status = 'Completed';

-- 5.CANCELLED BOOKINGS:
SELECT *
FROM bookings
WHERE booking_status = 'Cancelled';

-- AGGREGATED SQL QUERIES:
-- 6.TOTAL BOOKINGS:
SELECT COUNT(*) AS total_bookings
FROM bookings;

-- 7.TOTAL REVENUE:
SELECT
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Paid';

-- 8.AVERAGE PAYMENT:
SELECT
    ROUND(AVG(amount),2) AS average_booking_value
FROM payments
WHERE payment_status = 'Paid';

-- 9.HIGHEST BOOKINGS:
SELECT MAX(amount) AS highest_booking
FROM payments
WHERE payment_status = 'Paid';

-- 10.LOWEST BOOKINGS:
SELECT MIN(amount) AS lowest_booking
FROM payments
WHERE payment_status = 'Paid';

-- GROUPBY:
-- 11.CUSTOMERS BY CITY:
SELECT
    city,
    COUNT(*) AS customers
FROM customers
GROUP BY city
ORDER BY customers DESC;

-- 12.BOOKINGS BY CHANNEL:
SELECT
    booking_channel,
    COUNT(*) AS bookings
FROM bookings
GROUP BY booking_channel
ORDER BY bookings DESC;

-- 13.BOOKINGS BY STATUS:
SELECT
    booking_status,
    COUNT(*) AS bookings
FROM bookings
GROUP BY booking_status;

-- JOIN ANALYSIS:
-- 14.BOOKING + CUSTOMER:
SELECT
    b.booking_id,
    c.customer_name,
    c.city,
    b.check_in,
    b.check_out,
    b.booking_status
FROM bookings b
JOIN customers c
    ON b.customer_id = c.customer_id;
    
-- 15.BOOKING + ROOM:
SELECT
    b.booking_id,
    r.room_number,
    r.room_type,
    r.price_per_night,
    b.check_in,
    b.check_out
FROM bookings b
JOIN rooms r
    ON b.room_id = r.room_id;
    
-- 16.COMPLETE BOOKING ANALYSIS:
SELECT
    b.booking_id,
    c.customer_name,
    c.city,
    c.customer_type,
    r.room_type,
    r.price_per_night,
    b.check_in,
    b.check_out,
    DATEDIFF(b.check_out,b.check_in) AS stay_days,
    b.guests,
    b.booking_channel,
    b.booking_status,
    p.payment_method,
    p.payment_status,
    p.amount,
    f.rating
FROM bookings b;

-- 17.REVENUE BY ROOMTYPE:
SELECT
    r.room_type,
    SUM(p.amount) AS revenue
FROM bookings b
JOIN rooms r
    ON b.room_id = r.room_id
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY r.room_type
ORDER BY revenue DESC;

-- 18.REVENUE BY CUSTOMERS TYPE:
SELECT
    c.customer_type,
    SUM(p.amount) AS revenue
FROM customers c
JOIN bookings b
    ON c.customer_id = b.customer_id
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_type
ORDER BY revenue DESC;

-- 19.AVERAGE STAY DURATION:
SELECT
    ROUND(
        AVG(DATEDIFF(check_out,check_in)),
        2
    ) AS average_stay_days
FROM bookings
WHERE booking_status = 'Completed';

-- 20.MONTHLY REVENUE:
SELECT
    MONTHNAME(b.check_in) AS month,
    MONTH(b.check_in) AS month_number,
    SUM(p.amount) AS revenue
FROM bookings b
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY
    MONTH(b.check_in),
    MONTHNAME(b.check_in)
ORDER BY month_number;

-- 21.REVENUE BY BOOKING CHANNEL:
SELECT
    b.booking_channel,
    SUM(p.amount) AS revenue,
    COUNT(b.booking_id) AS bookings
FROM bookings b
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY b.booking_channel
ORDER BY revenue DESC;

-- 22.PAYMENT METHODS ANALYSIS:
SELECT
    payment_method,
    COUNT(*) AS transactions,
    SUM(amount) AS total_amount
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_amount DESC;

-- 23.AVERAGE RATINGS BY ROOMTYPE:
SELECT
    r.room_type,
    ROUND(AVG(f.rating),2) AS average_rating
FROM bookings b
JOIN rooms r
    ON b.room_id = r.room_id
JOIN feedback f
    ON b.booking_id = f.booking_id
GROUP BY r.room_type
ORDER BY average_rating DESC;

-- 24.TOP 10 CUSTOMERS:
SELECT
    c.customer_name,
    c.city,
    SUM(p.amount) AS total_spending
FROM customers c
JOIN bookings b
    ON c.customer_id = b.customer_id
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_spending DESC
LIMIT 10;

-- 25.CASE STATEMENT:
SELECT
    booking_id,
    guests,
    CASE
        WHEN guests = 1 THEN 'Single'
        WHEN guests = 2 THEN 'Couple'
        WHEN guests = 3 THEN 'Small Group'
        ELSE 'Large Group'
    END AS guest_category
FROM bookings;

-- SUBQUERY:
-- 26.BOOKING ABOVE THE AVERAGE BOOKING VALUE:
SELECT
    booking_id,
    amount
FROM payments
WHERE amount > (
    SELECT AVG(amount)
    FROM payments
    WHERE payment_status = 'Paid'
)
AND payment_status = 'Paid';

-- 27.CTE:
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(p.amount) AS revenue
    FROM customers c
    JOIN bookings b
        ON c.customer_id = b.customer_id
    JOIN payments p
        ON b.booking_id = p.booking_id
    WHERE p.payment_status = 'Paid'
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT *
FROM customer_revenue
ORDER BY revenue DESC;

-- 28. WINDOWS FUNCTION - CUSTOMERS RANKINGS:
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(p.amount) AS revenue
    FROM customers c
    JOIN bookings b
        ON c.customer_id = b.customer_id
    JOIN payments p
        ON b.booking_id = p.booking_id
    WHERE p.payment_status = 'Paid'
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_name,
    revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM customer_revenue;

-- 29.ROW NUMBER:
SELECT
    booking_id,
    amount,
    ROW_NUMBER() OVER (
        ORDER BY amount DESC
    ) AS booking_rank
FROM payments
WHERE payment_status = 'Paid';

-- 30.DENSE RANKING:
SELECT
    room_type,
    revenue,
    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS room_rank
FROM (
    SELECT
        r.room_type,
        SUM(p.amount) AS revenue
    FROM bookings b
    JOIN rooms r
        ON b.room_id = r.room_id
    JOIN payments p
        ON b.booking_id = p.booking_id
    WHERE p.payment_status = 'Paid'

    GROUP BY r.room_type
) x;

-- 31.CREATE ANALYTICAL VIEW:
CREATE VIEW hotel_analysis AS
SELECT
    b.booking_id,
    b.customer_id,
    c.customer_name,
    c.gender,
    c.age,
    c.city,
    c.customer_type,
    b.room_id,
    r.room_number,
    r.room_type,
    r.price_per_night,
    b.check_in,
    b.check_out,
    DATEDIFF(
        b.check_out,
        b.check_in
    ) AS stay_days,
    b.guests,
    b.booking_channel,
    b.booking_status,
    p.payment_method,
    p.payment_status,
    p.amount AS revenue,
    f.rating,
    f.cleanliness_rating,
    f.service_rating
FROM bookings b
JOIN customers c
    ON b.customer_id = c.customer_id
JOIN rooms r
    ON b.room_id = r.room_id
JOIN payments p
    ON b.booking_id = p.booking_id
JOIN feedback f
    ON b.booking_id = f.booking_id;
    
SELECT *
FROM hotel_analysis;    