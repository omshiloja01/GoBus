INSERT INTO gobus.Station (Station_ID, Station_Name, Address, City)
VALUES
( 1, 'Ahmedabad Central', 'Geeta Mandir, ST Bus Stand', 'Ahmedabad' ),
( 2, 'Surat Main', 'City Bus Terminal, Ring Road', 'Surat' ),
( 3, 'Vadodara ST Stand', 'Sayajigunj', 'Vadodara' ),
( 4, 'Rajkot Central', 'Kalawad Road', 'Rajkot' ),
( 5, 'Gandhinagar Sector-1', 'Sector 1', 'Gandhinagar' ),
( 6, 'Anand Bus Stand', 'Station Road', 'Anand' ),
( 7, 'Nadiad Depot', 'College Road', 'Nadiad' ),
( 8, 'Bharuch ST Stand', 'NH-48, Station Area', 'Bharuch' ),
( 9, 'Navsari Bus Terminal', 'Gandhi Chowk', 'Navsari' ),
(10, 'Junagadh Central', 'Dhal Road', 'Junagadh' ),
(11, 'Bhavnagar ST', 'Waghawadi Road', 'Bhavnagar' ),
(12, 'Jamnagar Bus Stand', 'Teen Batti Chowk', 'Jamnagar' ),
(13, 'Morbi Depot', 'Ravapar Road', 'Morbi' ),
(14, 'Surendranagar Terminal', 'Station Road', 'Surendranagar'),
(15, 'Patan Bus Stand', 'Highway Chowk', 'Patan' );


INSERT INTO gobus.Route (Route_ID, Route_Name) VALUES
( 1, 'Ahmedabad to Surat Express' ),
( 2, 'Surat to Vadodara Shuttle' ),
( 3, 'Ahmedabad to Rajkot Direct' ),
( 4, 'Vadodara to Gandhinagar Link' ),
( 5, 'Gandhinagar to Ahmedabad City' ),
( 6, 'Surat to Navsari Local' ),
( 7, 'Rajkot to Jamnagar Express' ),
( 8, 'Ahmedabad to Anand Shuttle' ),
( 9, 'Bharuch to Vadodara Link' ),
(10, 'Junagadh to Rajkot Direct' ),
(11, 'Bhavnagar to Ahmedabad Express' ),
(12, 'Morbi to Rajkot Shuttle' ),
(13, 'Patan to Ahmedabad Link' ),
(14, 'Nadiad to Anand Local' ),
(15, 'Surendranagar to Ahmedabad Express');


INSERT INTO gobus.Route_Station (Route_ID, Station_ID, Stop_No, Duration_From_Source) VALUES
( 1, 1, 1,   0), -- Ahmedabad (source)
( 1, 3, 2,  90), -- Vadodara
( 1, 2, 3, 210), -- Surat (destination)
( 2, 2, 1,   0), -- Surat (source)
( 2, 3, 2,  90), -- Vadodara (destination)
( 3, 1, 1,   0), -- Ahmedabad (source)
( 3, 4, 2, 180), -- Rajkot (destination)
( 4, 3, 1,   0), -- Vadodara (source)
( 4, 5, 2,  60), -- Gandhinagar (destination)
( 5, 5, 1,   0), -- Gandhinagar (source)
( 5, 1, 2,  30), -- Ahmedabad (destination)
( 6, 2, 1,   0), -- Surat (source)
( 6, 9, 2,  45), -- Navsari (destination)
( 7, 4, 1,   0), -- Rajkot (source)
( 7, 12, 2, 90); -- Jamnagar (destination)


