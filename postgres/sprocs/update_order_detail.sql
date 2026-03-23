CREATE OR REPLACE FUNCTION update_order_detail(
    IN p_order_id integer,
    IN p_product_id integer,
    IN p_unit_price numeric(19,4),
    IN p_quantity smallint,
    IN p_discount real
) AS $$
BEGIN
    UPDATE order_details
    SET unit_price = p_unit_price,
        quantity = p_quantity,
        discount = p_discount
    WHERE order_id = p_order_id AND product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;