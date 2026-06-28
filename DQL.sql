
-- All confirmed bookings with user name and amount
SELECT b.Booking_ID, u.User_Name, u.Phone, b.Booking_Date, b.Paid_Amount, b.Booking_Status
FROM gobus.Booking b JOIN gobus."User" u ON u.User_ID = b.User_ID
WHERE b.Booking_Status = 'CONFIRMED' AND b.Payment_Status = 'SUCCESS'
ORDER BY b.Booking_Date DESC;


-- Total revenue and booking count per user
SELECT u.User_Name, u.Email,
    COUNT(b.Booking_ID) AS Total_Bookings,
    SUM(b.Paid_Amount) AS Total_Spent
FROM gobus."User" u JOIN gobus.Booking b ON b.User_ID = b.User_ID AND b.Payment_Status = 'SUCCESS'
JOIN gobus.Booking bk ON bk.User_ID = u.User_ID AND bk.Payment_Status = 'SUCCESS'
GROUP BY u.User_ID, u.User_Name, u.Email ORDER BY Total_Spent DESC;


-- Confirmed bookings that have no ticket issued
SELECT b.Booking_ID, u.User_Name, b.Booking_Date, b.Paid_Amount
FROM gobus.Booking b JOIN gobus."User" u ON u.User_ID = b.User_ID
WHERE b.Booking_Status IN ('CONFIRMED', 'COMPLETED') AND b.Booking_ID NOT IN ( SELECT tk.Booking_ID FROM gobus.Ticket tk)
ORDER BY b.Booking_Date;


-- Total revenue per route
SELECT r.Route_Name,
    COUNT(b.Booking_ID) AS Total_Bookings,
    SUM(b.Paid_Amount) AS Route_Revenue
FROM gobus.Booking b JOIN gobus.Trip t ON t.Booking_ID = b.Booking_ID JOIN gobus.Route r ON r.Route_ID = t.Route_ID
WHERE b.Payment_Status = 'SUCCESS'
GROUP BY r.Route_ID, r.Route_Name ORDER BY Route_Revenue DESC;


-- All trips today with route and bus details
SELECT t.Departure_DateTime, r.Route_Name, b.Register_No, b.Bus_Type, t.Journey_Status
FROM gobus.Trip t
JOIN gobus.Route r ON r.Route_ID = t.Route_ID
JOIN gobus.Bus b ON b.Bus_ID = t.Bus_ID
WHERE DATE(t.Departure_DateTime) = '2026-04-10'
ORDER BY t.Departure_DateTime;


-- PNR check
SELECT p.Passenger_Name, p.Passenger_Type, p.Gender, p.DOB, s.Seat_No, s.Seat_Type
FROM gobus.Passenger_Ticket pt
JOIN gobus.Passenger p ON p.Passenger_ID = pt.Passenger_ID
LEFT JOIN gobus.Passenger_Seat ps ON ps.Passenger_ID = p.Passenger_ID
LEFT JOIN gobus.Seat s ON s.Seat_ID = ps.Seat_ID
WHERE pt.PNR = 'PNR100001';


-- Find the seat number and type assigned to a passenger
SELECT p.Passenger_Name, s.Seat_No,s.Seat_Type, b.Register_No
FROM gobus.Passenger p
JOIN gobus.Passenger_Seat ps ON ps.Passenger_ID = p.Passenger_ID
JOIN gobus.Seat s ON s.Seat_ID = ps.Seat_ID
JOIN gobus.Bus b ON b.Bus_ID = s.Bus_ID
WHERE p.Passenger_Name = 'Vikas Rathod';

-- For each passenger, show their PNR, booking, route, and seat
SELECT p.Passenger_Name, pt.PNR, r.Route_Name, s.Seat_No, s.Seat_Type, b.Booking_Status
FROM gobus.Passenger p
JOIN gobus.Passenger_Ticket pt ON pt.Passenger_ID = p.Passenger_ID
JOIN gobus.Ticket tk ON tk.PNR = pt.PNR
JOIN gobus.Booking b ON b.Booking_ID = tk.Booking_ID
JOIN gobus.Trip tr ON tr.Booking_ID = b.Booking_ID
JOIN gobus.Route r ON r.Route_ID = tr.Route_ID
LEFT JOIN gobus.Passenger_Seat ps ON ps.Passenger_ID = p.Passenger_ID
LEFT JOIN gobus.Seat s ON s.Seat_ID = ps.Seat_ID
ORDER BY p.Passenger_Name;


