USE share_consumption_db;

CREATE VIEW high_renewable_consumption(country_name, iso_code, avg_renewable_perc, range_of_change_in_consumption)
AS SELECT C.country_name , S.iso_code, AVG(S.renewables_percentage), MAX(S.renewables_percentage) - MIN(S.renewables_percentage) 
FROM share_of_consumption S, countries C
WHERE S.iso_code = C.iso_code 
GROUP BY S.iso_code
HAVING AVG(S.renewables_percentage) > (SELECT 
	AVG(S_temp.renewables_percentage)
	FROM share_of_consumption S_temp
);

CREATE VIEW high_fossil_consumption(country_name, iso_code, avg_fossil_perc, range_of_change_in_consumption)
AS SELECT C.country_name , S.iso_code, AVG(S.fossil_fuels_percentage), MAX(S.fossil_fuels_percentage) - MIN(S.fossil_fuels_percentage) 
FROM share_of_consumption S, countries C
WHERE S.iso_code = C.iso_code 
GROUP BY S.iso_code
HAVING AVG(S.fossil_fuels_percentage) > (SELECT 
	AVG(S_temp.fossil_fuels_percentage)
	AND COUNT(*) > 5					 
	FROM share_of_consumption S_temp
);

CREATE VIEW high_gdp_avg(country_name, iso_code, avg_gdp, range_of_change_in_gdp , max_gdp)
AS SELECT C.country_name, G.iso_code, AVG(G.gdp),  MAX(G.gdp) - MIN(G.gdp), MAX(G.gdp)
FROM gdp G, countries C
WHERE G.iso_code = C.iso_code 
GROUP BY G.iso_code
HAVING AVG(G.gdp) > (SELECT
	AVG(G_temp.gdp) 
	FROM gdp G_temp
);
