SELECT countries_name
FROM high_gdp_avg
WHERE EXISTS (
SELECT iso_code
FROM avg_fossil_fuel_consumption_of_countries
WHERE iso_code = high_gdp_avg.iso_code
GROUP BY iso_code 
HAVING AVG(avg_fossil_fuel_consumption) < (
        SELECT AVG(avg_fossil_fuel_consumption) 
        FROM avg_fossil_fuel_consumption_of_countries
    )
);