-- HostelSetu Master Database Schema
-- Built for WebCraft 24 | GLBIM Hackathon 5.0 (Team 237 - Resence)
-- Database: hostelsetu_db

CREATE DATABASE IF NOT EXISTS hostelsetu_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE hostelsetu_db;

-- 1. Users Table (Authentication & Role Separation)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'owner', 'admin') NOT NULL DEFAULT 'student',
    phone VARCHAR(20) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Properties / Hostels / PGs Table
CREATE TABLE IF NOT EXISTS properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255) NOT NULL,
    distance_meters INT NOT NULL DEFAULT 500,
    walking_minutes INT NOT NULL DEFAULT 7,
    monthly_rent DECIMAL(10,2) NOT NULL DEFAULT 8500.00,
    room_type ENUM('Single', 'Double', 'Triple') NOT NULL DEFAULT 'Double',
    total_beds INT NOT NULL DEFAULT 20,
    available_beds INT NOT NULL DEFAULT 5,
    trust_score INT NOT NULL DEFAULT 85,
    status ENUM('pending', 'verified', 'suspended') NOT NULL DEFAULT 'verified',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. 6-Point Physical Safety Audits Table
CREATE TABLE IF NOT EXISTS audits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    auditor_name VARCHAR(100) NOT NULL DEFAULT 'Inspector R. Sharma',
    cctv_gate TINYINT(1) NOT NULL DEFAULT 1,
    fire_safety TINYINT(1) NOT NULL DEFAULT 1,
    mess_hygiene TINYINT(1) NOT NULL DEFAULT 1,
    electrical_safety TINYINT(1) NOT NULL DEFAULT 1,
    police_verification TINYINT(1) NOT NULL DEFAULT 1,
    no_hidden_charges TINYINT(1) NOT NULL DEFAULT 1,
    audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    notes TEXT DEFAULT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. Student Grievance / Maintenance Tickets Table
CREATE TABLE IF NOT EXISTS grievance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    property_id INT NOT NULL,
    issue_type VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved') NOT NULL DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ========================================================
-- SEED DATA (Greater Noida / Knowledge Park II Real Scenarios)
-- ========================================================

-- Insert Demo Users
INSERT INTO users (id, name, email, password, role, phone) VALUES
(1, 'Admin Inspector', 'admin@hostelsetu.in', 'admin123', 'admin', '9876543210'),
(2, 'Ramesh Verma', 'ramesh@pgowner.com', 'owner123', 'owner', '9811223344'),
(3, 'Suresh Sharma', 'suresh@pgowner.com', 'owner123', 'owner', '9822334455'),
(4, 'Piyush Student', 'piyush@glbajaj.ac.in', 'student123', 'student', '9833445566')
ON DUPLICATE KEY UPDATE id=id;

-- Insert Seed Properties
INSERT INTO properties (id, owner_id, name, address, distance_meters, walking_minutes, monthly_rent, room_type, total_beds, available_beds, trust_score, status) VALUES
(1, 2, 'Aryan Residency PG', 'Knowledge Park II, Near GL Bajaj Gate 2, Greater Noida', 350, 5, 8500.00, 'Double', 30, 4, 94, 'verified'),
(2, 2, 'Royal Comfort Girls Hostel', 'Plot 14, Knowledge Park III, Greater Noida', 600, 8, 9500.00, 'Single', 25, 2, 91, 'verified'),
(3, 3, 'Balaji Boys Living Space', 'Near Sharda University Metro, Greater Noida', 850, 11, 7000.00, 'Triple', 40, 9, 82, 'verified'),
(4, 3, 'Krishna Residency Luxury PG', 'Opposite Bennett University Rd, Greater Noida', 1200, 16, 11000.00, 'Single', 18, 1, 88, 'verified')
ON DUPLICATE KEY UPDATE id=id;

-- Insert Seed Audits (Matching the 6-point checklist)
INSERT INTO audits (id, property_id, auditor_name, cctv_gate, fire_safety, mess_hygiene, electrical_safety, police_verification, no_hidden_charges, notes) VALUES
(1, 1, 'Chief Inspector R. Sharma', 1, 1, 1, 1, 1, 1, 'Fully compliant with 2026 Student Housing Safety Standards.'),
(2, 2, 'Senior Officer Neha Singh', 1, 1, 1, 1, 1, 1, 'Biometric entry verified. 24/7 warden present.'),
(3, 3, 'Inspector Amit Verma', 1, 1, 0, 1, 1, 0, 'Mess hygiene notice issued; minor hidden electricity surcharge reported.'),
(4, 4, 'Chief Inspector R. Sharma', 1, 1, 1, 1, 1, 1, 'Premium infrastructure. Full compliance verified.')
ON DUPLICATE KEY UPDATE id=id;

-- Insert Sample Grievance Tickets
INSERT INTO grievance_tickets (id, student_id, property_id, issue_type, description, status) VALUES
(1, 4, 1, 'Wi-Fi Connectivity', '2nd floor router has intermittent packet loss during study hours.', 'In Progress'),
(2, 4, 3, 'Hot Water Supply', 'Geyser in bathroom 3B tripping circuit breaker in morning.', 'Open')
ON DUPLICATE KEY UPDATE id=id;
