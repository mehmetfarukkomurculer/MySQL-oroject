
CREATE DATABASE share_consumption_db;
USE share_consumption_db;

CREATE TABLE Countries (
iso_code VARCHAR(10) NOT NULL,
country_name VARCHAR(50),
population BIGINT UNSIGNED,
median_age REAL,
PRIMARY KEY (iso_code)
);

CREATE TABLE Share_of_Consumption(
iso_code VARCHAR(10),
year_of_data INTEGER NOT NULL,
renewables_percentage REAL,
fossil_fuels_percentage REAL,
PRIMARY KEY (iso_code, year_of_data),
FOREIGN KEY(iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);