INSERT INTO gobus.Operator (Operator_ID, Operator_Name, Address, Email, Contact_No) VALUES
( 1, 'Gujarat Travels Pvt Ltd', 'Ring Road, Surat', 'info@gujarattravels.in', '9876543210'),
( 2, 'Patel Bus Service', 'Ashram Road, Ahmedabad', 'contact@patelbus.com', '9988776655'),
( 3, 'Ambaji Express', 'Kalawad Road, Rajkot', 'ops@ambajiexpress.com', '8877665544'),
( 4, 'Dwarka Roadlines', 'MG Road, Vadodara', 'support@dwarkaroad.in', '7766554433'),
( 5, 'Capital Bus Co', 'Sector 12, Gandhinagar', 'hello@capitalbus.in', '6655443322'),
( 6, 'Narmada Transport', 'Station Road, Bharuch', 'nm@narmadatransport.in', '9512345678'),
( 7, 'Somnath Travels', 'Dhal Road, Junagadh', 'book@somnathtravel.in', '9423456789'),
( 8, 'Saurastra Bus Lines', 'Waghawadi Road, Bhavnagar', 'info@saurashtrabus.in', '9334567890'),
( 9, 'Silver Star Transport', 'Teen Batti, Jamnagar', 'ops@silverstar.in', '9245678901'),
(10, 'Mahi Express', 'College Road, Nadiad', 'mahi@mahiexpress.in', '9156789012'),
(11, 'Rann Riders', 'Ravapar Road, Morbi', 'rann@rannriders.in', '9067890123'),
(12, 'Sabarmati Coaches', 'Highway Chowk, Patan', 'info@sabarmaticoach.in', '8978901234'),
(13, 'Vatrak Bus Service', 'Gandhi Chowk, Navsari', 'vatrak@vatrakbus.in', '8889012345'),
(14, 'Saurashtra Link', 'Station Road, Surendranagar', 'link@saurashtralink.in', '8790123456'),
(15, 'Anand City Transport', 'Station Road, Anand', 'anand@anandct.in', '8601234567');


INSERT INTO gobus.Bus (Bus_ID, Operator_ID, Register_No, Total_Seat, Bus_Type) VALUES
( 1,  1, 'GJ-05-AB-1234', 40, 'AC Seater'     ),
( 2,  1, 'GJ-05-CD-5678', 36, 'AC Sleeper'    ),
( 3,  2, 'GJ-01-EF-9012', 50, 'Non-AC Seater' ),
( 4,  3, 'GJ-12-GH-3456', 40, 'Non-AC Sleeper'),
( 5,  4, 'GJ-06-IJ-7890', 40, 'AC Seater'     ),
( 6,  5, 'GJ-07-KL-1111', 36, 'AC Sleeper'    ),
( 7,  6, 'GJ-02-MN-2222', 45, 'Non-AC Seater' ),
( 8,  7, 'GJ-10-OP-3333', 40, 'AC Sleeper'    ),
( 9,  8, 'GJ-11-QR-4444', 50, 'Non-AC Seater' ),
(10,  9, 'GJ-14-ST-5555', 36, 'AC Seater'     ),
(11, 10, 'GJ-03-UV-6666', 40, 'Non-AC Sleeper'),
(12, 11, 'GJ-08-WX-7777', 36, 'AC Sleeper'    ),
(13, 12, 'GJ-13-YZ-8888', 50, 'Non-AC Seater' ),
(14, 13, 'GJ-04-AA-9999', 40, 'AC Seater'     ),
(15, 14, 'GJ-09-BB-1010', 40, 'Non-AC Sleeper');


INSERT INTO gobus.Seat (Seat_ID, Bus_ID, Seat_No, Seat_Type) VALUES
( 1, 1, 1, 'Seater Window'),
( 2, 1, 2, 'Seater Aisle' ),
( 3, 1, 3, 'Seater Window'),
( 4, 2, 1, 'Sleeper Lower'),
( 5, 2, 2, 'Sleeper Upper'),
( 6, 2, 3, 'Sleeper Lower'),
( 7, 3, 1, 'Seater Window'),
( 8, 3, 2, 'Seater Aisle' ),
( 9, 4, 1, 'Sleeper Lower'),
(10, 4, 2, 'Sleeper Upper'),
(11, 5, 1, 'Seater Window'),
(12, 5, 2, 'Seater Aisle' ),
(13, 6, 1, 'Sleeper Lower'),
(14, 6, 2, 'Sleeper Upper'),
(15, 7, 1, 'Seater Aisle' );


