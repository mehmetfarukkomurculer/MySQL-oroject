USE share_consumption_db;

CREATE TABLE gdp (
iso_code VARCHAR(10) NOT NULL,
year_of_data INTEGER NOT NULL,
gdp BIGINT UNSIGNED,
PRIMARY KEY (iso_code, year_of_data),
FOREIGN KEY(iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

