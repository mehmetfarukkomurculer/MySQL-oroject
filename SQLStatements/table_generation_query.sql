
CREATE TABLE `generation`.`countries` (
iso_code VARCHAR(10) NOT NULL,
country_name VARCHAR(50),
population BIGINT UNSIGNED,
mean_age REAL,
PRIMARY KEY (iso_code)
);

CREATE TABLE `generation`.`has_annual_generation` (
iso_code VARCHAR(10),
date_y INTEGER NOT NULL,
generation_fossil REAL,
generation_renewables REAL,
generation_total REAL,
PRIMARY KEY (iso_code, date_y),
FOREIGN KEY (iso_code) REFERENCES countries(iso_code) ON DELETE CASCADE
);


