
##This one uses not ın operator to get the countires which do not place in top when using renewable energy
SELECT HG.iso_code
FROM high_gdp_avg HG
WHERE HG.iso_code NOT IN(SELECT HR.iso_code
	FROM high_renewable_consumption HR); 
##uses a left join with the high renewable consumption
##table and then filters the results where the iso_code is null in high renewwable consumption.
SELECT HG.iso_code
FROM high_gdp_avg HG
LEFT JOIN high_renewable_consumption HR ON HG.iso_code = HR.iso_code
WHERE HR.iso_code IS NULL;