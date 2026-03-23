CREATE OR REPLACE FUNCTION update_customer_customer_demo(
    IN p_customer_id char(5),
    IN p_customer_type_id char(10)
) AS $$
BEGIN
    UPDATE customer_customer_demo
    SET customer_id = p_customer_id,
        customer_type_id = p_customer_type_id
    WHERE customer_id = p_customer_id AND customer_type_id = p_customer_type_id;
END;
$$ LANGUAGE plpgsql;