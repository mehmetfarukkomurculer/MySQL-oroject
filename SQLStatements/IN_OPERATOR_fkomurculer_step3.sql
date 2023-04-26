SELECT countries_name 
FROM high_gdp_avg 
WHERE iso_code IN (
    SELECT iso_code 
    FROM avg_fossil_fuel_consumption_of_countries 
    GROUP BY iso_code 
    HAVING AVG(avg_fossil_fuel_consumption) < (
        SELECT AVG(avg_fossil_fuel_consumption) 
        FROM avg_fossil_fuel_consumption_of_countries
    )
);



