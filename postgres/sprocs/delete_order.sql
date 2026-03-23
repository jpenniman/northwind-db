CREATE OR REPLACE FUNCTION delete_order(IN p_order_id integer) AS $$
BEGIN
    DELETE FROM order_details WHERE order_id = p_order_id;
    DELETE FROM orders WHERE order_id = p_order_id;
END;
$$ LANGUAGE plpgsql;