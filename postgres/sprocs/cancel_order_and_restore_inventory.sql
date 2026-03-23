CREATE OR REPLACE FUNCTION cancel_order_and_restore_inventory(
    IN p_order_id integer,
    OUT p_success boolean,
    OUT p_error_message varchar(500)
) AS $$
BEGIN
    p_success := false;
    p_error_message := '';
    
    IF NOT EXISTS (SELECT 1 FROM orders WHERE order_id = p_order_id) THEN
        p_error_message := 'Order does not exist';
        RETURN;
    END IF;
    
    IF EXISTS (SELECT 1 FROM orders WHERE order_id = p_order_id AND shipped_date IS NOT NULL) THEN
        p_error_message := 'Cannot cancel shipped order';
        RETURN;
    END IF;
    
    UPDATE products
    SET units_in_stock = units_in_stock + od.quantity
    FROM products p
    JOIN order_details od ON p.product_id = od.product_id
    WHERE od.order_id = p_order_id;
    
    DELETE FROM order_details WHERE order_id = p_order_id;
    DELETE FROM orders WHERE order_id = p_order_id;
    
    p_success := true;
END;
$$ LANGUAGE plpgsql;