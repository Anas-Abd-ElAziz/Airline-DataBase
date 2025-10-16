# ✈️ AirLine Database Project

This project implements an **Airline Management Database** system using
**Microsoft SQL Server**.\
It models the main entities and relationships involved in an airline's
operations --- including employees, aircrafts, crews, routes, and
transactions.

------------------------------------------------------------------------

## 🧩 Entity-Relationship Diagram (ERD)

The following diagram represents the conceptual design of the system:

![ERD](Images/ERD.png)

------------------------------------------------------------------------

## 🧱 Database Schema

Here's the logical schema translated from the ERD:

![Schema](Images/Schema.png)

------------------------------------------------------------------------

## 🗃️ SQL Database Creation Script

The database can be created using the provided SQL script file
[`AirlineDB.sql`](SQL/createdb.sql) (or the SQL code below):

``` sql
USE AirLineDB;

CREATE TABLE EMPLOYEE (
    id bigint PRIMARY KEY,
    emp_name varchar(20) not null,
    emp_address varchar(50) not null,
    bday tinyint,
    bmonth tinyint,
    byear int,
    position varchar(50) not null,
    gender varchar(1) not null,
    employer_airline bigint not null
);

CREATE TABLE EMPLOYEE_Qualifications (
    emp_id bigint not null,
    qualification varchar(50) not null,
    PRIMARY KEY (emp_id, qualification),
    FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(id)
);

CREATE TABLE Airline (
    id bigint PRIMARY KEY,
    line_name varchar(50),
    line_address varchar(50),
    contact_person varchar(20)
);

CREATE TABLE AirPhones (
    airline_id bigint not null,
    airline_phone bigint not null,
    PRIMARY KEY (airline_id, airline_phone),
    FOREIGN KEY (airline_id) REFERENCES Airline(id)
);

CREATE TABLE Transactions (
    id bigint PRIMARY KEY,
    descreption varchar(50),
    trdate date default getdate() not null,
    amount bigint not null,
    airline_id bigint not null,
    FOREIGN KEY (airline_id) REFERENCES Airline(id)
);

CREATE TABLE AirCraft (
    id bigint PRIMARY KEY,
    capacity bigint not null,
    model varchar(50) not null,
    owned_by bigint not null,
    FOREIGN KEY (owned_by) REFERENCES Airline(id)
);

CREATE TABLE TripRoutes (
    id bigint PRIMARY KEY,
    distance bigint not null,
    origin varchar(20) not null,
    trp_classification varchar(20) not null,
    trp_destination varchar(20) not null
);

CREATE TABLE Trip (
    route_id bigint not null,
    aircraft_id bigint not null,
    dept_datetime datetime not null,
    arr_datetime datetime not null,
    price bigint not null,
    PRIMARY KEY (route_id, aircraft_id, dept_datetime),
    FOREIGN KEY (route_id) REFERENCES TripRoutes(id),
    FOREIGN KEY (aircraft_id) REFERENCES AirCraft(id)
);

CREATE TABLE Crew (
    crew_id bigint not null,
    aircraft_id bigint not null,
    main_pilot_id bigint not null,
    assistant_pilot_id bigint not null,
    hostess1_id bigint not null,
    hostess2_id bigint not null,
    PRIMARY KEY (crew_id, aircraft_id),
    FOREIGN KEY (aircraft_id) REFERENCES AirCraft(id),
    FOREIGN KEY (main_pilot_id) REFERENCES EMPLOYEE(id),
    FOREIGN KEY (assistant_pilot_id) REFERENCES EMPLOYEE(id),
    FOREIGN KEY (hostess1_id) REFERENCES EMPLOYEE(id),
    FOREIGN KEY (hostess2_id) REFERENCES EMPLOYEE(id)
);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT employerairline
FOREIGN KEY (employer_airline) REFERENCES Airline(id);
```

------------------------------------------------------------------------

## 🧠 Notes

-   Built for **Microsoft SQL Server**.
-   Relationships follow the ERD shown above.
-   Make sure to run the script in the **master** context or create the
    database `AirLineDB` first.

``` sql
CREATE DATABASE AirLineDB;
GO
USE AirLineDB;
```

------------------------------------------------------------------------

## 📸 Files Included

  File              Description
  ----------------- -----------------------------
  `ERD.png`         Entity-Relationship Diagram
  `Schema.png`      Logical schema diagram
  `AirlineDB.sql`   Full SQL creation script

------------------------------------------------------------------------

## 🧑‍💻 Author

**Anas Abd El-Aziz**\
Course: Database Systems\
University Project --- Airline Management Database

------------------------------------------------------------------------
