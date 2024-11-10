-- Location Table
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    coordinates VARCHAR(255) NOT NULL
);
-- Difficulty Table
CREATE TABLE difficulties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);
-- Trail Table
CREATE TABLE trails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    length DOUBLE NOT NULL,
    elevation DOUBLE NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    location_id INT,
    difficulty_id INT,
    
    FOREIGN KEY (location_id) REFERENCES locations(id)
);
-- User Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) UNIQUE,
    email VARCHAR(40) UNIQUE,
    password VARCHAR(64) NOT NULL,
    profile_type ENUM('noob', 'regular', 'pro') NOT NULL
);
-- Review Table
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    trail_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    date_posted DATE NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id)
);
-- Rating Table
CREATE TABLE ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    score DECIMAL(3, 1) NOT NULL,
    user_id INT,
    trail_id INT,
    difficulty_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id),
    FOREIGN KEY (difficulty_id) REFERENCES difficulties(id)
);
