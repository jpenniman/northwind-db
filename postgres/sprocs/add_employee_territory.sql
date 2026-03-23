CREATE OR REPLACE FUNCTION add_employee_territory(
    IN employee_id integer,
    IN territory_id varchar(20)
) AS $$
BEGIN
    INSERT INTO employee_territories (employee_id, territory_id)
    VALUES (employee_id, territory_id);
END;
$$ LANGUAGE plpgsql;