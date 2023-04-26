SELECT h.countries_name, h.iso_code, h.avg_gdp, h.range_of_change_in_gdp, h.max_gdp
FROM high_gdp_avg h
LEFT OUTER JOIN avg_fossil_fuel_consumption_of_countries a
ON h.iso_code = a.iso_code
GROUP BY h.iso_code
HAVING AVG(a.avg_fossil_fuel_consumption) < (SELECT AVG(avg_fossil_fuel_consumption) FROM avg_fossil_fuel_consumption_of_countries);