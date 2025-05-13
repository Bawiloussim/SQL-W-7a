-- Create the database
CREATE DATABASE IF NOT EXISTS ClinicDB;
USE ClinicDB;

-- Specialties table
CREATE TABLE Specialties (
    SpecialtyID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE
);

-- Doctors table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    SpecialtyID INT NOT NULL,
    FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
);

-- Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(150) UNIQUE,
    Phone VARCHAR(20)
);

-- Appointments table (M-M between Doctors and Patients)
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(255),
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Treatments table (1-1 with Appointments)
CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT UNIQUE NOT NULL,
    Diagnosis TEXT NOT NULL,
    Notes TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Prescriptions table (1-M from Treatments)
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentID INT NOT NULL,
    MedicineName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    DurationDays INT,
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);
-- Inserting data into Specialties table
INSERT INTO Specialties (Name) VALUES
('Cardiology'),
('Orthopedics'),
('Pediatrics'),
('Neurology'),
('Dermatology');

-- Inserting data into Doctors table
INSERT INTO Doctors (FirstName, LastName, Email, Phone, SpecialtyID) VALUES
('John', 'Doe', 'johndoe@example.com', '123-456-7890', 1),
('Jane', 'Smith', 'janesmith@example.com', '234-567-8901', 2),
('Emily', 'Clark', 'emilyclark@example.com', '345-678-9012', 3),
('Michael', 'Johnson', 'michaeljohnson@example.com', '456-789-0123', 4),
('Sarah', 'Davis', 'sarahdavis@example.com', '567-890-1234', 5);

-- Inserting data into Patients table
INSERT INTO Patients (FirstName, LastName, BirthDate, Gender, Email, Phone) VALUES
('Alice', 'Brown', '1990-05-14', 'Female', 'alicebrown@example.com', '678-901-2345'),
('Bob', 'Green', '1985-08-22', 'Male', 'bobgreen@example.com', '789-012-3456'),
('Charlie', 'White', '2000-01-30', 'Male', 'charliewhite@example.com', '890-123-4567'),
('Diana', 'Blue', '1978-12-03', 'Female', 'dianablue@example.com', '901-234-5678');

-- Inserting data into Appointments table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason, Status) VALUES
(1, 1, '2025-05-15 09:00:00', 'Heart check-up', 'Scheduled'),
(2, 2, '2025-05-16 10:30:00', 'Knee pain', 'Scheduled'),
(3, 3, '2025-05-17 11:00:00', 'Routine check-up', 'Scheduled'),
(4, 4, '2025-05-18 14:00:00', 'Headache', 'Scheduled');

-- Inserting data into Treatments table
INSERT INTO Treatments (AppointmentID, Diagnosis, Notes) VALUES
(1, 'Hypertension', 'Patient should monitor blood pressure regularly'),
(2, 'Osteoarthritis', 'Recommend physiotherapy for knee joint pain'),
(3, 'Normal check-up', 'No major issues found, follow-up in 6 months'),
(4, 'Migraine', 'Prescribe pain relievers and avoid stress');

-- Inserting data into Prescriptions table
INSERT INTO Prescriptions (TreatmentID, MedicineName, Dosage, Frequency, DurationDays) VALUES
(1, 'Atenolol', '50mg', 'Once daily', 30),
(2, 'Ibuprofen', '200mg', 'Twice daily', 15),
(4, 'Sumatriptan', '25mg', 'As needed', 10);


-- List all appointments

SELECT * FROM Appointments;

-- Find patients with treatments
SELECT p.FirstName, p.LastName, t.Diagnosis
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Treatments t ON a.AppointmentID = t.AppointmentID;

-- Find prescriptions for a treatment 

SELECT m.MedicineName, m.Dosage, m.Frequency
FROM Prescriptions m
JOIN Treatments t ON m.TreatmentID = t.TreatmentID
WHERE t.Diagnosis = 'Hypertension';
