SELECT C.entity
FROM countries C
WHERE C.code IN (SELECT P.code FROM per_capita_consumption P WHERE P.renewables_per_capita < P.fossil_fuel_per_capita AND P.year = 2016);

SELECT C.entity
FROM countries C
WHERE EXISTS (SELECT * 
FROM per_capita_consumption P
WHERE C.code = P.code AND P.renewables_per_capita < P.fossil_fuel_per_capita AND P.year = 2016);
