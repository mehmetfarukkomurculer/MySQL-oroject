
SET SQL_SAFE_UPDATES = 0;

DELETE FROM annual_consumption1
WHERE annual_consumption_year < (
SELECT MAX(min_date)
FROM (SELECT MIN(annual_consumption_year) AS min_date
	FROM annual_consumption1
    GROUP BY annual_consumption1.iso_code
) AS t
);

CREATE VIEW total_consumptions(iso_code, total_renew, total_fossil)
AS SELECT C.iso_code, SUM(A.renewable_consumption), SUM(A.fossil_fuel_consumption)
FROM Countries2 C, annual_consumption1 A
WHERE C.iso_code = A.iso_code
GROUP BY C.iso_code