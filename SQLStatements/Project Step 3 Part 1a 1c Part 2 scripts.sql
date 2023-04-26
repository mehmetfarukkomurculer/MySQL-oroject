
/*
Returns countries that have higher annual renewable energy production compared to the global average of that year.
1A)
*/
CREATE VIEW CWHRG (c_name, iso_code, c_renewable, c_date)
	AS SELECT C.country_name, H.iso_code, AVG(H.generation_renewables), H.date_y
	FROM has_annual_generation H, countries C
    WHERE C.iso_code = H.iso_code
    GROUP BY C.iso_code, H.date_y
    HAVING AVG(H.generation_renewables) > (SELECT AVG(H2.generation_renewables) FROM has_annual_generation H2 WHERE H2.date_y = H.date_y); 
    
SELECT * FROM CWHRG;
DROP VIEW CWHRG;


/*
1B)
*/

/*
1C)
Selecting countries where annual renewable energy generation in 2022 is greater than the fossil fuel energy generation. 
*/

SELECT C.country_name
FROM countries C
WHERE C.iso_code IN (SELECT H.iso_code FROM has_annual_generation H WHERE H.generation_renewables > H.generation_fossil AND H.date_y = 2022);

/*
****************************************************************************************************************************************************
*/

SELECT C.country_name
FROM countries C
WHERE EXISTS (SELECT * 
FROM has_annual_generation H
WHERE C.iso_code = H.iso_code AND H.generation_renewables > H.generation_fossil AND H.date_y = 2022);

/*
2)
Obtaining the minimum and maximum values for date_y column in has_annual_generation table.
*/

SELECT MIN(H.date_y)
FROM has_annual_generation H;

SELECT MAX(H.date_y)
FROM has_annual_generation H;

/*
Checks if the to be insreted value is bigger (smaller) than the existing largest (smallest) value for date_y, if so gives error. 
*/

ALTER TABLE has_annual_generation ADD CONSTRAINT mmmax_mmmin_value_check CHECK (( date_y <= 2022) AND (date_y >= 1985));

/*
Out of range value insertion trial. 
*/

INSERT INTO has_annual_generation (iso_code, date_y, generation_fossil, generation_renewables, generation_total) VALUES ('DNC', 1962, 2326617,54062226, 4599339);

/*
Before insert trigger, the date_y value is modified as specified before it is inserted into the table.
*/

DELIMITER //
CREATE TRIGGER triggered_1 BEFORE INSERT ON has_annual_generation
FOR EACH ROW
BEGIN
	IF NEW.date_y > 2022 THEN
        SET NEW.date_y = 2022;
	ELSEIF NEW.date_y < 1985 THEN
        SET NEW.date_y = 1985;
END IF;
END
#DELIMITER;

/*
Before update trigger, the date_y value is modified as specified before it is updated on the table.
*/

DELIMITER //
CREATE TRIGGER triggered_2 BEFORE UPDATE ON has_annual_generation
FOR EACH ROW
BEGIN
	IF NEW.date_y > 2022 THEN
        SET NEW.date_y = 2022;
	ELSEIF NEW.date_y < 1985 THEN
        SET NEW.date_y = 1985;
END IF;
END
#DELIMITER
