CREATE TABLE annual_consumption1 (
iso_code Varchar(10),
annual_consumption_year INT,
total_energy_consumption REAL,
renewable_consumption REAL,
fossil_fuel_consumption REAL,
PRIMARY KEY (iso_code, annual_consumption_year),
FOREIGN KEY (iso_code) REFERENCES countries(iso_code) ON DELETE CASCADE
);







