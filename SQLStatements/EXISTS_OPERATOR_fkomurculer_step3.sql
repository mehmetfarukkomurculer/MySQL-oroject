SELECT h.countries_name
FROM high_gdp_avg h
WHERE EXISTS (
    SELECT f.iso_code
    FROM avg_fossil_fuel_consumption_of_countries f
    WHERE f.iso_code = h.iso_code
    GROUP BY f.iso_code 
    HAVING AVG(f.avg_fossil_fuel_consumption) < (
        SELECT AVG(f2.avg_fossil_fuel_consumption) 
        FROM avg_fossil_fuel_consumption_of_countries f2
    )
);
