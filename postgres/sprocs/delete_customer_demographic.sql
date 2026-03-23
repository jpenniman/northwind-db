CREATE OR REPLACE FUNCTION delete_customer_demographic(IN p_customer_type_id char(10)) AS $$
BEGIN
    DELETE FROM customer_demographics WHERE customer_type_id = p_customer_type_id;
END;
$$ LANGUAGE plpgsql;