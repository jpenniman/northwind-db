CREATE OR REPLACE FUNCTION delete_customer_customer_demo(
    IN p_customer_id char(5),
    IN p_customer_type_id char(10)
) AS $$
BEGIN
    DELETE FROM customer_customer_demo 
    WHERE customer_id = p_customer_id AND customer_type_id = p_customer_type_id;
END;
$$ LANGUAGE plpgsql;