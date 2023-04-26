CREATE VIEW avg_fossil_fuel_consumption_of_countries AS
SELECT iso_code, AVG(fossil_fuel_consumption) AS avg_fossil_fuel_consumption
FROM annual_consumption1
GROUP BY iso_code
HAVING AVG(fossil_fuel_consumption) IS NOT NULL
ORDER BY avg_fossil_fuel_consumption ASC;