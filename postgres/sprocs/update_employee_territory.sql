CREATE OR REPLACE FUNCTION update_employee_territory(
    IN p_employee_id integer,
    IN p_territory_id varchar(20)
) AS $$
BEGIN
    UPDATE employee_territories
    SET employee_id = p_employee_id,
        territory_id = p_territory_id
    WHERE employee_id = p_employee_id AND territory_id = p_territory_id;
END;
$$ LANGUAGE plpgsql;