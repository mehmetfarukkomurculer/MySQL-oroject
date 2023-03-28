CREATE TABLE countries(
code VARCHAR(20) NOT NULL,
entity VARCHAR(50),
population BIGINT UNSIGNED,
median_age REAL,
primary key(code)
);

CREATE TABLE per_capita_consumption(
code VARCHAR(20),
year INT,
fossil_fuel_per_capita REAL,
renewables_per_capita REAL,
total_consumption_per_capita REAL,
PRIMARY KEY(code, year),
FOREIGN KEY(code) REFERENCES countries(code) ON DELETE CASCADE
);