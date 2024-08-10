-- Create the Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Create the Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('M', 'F') NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

-- Create the Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

-- Create the TreatmentPlan Table
CREATE TABLE TreatmentPlan (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentName VARCHAR(100) NOT NULL,
    Description TEXT,
    StartDate DATE NOT NULL,
    EndDate DATE
);

-- Create the Bill Table
CREATE TABLE Bill (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    Amount DECIMAL(11,2) NOT NULL,
    DateIssued DATE NOT NULL,
    DueDate DATE,
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create the Assignment Table
CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    TreatmentID INT NOT NULL,
    AssignedDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (TreatmentID) REFERENCES TreatmentPlan(TreatmentID)
);

-- Insert Data into Patient Table
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) VALUES
('Fizza', 'Shahtaj', '1996-09-24', 'F', '123 Elm Street', '123-456-7890', 'Fizza.Shahtaj@example.com'),
('Marium', 'Farooq', '1997-06-18', 'F', '456 Oak Avenue', '123-456-7891', 'Marium.Farooq@example.com'),
('Aiza', 'Shahtaj', '1993-08-16', 'F', '789 Pine Lane', '123-456-7892', 'Aiza.Shahtaj@example.com'),
('Ali', 'Abbas', '1996-04-25', 'M', '321 Maple Drive', '123-456-7893', 'Ali.Abbas@example.com'),
('Tehmina', 'Khan', '1986-06-18', 'F', '654 Cedar Road', '123-456-7894', 'Tehmina.Khan@example.com'),
('Diana', 'Clark', '1988-06-18', 'F', '987 Birch Boulevard', '123-456-7895', 'diana.clark@example.com'),
('Edward', 'Miller', '1970-07-22', 'M', '159 Spruce Circle', '123-456-7896', 'edward.miller@example.com'),
('Fiona', 'Wilson', '2000-08-05', 'F', '753 Fir Street', '123-456-7897', 'fiona.wilson@example.com'),
('George', 'Moore', '1982-09-15', 'M', '852 Walnut Way', '123-456-7898', 'george.moore@example.com'),
('Hannah', 'Taylor', '1998-10-30', 'F', '951 Aspen Plaza', '123-456-7899', 'hannah.taylor@example.com'),
('Hania', 'Khan', '2008-09-04', 'F', '40 Rdige drive', '345-678-6590', 'haniakhan@example.com');

-- Insert Data into Doctor Table
INSERT INTO Doctor (FirstName, LastName, Specialty, PhoneNumber, Email) VALUES
('Emily', 'Stone', 'Cardiology', '321-654-0987', 'emily.stone@example.com'),
('Michael', 'White', 'Neurology', '321-654-0988', 'michael.white@example.com'),
('Sarah', 'Green', 'Pediatrics', '321-654-0989', 'sarah.green@example.com');

-- Insert Data into TreatmentPlan Table
INSERT INTO TreatmentPlan (TreatmentName, Description, StartDate, EndDate) VALUES
('Cardiac Rehabilitation', 'Program to improve heart health', '2023-01-01', '2023-12-31'),
('Neurotherapy', 'Treatment for neurological conditions', '2023-02-01', '2023-12-31'),
('Child Wellness', 'Routine check-ups and immunizations', '2023-03-01', '2023-12-31');

-- Insert Data into Bill Table
INSERT INTO Bill (PatientID, Amount, DateIssued, DueDate, Paid) VALUES
(1, 500.00, '2024-01-15', '2024-02-15', FALSE),
(2, 300.00, '2024-02-20', '2024-03-20', TRUE),
(3, 450.00, '2024-03-30', '2024-04-30', FALSE),
(4, 600.00, '2024-04-25', '2024-05-25', TRUE),
(5, 200.00, '2024-05-10', '2024-06-10', FALSE),
(6, 150.00, '2024-06-15', '2024-07-15', TRUE),
(7, 400.00, '2024-07-20', '2024-08-20', FALSE),
(8, 250.00, '2024-08-25', '2024-09-25', TRUE),
(9, 350.00, '2024-09-30', '2024-10-30', FALSE),
(10, 100.00, '2024-10-05', '2024-11-05', TRUE),


-- Insert Data into Assignment Table
INSERT INTO Assignment (PatientID, DoctorID, TreatmentID, AssignedDate) VALUES
(1, 1, 1, '2024-01-01'),
(2, 2, 2, '2024-02-01'),
(3, 3, 3, '2024-03-01'),
(4, 1, 1, '2024-04-01'),
(5, 2, 2, '2024-05-01'),
(6, 3, 3, '2024-06-01'),
(7, 1, 1, '2024-07-01'),
(8, 2, 2, '2024-08-01'),
(9, 3, 3, '2024-09-01'),
(10, 1, 1, '2024-10-01'),
(11, 2, 3, '2024-15-03');

-- Query for Doctors to Search for Patients and Their Corresponding Records
SELECT p.PatientID, p.FirstName, p.LastName, p.DateOfBirth, p.Gender, p.Address, p.PhoneNumber, p.Email,
       a.AssignmentID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, t.TreatmentName,
       t.Description, b.BillID, b.Amount, b.DateIssued, b.DueDate, b.Paid
FROM Patient p
LEFT JOIN Assignment a ON p.PatientID = a.PatientID
LEFT JOIN Doctor d ON a.DoctorID = d.DoctorID
LEFT JOIN TreatmentPlan t ON a.TreatmentID = t.TreatmentID
LEFT JOIN Bill b ON p.PatientID = b.PatientID
WHERE p.PatientID = 1; -- Change the PatientID to search for other patients
-- Query for Hospital Managers to Search for Patient Details with Bills and Current Treatment Plan
SELECT p.PatientID, p.FirstName, p.LastName, p.DateOfBirth, p.Gender, p.Address, p.PhoneNumber, p.Email,
       b.BillID, b.Amount, b.DateIssued, b.DueDate, b.Paid,
       t.TreatmentName, t.Description, t.StartDate, t.EndDate,
       d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, d.Specialty
FROM Patient p
LEFT JOIN Bill b ON p.PatientID = b.PatientID
LEFT JOIN Assignment a ON p.PatientID = a.PatientID
LEFT JOIN TreatmentPlan t ON a.TreatmentID = t.TreatmentID
LEFT JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE p.PatientID = 1; -- Change the PatientID to search for other patient
