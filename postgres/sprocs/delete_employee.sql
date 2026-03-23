CREATE OR REPLACE FUNCTION delete_employee(IN p_employee_id integer) AS $$
BEGIN
    DELETE FROM employees WHERE employee_id = p_employee_id;
END;
$$ LANGUAGE plpgsql;