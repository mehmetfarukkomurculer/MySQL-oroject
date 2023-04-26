SELECT countries_name, iso_code, avg_gdp, range_of_change_in_gdp, max_gdp
FROM high_gdp_avg
EXCEPT
SELECT C.countries_name, G.iso_code, AVG(G.gdp), MAX(G.gdp) - MIN(G.gdp), MAX(G.gdp)
FROM gdp G, countries C, avg_fossil_fuel_consumption_of_countries F
WHERE G.iso_code = C.iso_code AND G.iso_code = F.iso_code
  AND F.avg_fossil_fuel_consumption > (SELECT AVG(avg_fossil_fuel_consumption) FROM avg_fossil_fuel_consumption_of_countries)
GROUP BY G.iso_code
HAVING AVG(G.gdp) > (SELECT AVG(G_temp.gdp) FROM gdp G_temp);