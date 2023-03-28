LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/annualConsumption20.csv' INTO TABLE annual_consumption1
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;