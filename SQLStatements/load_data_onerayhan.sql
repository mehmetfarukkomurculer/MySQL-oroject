
USE share_consumption_db;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/countries_2.csv' INTO TABLE Countries 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@country_name, @iso_code, @population, @median_age) 
SET country_name = @country_name, iso_code = @iso_code, population = @population, median_age = @median_age;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/share_of_energy_consumption_5.csv' INTO TABLE Share_of_Consumption 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;