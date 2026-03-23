CREATE OR REPLACE FUNCTION delete_order_detail(
    IN p_order_id integer, 
    IN p_product_id integer
) AS $$
BEGIN
    DELETE FROM order_details 
    WHERE order_id = p_order_id AND product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;