Here’s a **README.md** for your Hospital Management Database project:

---

# 🏥 Hospital Management Database (HospitalDB)

This project provides a **MySQL-based Hospital Management Database** with tables for Patients, Doctors, Treatment Plans, Bills, and Assignments. It also includes example data and queries for doctors and hospital managers to efficiently retrieve patient information, bills, and treatment details.

---

## 📂 Features

✅ **Patient Management** – Store patient details including contact and demographics.
✅ **Doctor Management** – Maintain doctor information with specialties.
✅ **Treatment Plans** – Define treatment programs and timelines.
✅ **Billing System** – Track payments, due dates, and amounts.
✅ **Assignments** – Link patients with doctors and treatment plans.
✅ **Search Queries** – Pre-built SQL queries for doctors and managers to find patient details.

---

## 📂 Database Schema

### 1️⃣ **Patient Table**

* Stores personal and contact details for patients.

### 2️⃣ **Doctor Table**

* Maintains doctor details and specialties.

### 3️⃣ **TreatmentPlan Table**

* Holds treatment names, descriptions, and schedules.

### 4️⃣ **Bill Table**

* Tracks patient billing details with payment status.

### 5️⃣ **Assignment Table**

* Links patients with doctors and treatment plans.

---

## 🛠️ Setup Instructions

1️⃣ **Create the Database**

```sql
CREATE DATABASE HospitalDB;
USE HospitalDB;
```

2️⃣ **Run the SQL Script**

* Create all tables (Patient, Doctor, TreatmentPlan, Bill, Assignment).
* Insert sample data for testing.

3️⃣ **Execute Queries**

* Use provided SQL queries to search patients by ID.

---

## 📊 Example Queries

### 🔍 **Doctor Searching for a Patient and Their Records**

```sql
SELECT p.PatientID, p.FirstName, p.LastName, p.DateOfBirth, p.Gender, p.Address, p.PhoneNumber, p.Email,
       a.AssignmentID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, t.TreatmentName,
       t.Description, b.BillID, b.Amount, b.DateIssued, b.DueDate, b.Paid
FROM Patient p
LEFT JOIN Assignment a ON p.PatientID = a.PatientID
LEFT JOIN Doctor d ON a.DoctorID = d.DoctorID
LEFT JOIN TreatmentPlan t ON a.TreatmentID = t.TreatmentID
LEFT JOIN Bill b ON p.PatientID = b.PatientID
WHERE p.PatientID = 1;
```

### 🔍 **Hospital Manager Searching Patient Details with Bills & Treatment Plan**

```sql
SELECT p.PatientID, p.FirstName, p.LastName, p.DateOfBirth, p.Gender, p.Address, p.PhoneNumber, p.Email,
       b.BillID, b.Amount, b.DateIssued, b.DueDate, b.Paid,
       t.TreatmentName, t.Description, t.StartDate, t.EndDate,
       d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, d.Specialty
FROM Patient p
LEFT JOIN Bill b ON p.PatientID = b.PatientID
LEFT JOIN Assignment a ON p.PatientID = a.PatientID
LEFT JOIN TreatmentPlan t ON a.TreatmentID = t.TreatmentID
LEFT JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE p.PatientID = 1;
```

---

## 📦 Requirements

* MySQL 5.7+ / MariaDB
* SQL client (MySQL Workbench / CLI)

---

## 📌 Future Enhancements

🔹 Add user roles for doctors and managers with access control
🔹 Build a front-end interface to interact with the database
🔹 Integrate real-time billing and reporting

---

## 👩‍💻 Author

**Fizza Shahtaj**
📧 [fshahtaj1688@monroeu.edu](mailto:fshahtaj1688@monroeu.edu)
🔗 [LinkedIn](https://www.linkedin.com/in/fizza-s-4ba95a19a)

