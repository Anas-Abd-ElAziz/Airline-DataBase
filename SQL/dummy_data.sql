USE AirLineDB;
-- =========================
-- 1. Airline
-- =========================
INSERT INTO Airline (id, line_name, line_address, contact_person) VALUES
(1, 'SkyWings', 'Cairo, Egypt', 'Ahmed Nasser'),
(2, 'FlyHigh', 'Dubai, UAE', 'Sara Khaled'),
(3, 'BlueJet', 'Doha, Qatar', 'Omar Ali'),
(4, 'AeroStar', 'Riyadh, KSA', 'Lina Farouk'),
(5, 'AirNova', 'Amman, Jordan', 'Hani Zayed');

-- =========================
-- 2. AirPhones
-- =========================
INSERT INTO AirPhones (airline_id, airline_phone) VALUES
(1, 201111111111),
(1, 201122233344),
(2, 971555123456),
(3, 974777888999),
(4, 966500112233),
(5, 962790112233),
(5, 962790223344),
(3, 974777555333),
(2, 971555777888),
(4, 966555999111);

-- =========================
-- 3. EMPLOYEE
-- =========================
INSERT INTO EMPLOYEE (id, emp_name, emp_address, bday, bmonth, byear, position, gender, employer_airline) VALUES
(101, 'Ali Hassan', 'Cairo', 15, 3, 1990, 'Pilot', 'M', 1),
(102, 'Mona Adel', 'Dubai', 20, 6, 1992, 'Hostess', 'F', 2),
(103, 'Omar Youssef', 'Doha', 10, 11, 1988, 'Pilot', 'M', 3),
(104, 'Salma Tarek', 'Riyadh', 8, 8, 1995, 'Hostess', 'F', 4),
(105, 'Hossam Fathy', 'Amman', 25, 1, 1987, 'Pilot', 'M', 5);

-- =========================
-- 4. EMPLOYEE_Qualifications
-- =========================
INSERT INTO EMPLOYEE_Qualifications (emp_id, qualification) VALUES
(101, 'BSc Aviation'),
(101, 'Commercial Pilot License'),
(102, 'Cabin Crew Certification'),
(103, 'Flight Instructor License'),
(104, 'Cabin Crew Certification'),
(105, 'Aerodynamics Training'),
(105, 'Advanced Jet Operation');

-- =========================
-- 5. Transactions
-- =========================
INSERT INTO Transactions (id, descreption, trdate, amount, airline_id) VALUES
(201, 'Fuel Purchase', '2025-10-01', 12000, 1),
(202, 'Maintenance Service', '2025-10-03', 18000, 2),
(203, 'Ticket Sales', '2025-10-05', 25000, 3),
(204, 'Equipment Upgrade', '2025-10-07', 9500, 4),
(205, 'Training Expenses', '2025-10-09', 5000, 5);

-- =========================
-- 6. AirCraft
-- =========================
INSERT INTO AirCraft (id, capacity, model, owned_by) VALUES
(301, 180, 'Airbus A320', 1),
(302, 220, 'Boeing 737', 2),
(303, 150, 'Embraer E190', 3),
(304, 280, 'Boeing 787', 4),
(305, 200, 'Airbus A321', 5);

-- =========================
-- 7. TripRoutes
-- =========================
INSERT INTO TripRoutes (id, distance, origin, trp_classification, trp_destination) VALUES
(401, 500, 'Cairo', 'Domestic', 'Alexandria'),
(402, 2500, 'Dubai', 'International', 'Paris'),
(403, 1800, 'Doha', 'International', 'Istanbul'),
(404, 1200, 'Riyadh', 'Regional', 'Cairo'),
(405, 900, 'Amman', 'Regional', 'Beirut');

-- =========================
-- 8. Trip
-- =========================
INSERT INTO Trip (route_id, aircraft_id, dept_datetime, arr_datetime, price) VALUES
(401, 301, '2025-10-15 08:00', '2025-10-15 09:00', 1500),
(402, 302, '2025-10-16 10:00', '2025-10-16 14:30', 4500),
(403, 303, '2025-10-17 07:00', '2025-10-17 09:45', 3200),
(404, 304, '2025-10-18 06:30', '2025-10-18 08:15', 2000),
(405, 305, '2025-10-19 09:00', '2025-10-19 10:45', 1700);

-- =========================
-- 9. Crew
-- =========================
INSERT INTO Crew (crew_id, aircraft_id, main_pilot_id, assistant_pilot_id, hostess1_id, hostess2_id) VALUES
(501, 301, 101, 103, 102, 104),
(502, 302, 103, 105, 102, 104),
(503, 303, 105, 101, 104, 102),
(504, 304, 101, 105, 102, 104),
(505, 305, 103, 101, 104, 102);