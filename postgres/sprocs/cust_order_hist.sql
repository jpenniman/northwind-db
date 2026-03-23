CREATE OR REPLACE FUNCTION cust_order_hist(IN p_customer_id char(5))
RETURNS TABLE (product_name varchar(40), total bigint) AS $$
BEGIN
    RETURN QUERY
    SELECT p.product_name, SUM(od.quantity)::bigint AS total
    FROM products p
    JOIN order_details od ON p.product_id = od.product_id
    JOIN orders o ON od.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY p.product_name;
END;
$$ LANGUAGE plpgsql;