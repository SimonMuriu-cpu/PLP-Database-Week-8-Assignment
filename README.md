# Project Title: Clinical Booking System

# Building a Complete Database Management System (MySQL Only)
This project implements a relational database and a FastAPI-based CRUD API for managing a clinic's patient appointments, doctor records, and prescriptions.

🔧 Project Overview
The Clinic Booking System is designed to streamline core administrative operations of a healthcare facility by managing:

Doctors and their specializations

Patient records

Appointments between patients and doctors

Prescriptions issued during appointments

🗃️ Database Schema (MySQL)
The MySQL database consists of the following tables:

Specialization – Stores unique doctor specializations (e.g., cardiology, dermatology).

Doctor – Contains doctor profiles and links them to their specialization.

Patient – Holds patient personal and contact information.

Appointment – Registers scheduled visits, linking doctors and patients.

Prescription – Records medications prescribed during appointments.


The schema ensures data integrity using primary keys, foreign keys, and constraints such as NOT NULL and UNIQUE.

🌐 FastAPI CRUD API
The FastAPI application connects to the MySQL database and provides RESTful endpoints for:

Creating and retrieving patient appointments

Updating and deleting medical records

Managing doctors, patients, and prescriptions programmatically

The API enables seamless integration with front-end systems or mobile apps to build a full-featured clinic management platform.

🚀 Technologies Used
FastAPI – High-performance Python framework for building APIs

MySQL – Relational database for persistent storage

Pydantic – Data validation and serialization

MySQL Connector – Python driver for MySQL

# FastAPI CRUD API boilerplate:
    - POST /tasks – Create a task
    - GET /tasks – Read all tasks

    - GET /tasks/{task_id} – Read one task

    - PUT /tasks/{task_id} – Update a task

    - DELETE /tasks/{task_id} – Delete a task
 