INSERT INTO gobus."User" (User_ID, Referral_User_ID, User_Name, Email, Phone) VALUES
( 1, NULL, 'Vikas Rathod',    'vikas@example.com', '9000000001'),
( 2, NULL, 'Bhagy Sheth',     'bhagy@example.com', '9000000002'),
( 3,    1, 'Om Shiloja',      'om@example.com',    '9000000003'),
( 4,    1, 'Parth Sorathiya', 'parth@example.com', '9000000004'),
( 5,    2, 'Dhruv Sodvadiya', 'dhruv@example.com', '9000000005'),
( 6, NULL, 'Kavya Patel',     'kavya@example.com', '9000000006'),
( 7, NULL, 'Raj Mehta',       'raj@example.com',   '9000000007'),
( 8,    3, 'Anita Shah',      'anita@example.com', '9000000008'),
( 9, NULL, 'Mohan Trivedi',   'mohan@example.com', '9000000009'),
(10,    5, 'Priya Joshi',     'priya@example.com', '9000000010'),
(11,    6, 'Ravi Desai',      'ravi@example.com',  '9000000011'),
(12, NULL, 'Sneha Kapoor',    'sneha@example.com', '9000000012'),
(13,    7, 'Arjun Nair',      'arjun@example.com', '9000000013'),
(14,    2, 'Meena Sharma',    'meena@example.com', '9000000014'),
(15, NULL, 'Karan Gupta',     'karan@example.com', '9000000015');


INSERT INTO gobus.Booking
(Booking_ID, User_ID, Booking_Date, Booking_Status, Paid_Amount, Payment_Status) VALUES
( 1,  1, '2026-04-01 09:00:00', 'CONFIRMED',   850.00, 'SUCCESS' ),
( 2,  2, '2026-04-01 10:30:00', 'CONFIRMED',  1200.00, 'SUCCESS' ),
( 3,  3, '2026-04-02 11:00:00', 'PENDING',       0.00, 'PENDING' ),
( 4,  4, '2026-04-02 12:00:00', 'CANCELLED',   500.00, 'REFUNDED'),
( 5,  5, '2026-04-03 08:00:00', 'CONFIRMED',   750.00, 'SUCCESS' ),
( 6,  6, '2026-04-03 14:00:00', 'COMPLETED',  1100.00, 'SUCCESS' ),
( 7,  7, '2026-04-04 09:30:00', 'CONFIRMED',   650.00, 'SUCCESS' ),
( 8,  8, '2026-04-04 10:00:00', 'PENDING',       0.00, 'FAILED'  ),
( 9,  9, '2026-04-05 15:00:00', 'CONFIRMED',   900.00, 'SUCCESS' ),
(10, 10, '2026-04-05 16:00:00', 'CANCELLED',   300.00, 'REFUNDED'),
(11, 11, '2026-04-06 08:00:00', 'CONFIRMED',   780.00, 'SUCCESS' ),
(12, 12, '2026-04-06 09:00:00', 'COMPLETED',  1350.00, 'SUCCESS' ),
(13, 13, '2026-04-07 10:00:00', 'PENDING',       0.00, 'PENDING' ),
(14, 14, '2026-04-07 11:00:00', 'CONFIRMED',   920.00, 'SUCCESS' ),
(15, 15, '2026-04-08 07:00:00', 'CONFIRMED',   460.00, 'SUCCESS' ),
(16,  6, '2026-04-06 10:00:00', 'CONFIRMED',   670.00, 'SUCCESS' ),
(17,  7, '2026-04-07 11:00:00', 'CONFIRMED',   890.00, 'SUCCESS' ),
(18,  8, '2026-04-08 09:00:00', 'CANCELLED',   400.00, 'REFUNDED'),
(19,  9, '2026-04-09 08:00:00', 'CONFIRMED',  1050.00, 'SUCCESS' ),
(20, 10, '2026-04-09 10:00:00', 'CONFIRMED',   730.00, 'SUCCESS' );


INSERT INTO gobus.Trip
(Route_ID, Bus_ID, Departure_DateTime, Booking_ID, Journey_Status, Driver_ID, Conductor_ID) VALUES
( 1,  1, '2026-04-10 06:00:00',  1, 'SCHEDULED',   101, 201),
( 1,  2, '2026-04-10 18:00:00',  2, 'SCHEDULED',   102, 202),
( 2,  3, '2026-04-10 07:00:00',  5, 'IN_PROGRESS',  103, 203),
( 3,  4, '2026-04-09 06:00:00',  6, 'COMPLETED',   104, 204),
( 4,  5, '2026-04-10 09:00:00',  7, 'SCHEDULED',   105, 205),
( 5,  6, '2026-04-08 08:00:00', 11, 'COMPLETED',   106, 206),
( 6,  7, '2026-04-10 07:30:00',  9, 'IN_PROGRESS',  107, 207),
( 7,  8, '2026-04-11 06:00:00', 12, 'SCHEDULED',   108, 208),
( 8,  9, '2026-04-09 08:00:00', 14, 'COMPLETED',   109, 209),
( 9, 10, '2026-04-12 09:00:00', 15, 'SCHEDULED',   110, 210),
(10, 11, '2026-04-09 05:30:00', 16, 'COMPLETED',   101, 201),
(11, 12, '2026-04-13 06:00:00', 17, 'SCHEDULED',   102, 202),
(12, 13, '2026-04-10 14:00:00', 18, 'CANCELLED',   103, 203),
(13, 14, '2026-04-11 08:00:00', 19, 'SCHEDULED',   104, 204),
(14, 15, '2026-04-12 07:00:00', 20, 'SCHEDULED',   105, 205);


