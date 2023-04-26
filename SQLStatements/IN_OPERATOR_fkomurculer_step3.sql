SELECT h.countries_name 
FROM high_gdp_avg h 
WHERE h.iso_code IN (
    SELECT f.iso_code 
    FROM avg_fossil_fuel_consumption_of_countries f 
    GROUP BY f.iso_code 
    HAVING AVG(f.avg_fossil_fuel_consumption) < (
        SELECT AVG(f2.avg_fossil_fuel_consumption) 
        FROM avg_fossil_fuel_consumption_of_countries f2
    )
);


