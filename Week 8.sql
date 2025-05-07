-- Question 1: Creating a database management system - Clinic Booking System Schema

-- Create database
-- Create database ClinicBookingSystem;
-- use ClinicBookingSystem;

-- Specialization Table
CREATE TABLE Specialization (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Doctors Table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specialization(specialization_id)
);


-- Patients Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(20) UNIQUE NOT NULL
);

-- Appointments Table
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Prescription Table
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT UNIQUE,
    medication TEXT NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- Task Manager Schema

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Task (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);