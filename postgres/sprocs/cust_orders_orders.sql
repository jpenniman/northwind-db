CREATE OR REPLACE FUNCTION cust_orders_orders(IN p_customer_id char(5))
RETURNS TABLE (
    order_id integer,
    order_date timestamp,
    required_date timestamp,
    shipped_date timestamp
) AS $$
BEGIN
    RETURN QUERY
    SELECT o.order_id, o.order_date, o.required_date, o.shipped_date
    FROM orders o
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_id;
END;
$$ LANGUAGE plpgsql;