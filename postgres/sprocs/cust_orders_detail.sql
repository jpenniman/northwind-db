CREATE OR REPLACE FUNCTION cust_orders_detail(IN p_order_id integer)
RETURNS TABLE (
    product_name varchar(40),
    unit_price numeric(19,4),
    quantity smallint,
    discount integer,
    extended_price numeric(19,4)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.product_name,
        ROUND(od.unit_price, 2),
        od.quantity,
        (od.discount * 100)::integer,
        ROUND((od.quantity * (1 - od.discount) * od.unit_price)::numeric, 2)
    FROM products p
    JOIN order_details od ON p.product_id = od.product_id
    WHERE od.order_id = p_order_id;
END;
$$ LANGUAGE plpgsql;