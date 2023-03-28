

CREATE DATABASE ShareOfEnergyGeneration;
USE ShareOfEnergyGeneration;

CREATE TABLE Countries(
	iso_code VARCHAR(20) NOT NULL,
    cnt_name VARCHAR(40),
    population BIGINT UNSIGNED,
    med_age REAL,
    PRIMARY KEY (iso_code)
);

CREATE TABLE Generation(
	iso_code VARCHAR(20) NOT NULL,
    log_year INT,
    renew REAL,
    fossil REAL,
    PRIMARY KEY (iso_code, log_year),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);