-- Full journey detail per passenger
SELECT p.Passenger_Name, pt.PNR, r.Route_Name, t.Departure_DateTime, t.Journey_Status, b.Booking_Status
FROM gobus.Passenger p
JOIN gobus.Passenger_Ticket pt ON pt.Passenger_ID = p.Passenger_ID
JOIN gobus.Ticket tk ON tk.PNR = pt.PNR
JOIN gobus.Booking b ON b.Booking_ID = tk.Booking_ID
JOIN gobus.Trip t ON t.Booking_ID = b.Booking_ID
JOIN gobus.Route r ON r.Route_ID = t.Route_ID
ORDER BY p.Passenger_Name, t.Departure_DateTime;


-- Number of passengers per route
SELECT r.Route_Name,
    COUNT(DISTINCT pt.Passenger_ID) AS Passenger_Count,
    COUNT(DISTINCT tk.PNR) AS Ticket_Count
FROM gobus.Passenger_Ticket pt
JOIN gobus.Ticket tk ON tk.PNR = pt.PNR
JOIN gobus.Booking bk ON bk.Booking_ID = tk.Booking_ID
JOIN gobus.Trip t ON t.Booking_ID = bk.Booking_ID
JOIN gobus.Route r ON r.Route_ID = t.Route_ID
GROUP BY r.Route_ID, r.Route_Name
ORDER BY Passenger_Count DESC;

-- Which passenger type prefers which seat types
SELECT p.Passenger_Type,s.Seat_Type,
    COUNT(*) AS Count
FROM gobus.Passenger p
JOIN gobus.Passenger_Seat ps ON ps.Passenger_ID = p.Passenger_ID
JOIN gobus.Seat s ON s.Seat_ID = ps.Seat_ID
GROUP BY p.Passenger_Type, s.Seat_Type
ORDER BY p.Passenger_Type, Count DESC;


-- Most booked route per user
SELECT u.User_Name, r.Route_Name,
    COUNT(b.Booking_ID) AS Times_Booked
FROM gobus."User" u
JOIN gobus.Booking b ON b.User_ID = u.User_ID
JOIN gobus.Trip t ON t.Booking_ID = b.Booking_ID
JOIN gobus.Route r ON r.Route_ID = t.Route_ID
WHERE b.Payment_Status = 'SUCCESS'
GROUP BY u.User_ID, u.User_Name, r.Route_ID, r.Route_Name
ORDER BY u.User_Name, Times_Booked DESC;


-- Average booking fare per bus type
SELECT b.Bus_Type,
    COUNT(bk.Booking_ID) AS Num_Bookings,
    ROUND(AVG(bk.Paid_Amount), 2) AS Avg_Fare,
    MIN(bk.Paid_Amount) AS Min_Fare,
    MAX(bk.Paid_Amount) AS Max_Fare
FROM gobus.Bus b
JOIN gobus.Trip t ON t.Bus_ID = b.Bus_ID
JOIN gobus.Booking bk ON bk.Booking_ID = t.Booking_ID
WHERE bk.Payment_Status = 'SUCCESS'
GROUP BY b.Bus_Type
ORDER BY Avg_Fare DESC;

-- Revenue generated per operator
SELECT o.Operator_Name,
    COUNT(DISTINCT t.Bus_ID) AS Buses_Used,
    COUNT(DISTINCT bk.Booking_ID) AS Bookings,
    SUM(bk.Paid_Amount) AS Revenue
FROM gobus.Trip t
JOIN gobus.Bus b ON b.Bus_ID = t.Bus_ID
JOIN gobus.Operator o ON o.Operator_ID = b.Operator_ID
JOIN gobus.Booking bk ON bk.Booking_ID = t.Booking_ID
WHERE bk.Payment_Status = 'SUCCESS'
GROUP BY o.Operator_ID, o.Operator_Name
ORDER BY Revenue DESC;


-- Passenger name and their seat details with operator
SELECT p.Passenger_Name, p.Passenger_Type, s.Seat_No, s.Seat_Type, b.Register_No, b.Bus_Type, o.Operator_Name
FROM gobus.Passenger_Seat ps
JOIN gobus.Passenger p ON p.Passenger_ID = ps.Passenger_ID
JOIN gobus.Seat s ON s.Seat_ID = ps.Seat_ID
JOIN gobus.Bus b ON b.Bus_ID = s.Bus_ID
JOIN gobus.Operator o ON o.Operator_ID = b.Operator_ID
ORDER BY o.Operator_Name, b.Register_No, s.Seat_No;

