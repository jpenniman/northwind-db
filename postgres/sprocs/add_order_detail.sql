CREATE OR REPLACE FUNCTION add_order_detail(
    IN order_id integer,
    IN product_id integer,
    IN unit_price numeric(19,4),
    IN quantity smallint,
    IN discount real
) AS $$
BEGIN
    INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
    VALUES (order_id, product_id, unit_price, quantity, discount);
END;
$$ LANGUAGE plpgsql;