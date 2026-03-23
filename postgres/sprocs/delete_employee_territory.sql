CREATE OR REPLACE FUNCTION delete_employee_territory(
    IN p_employee_id integer,
    IN p_territory_id varchar(20)
) AS $$
BEGIN
    DELETE FROM employee_territories 
    WHERE employee_id = p_employee_id AND territory_id = p_territory_id;
END;
$$ LANGUAGE plpgsql;