CREATE OR REPLACE FUNCTION update_customer_demographic(
    IN p_customer_type_id char(10),
    IN p_customer_desc text
) AS $$
BEGIN
    UPDATE customer_demographics
    SET customer_desc = p_customer_desc
    WHERE customer_type_id = p_customer_type_id;
END;
$$ LANGUAGE plpgsql;