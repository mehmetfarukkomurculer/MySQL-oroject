
CREATE TABLE Generation(
	iso_code VARCHAR(20) NOT NULL,
    log_year INT,
    renew REAL,
    fossil REAL,
    PRIMARY KEY (iso_code, log_year),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);