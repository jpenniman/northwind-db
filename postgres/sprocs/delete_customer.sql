CREATE OR REPLACE FUNCTION delete_customer(IN p_customer_id char(5)) AS $$
BEGIN
    DELETE FROM customers WHERE customer_id = p_customer_id;
END;
$$ LANGUAGE plpgsql;