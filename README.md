Clinic Booking System SQL Database
Overview
This project implements a Clinic Booking System using MySQL to manage patients, doctors, appointments, treatments, and prescriptions. The database allows the clinic to efficiently store, retrieve, and update information related to medical appointments, patient treatments, and prescribed medications.

Tables and Structure
The database consists of several interconnected tables:

Specialties: Stores the various medical specialties available in the clinic (e.g., Cardiology, Orthopedics, etc.).

Columns:

SpecialtyID (Primary Key)

Name (Unique)

Doctors: Stores details of the doctors working at the clinic, along with their specialties.

Columns:

DoctorID (Primary Key)

FirstName (Doctor's first name)

LastName (Doctor's last name)

Email (Unique)

Phone (Doctor's phone number)

SpecialtyID (Foreign Key linking to Specialties table)

Patients: Contains information about the patients who visit the clinic.

Columns:

PatientID (Primary Key)

FirstName (Patient's first name)

LastName (Patient's last name)

BirthDate (Patient's date of birth)

Gender (Patient's gender)

Email (Unique)

Phone (Patient's phone number)

Appointments: Keeps records of patient appointments with doctors.

Columns:

AppointmentID (Primary Key)

PatientID (Foreign Key linking to Patients table)

DoctorID (Foreign Key linking to Doctors table)

AppointmentDate (Date and time of the appointment)

Reason (Reason for the appointment)

Status (Status of the appointment - Scheduled, Completed, or Cancelled)

Treatments: Stores the diagnosis and notes for each treatment given to the patient during their appointment.

Columns:

TreatmentID (Primary Key)

AppointmentID (Foreign Key linking to Appointments table)

Diagnosis (Patient's diagnosis)

Notes (Additional notes related to the treatment)

Prescriptions: Records the medications prescribed for each treatment.

Columns:

PrescriptionID (Primary Key)

TreatmentID (Foreign Key linking to Treatments table)

MedicineName (Name of the prescribed medication)

Dosage (Dosage of the medication)

Frequency (How often the medication should be taken)

DurationDays (Duration for which the medication should be taken)

SQL Code
The SQL script creates the database and its tables, establishes relationships using foreign keys, and inserts some sample data.

Create Tables:

The script starts by creating the Specialties, Doctors, Patients, Appointments, Treatments, and Prescriptions tables with the appropriate constraints (Primary Keys, Foreign Keys, Unique constraints).

Insert Sample Data:

The script then inserts some sample data into each table to simulate the functioning of a real clinic booking system.

Specialties: E.g., Cardiology, Neurology, Dermatology.

Doctors: E.g., Dr. John Doe, Dr. Jane Smith.

Patients: E.g., Alice Brown, Bob Green.

Appointments: Scheduling appointments for patients with doctors.

Treatments: Documenting diagnoses and treatment notes.

Prescriptions: Managing the medications prescribed for each treatment.

Purpose of This Database
This database is designed for managing clinic appointments and medical records. It can be used by a clinic to:

Schedule and manage doctor appointments.

Track patient medical histories, including diagnoses and treatments.

Prescribe and manage medications.
