----- GOBUS -----

DROP TABLE IF EXISTS Passenger_Seat CASCADE;
DROP TABLE IF EXISTS Passenger_Ticket CASCADE;
DROP TABLE IF EXISTS Passenger CASCADE;
DROP TABLE IF EXISTS Ticket CASCADE;
DROP TABLE IF EXISTS Trip CASCADE;
DROP TABLE IF EXISTS Booking CASCADE;
DROP TABLE IF EXISTS Seat CASCADE;
DROP TABLE IF EXISTS Bus CASCADE;
DROP TABLE IF EXISTS Operator CASCADE;
DROP TABLE IF EXISTS Route_Station CASCADE;
DROP TABLE IF EXISTS Route CASCADE;
DROP TABLE IF EXISTS Station CASCADE;
DROP TABLE IF EXISTS "User" CASCADE;

CREATE SCHEMA gobus;
SET search_path TO gobus;

CREATE TABLE Station (
    Station_ID SERIAL PRIMARY KEY,
    Station_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL
);

CREATE TABLE Route (
    Route_ID SERIAL PRIMARY KEY,
    Route_Name VARCHAR(100)
);

CREATE TABLE Route_Station (
    Route_ID INTEGER NOT NULL,
    Station_ID INTEGER NOT NULL,
    Stop_No INTEGER NOT NULL,
    Duration_From_Source INTEGER NOT NULL,
    PRIMARY KEY (Route_ID, Station_ID),
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID) ON DELETE CASCADE,
    FOREIGN KEY (Station_ID) REFERENCES Station(Station_ID) ON DELETE CASCADE
);

CREATE TABLE Operator (
    Operator_ID SERIAL PRIMARY KEY,
    Operator_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Contact_No VARCHAR(15)  NOT NULL
);

CREATE TABLE Bus (
    Bus_ID SERIAL PRIMARY KEY,
    Operator_ID INTEGER NOT NULL,
    Register_No VARCHAR(30) NOT NULL UNIQUE,
    Total_Seat INTEGER NOT NULL CHECK (Total_Seat > 0),
    Bus_Type VARCHAR(50) NOT NULL,
    FOREIGN KEY (Operator_ID) REFERENCES Operator(Operator_ID) ON DELETE CASCADE,
    CHECK (Bus_Type IN ('AC Sleeper', 'AC Seater', 'Non-AC Sleeper', 'Non-AC Seater'))
);

CREATE TABLE Seat (
    Seat_ID SERIAL PRIMARY KEY,
    Bus_ID INTEGER NOT NULL,
    Seat_No INTEGER NOT NULL,
    Seat_Type VARCHAR(30) NOT NULL,
    UNIQUE (Bus_ID, Seat_No),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID) ON DELETE CASCADE,
    CHECK (Seat_Type IN ('Sleeper Upper', 'Sleeper Lower', 'Seater Window', 'Seater Aisle'))
);

CREATE TABLE "User" (
    User_ID SERIAL PRIMARY KEY,
    Referral_User_ID INTEGER,
    User_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone VARCHAR(150) NOT NULL UNIQUE,
    FOREIGN KEY (Referral_User_ID) REFERENCES "User"(User_ID) ON DELETE SET NULL
);

CREATE TABLE Booking (
    Booking_ID SERIAL PRIMARY KEY,
    User_ID INTEGER NOT NULL,
    Booking_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Booking_Status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    Paid_Amount DECIMAL(10,2) NOT NULL CHECK (Paid_Amount >= 0),
    Payment_Status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    FOREIGN KEY (User_ID) REFERENCES "User"(User_ID) ON DELETE RESTRICT,
    CHECK (Booking_Status IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED')),
    CHECK (Payment_Status IN ('PENDING', 'SUCCESS', 'FAILED', 'REFUNDED'))
);

CREATE TABLE Trip (
    Route_ID INTEGER NOT NULL,
    Bus_ID INTEGER NOT NULL,
    Departure_DateTime TIMESTAMP NOT NULL,
    Booking_ID INTEGER,
    Journey_Status VARCHAR(20),
    Driver_ID INTEGER,
    Conductor_ID INTEGER,
    PRIMARY KEY (Route_ID, Bus_ID, Departure_DateTime),
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID) ON DELETE SET NULL,
    CHECK (Journey_Status IN ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'))
);

CREATE TABLE Ticket (
    PNR VARCHAR(20) PRIMARY KEY,
    Booking_ID INTEGER NOT NULL,
    Total_Seat INTEGER NOT NULL CHECK (Total_Seat > 0),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID) ON DELETE CASCADE
);

CREATE TABLE Passenger (
    Passenger_ID SERIAL PRIMARY KEY,
    Passenger_Type VARCHAR(100) NOT NULL,
    Passenger_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Gender VARCHAR(10) NOT NULL,
    DOB DATE NOT NULL,
    CHECK (Passenger_Type IN ('Adult', 'Child', 'Senior')),
    CHECK (Gender IN ('Male', 'Female', 'Other'))
);

CREATE TABLE Passenger_Ticket (
    Passenger_ID INTEGER NOT NULL,
    PNR VARCHAR(20) NOT NULL,
    PRIMARY KEY (Passenger_ID, PNR),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID) ON DELETE CASCADE,
    FOREIGN KEY (PNR) REFERENCES Ticket(PNR) ON DELETE CASCADE
);

CREATE TABLE Passenger_Seat (
    Seat_ID INTEGER NOT NULL,
    Passenger_ID INTEGER NOT NULL,
    PRIMARY KEY (Seat_ID, Passenger_ID),
    FOREIGN KEY (Seat_ID) REFERENCES Seat(Seat_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID) ON DELETE CASCADE
);
