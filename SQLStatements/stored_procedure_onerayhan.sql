DELIMITER //

CREATE PROCEDURE get_country_data(iso_code_to_retrieve VARCHAR(10))
BEGIN
    ##get the countries details
    SELECT
    (SELECT C.country_name 
    FROM countries C
    WHERE C.iso_code = iso_code_to_retrieve) AS country_name,
    (SELECT AVG(G.gdp)
    FROM gdp G
    WHERE G.iso_code = iso_code_to_retrieve) AS avg_gdp,
    (SELECT AVG(S.renewables_percentage) 
    FROM share_of_consumption S
    WHERE S.iso_code = iso_code_to_retrieve) AS average_percentage_of_consumption_from_renewables,
    (SELECT MAX(S.renewables_percentage)
    FROM share_of_consumption S
    WHERE S.iso_code = iso_code_to_retrieve) AS max_percentage_of_consumption_from_renewables;
END;