INSERT INTO gobus.Ticket (PNR, Booking_ID, Total_Seat) VALUES
('PNR100001',  1, 2),
('PNR100002',  2, 3),
('PNR100003',  5, 1),
('PNR100004',  6, 2),
('PNR100005',  7, 1),
('PNR100006',  9, 2),
('PNR100007', 11, 1),
('PNR100008', 12, 3),
('PNR100009', 14, 1),
('PNR100010', 15, 2),
('PNR100011',  1, 1),
('PNR100012',  2, 1),
('PNR100013',  5, 2),
('PNR100014',  6, 1),
('PNR100015',  7, 2);


INSERT INTO gobus.Passenger (Passenger_ID, Passenger_Type, Passenger_Name, Email, Gender, DOB) VALUES
( 1, 'Adult',  'Vikas Rathod',   'p.vikas@example.com',  'Male',   '1998-03-15'),
( 2, 'Adult',  'Bhagy Sheth',    'p.bhagy@example.com',  'Male',   '2000-06-20'),
( 3, 'Child',  'Riya Sheth',     'p.riya@example.com',   'Female', '2015-01-10'),
( 4, 'Adult',  'Om Shiloja',     'p.om@example.com',     'Male',   '1999-11-05'),
( 5, 'Senior', 'Ramila Ben',     'p.ramila@example.com', 'Female', '1955-07-22'),
( 6, 'Adult',  'Parth Sorathiya','p.parth@example.com',  'Male',   '2001-04-30'),
( 7, 'Adult',  'Dhruv Sodvadiya','p.dhruv@example.com',  'Male',   '2000-09-18'),
( 8, 'Child',  'Aarav Joshi',    'p.aarav@example.com',  'Male',   '2018-03-03'),
( 9, 'Adult',  'Kavya Patel',    'p.kavya@example.com',  'Female', '1997-12-25'),
(10, 'Adult',  'Raj Mehta',      'p.raj@example.com',    'Male',   '1995-05-14'),
(11, 'Senior', 'Sunita Shah',    'p.sunita@example.com', 'Female', '1952-08-19'),
(12, 'Adult',  'Anita Shah',     'p.anita@example.com',  'Female', '1996-02-28'),
(13, 'Adult',  'Mohan Trivedi',  'p.mohan@example.com',  'Male',   '1993-10-10'),
(14, 'Child',  'Neha Trivedi',   'p.neha@example.com',   'Female', '2017-06-06'),
(15, 'Adult',  'Priya Joshi',    'p.priya@example.com',  'Female', '2002-01-01');


INSERT INTO gobus.Passenger_Ticket (Passenger_ID, PNR) VALUES
( 1, 'PNR100001'),
( 2, 'PNR100001'),
( 3, 'PNR100002'),
( 2, 'PNR100002'),
( 4, 'PNR100002'),
( 5, 'PNR100003'),
( 6, 'PNR100004'),
( 7, 'PNR100004'),
( 8, 'PNR100005'),
( 9, 'PNR100006'),
(10, 'PNR100006'),
(11, 'PNR100007'),
(12, 'PNR100008'),
(13, 'PNR100009'),
(14, 'PNR100010'),
(15, 'PNR100010');


INSERT INTO gobus.Passenger_Seat (Seat_ID, Passenger_ID) VALUES
( 1,  1),
( 2,  2),
( 3,  4),
( 4,  5),
( 5,  6),
( 6,  7),
( 7,  8),
( 8,  9),
( 9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15,  3);