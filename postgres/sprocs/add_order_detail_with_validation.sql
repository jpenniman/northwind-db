CREATE OR REPLACE FUNCTION add_order_detail_with_validation(
    IN p_order_id integer,
    IN p_product_id integer,
    IN p_unit_price numeric(19,4),
    IN p_quantity smallint,
    IN p_discount real,
    OUT p_error_message varchar(500),
    OUT p_success boolean
) AS $$
DECLARE
    v_units_in_stock smallint;
BEGIN
    p_error_message := '';
    p_success := false;
    
    IF NOT EXISTS (SELECT 1 FROM orders WHERE order_id = p_order_id) THEN
        p_error_message := 'Order does not exist';
        RETURN;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM products WHERE product_id = p_product_id) THEN
        p_error_message := 'Product does not exist';
        RETURN;
    END IF;
    
    SELECT units_in_stock INTO v_units_in_stock FROM products WHERE product_id = p_product_id;
    
    IF v_units_in_stock < p_quantity THEN
        p_error_message := 'Insufficient inventory. Available: ' || v_units_in_stock::varchar(10);
        RETURN;
    END IF;
    
    IF p_unit_price < 0 THEN
        p_error_message := 'Unit price cannot be negative';
        RETURN;
    END IF;
    
    IF p_quantity <= 0 THEN
        p_error_message := 'Quantity must be greater than zero';
        RETURN;
    END IF;
    
    IF p_discount < 0 OR p_discount > 1 THEN
        p_error_message := 'Discount must be between 0 and 1';
        RETURN;
    END IF;
    
    INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
    VALUES (p_order_id, p_product_id, p_unit_price, p_quantity, p_discount);
    
    UPDATE products SET units_in_stock = units_in_stock - p_quantity WHERE product_id = p_product_id;
    
    p_success := true;
END;
$$ LANGUAGE plpgsql;