
# Hospital Management Database System

Table of Contents

1. [Introduction](#introduction)
2. [Objectives](#objectives)
3. [System Requirements](#system-requirements)
4. [Database Design](#database-design)
   - [Entity-Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
   - [Tables and Relationships](#tables-and-relationships)
5. [Implementation](#implementation)
   - [Setting up the Database](#setting-up-the-database)
   - [Inserting Data](#inserting-data)
6. [Functionalities](#functionalities)
   - [Doctor's Search Functionality](#doctors-search-functionality)
   - [Hospital Manager's Search Functionality](#hospital-managers-search-functionality)
7. [Testing](#testing)
8. [Conclusion](#conclusion)

Introduction

The **Hospital Management System (HMS)** is a database system designed to automate the management of hospital operations. It provides an efficient way for doctors to access patient records and for hospital managers to manage patient details, billing, treatment plans, and doctor assignments.

 ## Objectives

- Develop a functional database system for hospital management.
- Enable doctors to search for patients and view their medical records.
- Allow hospital managers to manage patient details, including bills, treatment plans, and assigned doctors.

## System Requirements

### Software
- MySQL Server
- MySQL Workbench

### Hardware
- A computer with at least **4 GB RAM**
- Stable internet connection for setting up and accessing the database

## Database Design

### Entity-Relationship Diagram (ERD)

The ERD illustrates the relationships between entities in the HMS database, including **Doctor**, **Patient**, **TreatmentPlan**, **Bill**, and **Assignment**.

### Tables and Relationships

- **Doctor Table**: Stores information about doctors.
- **Patient Table**: Stores patient details.
- **TreatmentPlan Table**: Contains information about treatment plans.
- **Bill Table**: Records billing information.
- **Assignment Table**: Manages the relationships between patients, doctors, and treatment plans.

## Implementation

### Setting up the Database

1. Install **MySQL Server** and **MySQL Workbench**.
2. Create a new database named `HospitalDB`.

### Inserting Data

Populate the database tables with sample data to test the system's functionalities.

## Functionalities

### Doctor's Search Functionality

- Allows doctors to search for patients and view their medical records.

### Hospital Manager's Search Functionality

- Enables hospital managers to view comprehensive patient details, including bills, treatment plans, and assigned doctors.

## Testing

Test the system by executing queries to validate that all functionalities work as expected. Ensure the following:

1. The doctor's search functionality returns correct patient details.
2. The hospital manager's search functionality provides accurate patient information, including billing and treatment details.

## Conclusion

This project successfully implements a Hospital Management System that facilitates efficient data management, enabling doctors and hospital managers to access and manage patient information effectively.
