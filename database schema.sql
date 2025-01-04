-- Create the database
CREATE DATABASE IF NOT EXISTS painting_gallery;
USE painting_gallery;

-- Table: artist
CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    middle_names VARCHAR(255),
    last_name VARCHAR(100),
    nationality VARCHAR(100),
    style VARCHAR(100),
    birth YEAR,
    death YEAR
);

-- Table: museum_hours
CREATE TABLE museum_hours (
    museum_id INT,
    day VARCHAR(20) NOT NULL,
    open TIME,
    close TIME,
    PRIMARY KEY (museum_id, day),
    FOREIGN KEY (museum_id) REFERENCES museum(museum_id) ON DELETE CASCADE
);

-- Table: canvas_size
CREATE TABLE canvas_size (
    size_id INT PRIMARY KEY,
    width DECIMAL(5,2),
    height DECIMAL(5,2),
    label VARCHAR(255)
);

-- Table: image_link
CREATE TABLE image_link (
    work_id INT PRIMARY KEY,
    url TEXT,
    thumbnail_small_url TEXT,
    thumbnail_large_url TEXT,
    FOREIGN KEY (work_id) REFERENCES work(work_id) ON DELETE CASCADE
);

-- Table: subject
CREATE TABLE subject (
    work_id INT,
    subject VARCHAR(255),
    PRIMARY KEY (work_id),
    FOREIGN KEY (work_id) REFERENCES work(work_id) ON DELETE CASCADE
);

-- Table: product_size
CREATE TABLE product_size (
    work_id INT,
    size_id INT,
    sale_price DECIMAL(10, 2),
    regular_price DECIMAL(10, 2),
    PRIMARY KEY (work_id, size_id),
    FOREIGN KEY (work_id) REFERENCES work(work_id) ON DELETE CASCADE,
    FOREIGN KEY (size_id) REFERENCES canvas_size(size_id) ON DELETE CASCADE
);

-- Table: work
CREATE TABLE work (
    work_id INT PRIMARY KEY,
    name VARCHAR(255),
    artist_id INT,
    style VARCHAR(100),
    museum_id INT,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (museum_id) REFERENCES museum(museum_id) ON DELETE CASCADE
);

-- Table: museum
CREATE TABLE museum (
    museum_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(20),
    url VARCHAR(255)
);