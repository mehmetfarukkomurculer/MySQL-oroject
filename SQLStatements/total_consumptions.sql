

CREATE VIEW total_consumptions(iso_code, total_renew, total_fossil)
AS SELECT C.iso_code, SUM(A.renewable_consumption), SUM(A.fossil_fuel_consumption)
FROM Countries2 C, annual_consumption1 A
WHERE C.iso_code = A.iso_code
GROUP BY C.iso_code, A.annual_consumption_year
HAVING MIN(A.annual_consumption_year) > 
(
	SELECT MIN(A2.annual_consumption_year)
	FROM annual_consumption1 A2
    WHERE A2.iso_code = C.iso_code
);