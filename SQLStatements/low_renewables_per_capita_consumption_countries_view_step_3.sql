CREATE VIEW low_renewables_per_capita_countries AS
SELECT c.code, p.year, AVG(p.renewables_per_capita) AS avg_renewables_per_capita
FROM countries c, per_capita_consumption p
WHERE c.code = p.code
GROUP BY c.code, p.year
HAVING AVG(p.renewables_per_capita) < (
    SELECT AVG(p2.renewables_per_capita)
    FROM per_capita_consumption p2
    WHERE p2.year = p.year
);
