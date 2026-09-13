-- StudySync AI Database Schema

-- Create database
CREATE DATABASE IF NOT EXISTS StudySync_AI;

-- Select database
USE StudySync_AI;


-- ==========================================
-- 1. USERS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    branch VARCHAR(50),
    semester INT
);


-- ==========================================
-- 2. SUBJECTS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    difficulty INT NOT NULL,
    exam_date DATE,
    credits INT,

    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);


-- ==========================================
-- 3. TOPICS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS topics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    difficulty INT NOT NULL,
    estimated_hours FLOAT NOT NULL,
    completed BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE CASCADE
);


-- ==========================================
-- 4. STUDY SCHEDULE TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS study_schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT NOT NULL,
    date DATE NOT NULL,
    start_time TIME,
    duration FLOAT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',

    FOREIGN KEY (topic_id)
        REFERENCES topics(id)
        ON DELETE CASCADE
);


-- ==========================================
-- 5. STUDY SESSIONS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS study_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    subject_id INT NOT NULL,
    date DATE NOT NULL,
    duration FLOAT NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE CASCADE
);