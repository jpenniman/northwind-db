CREATE OR REPLACE FUNCTION sales_by_category(
    IN p_category_name varchar(15), 
    IN p_ord_year varchar(4) DEFAULT '1998'
)
RETURNS TABLE (
    product_name varchar(40),
    total_purchase bigint
) AS $$
DECLARE
    v_ord_year varchar(4);
BEGIN
    v_ord_year := p_ord_year;
    
    IF v_ord_year NOT IN ('1996', '1997', '1998') THEN
        v_ord_year := '1998';
    END IF;
    
    RETURN QUERY
    SELECT 
        p.product_name,
        ROUND(SUM(od.quantity * (1 - od.discount) * od.unit_price)::decimal(14,2), 0)::bigint AS total_purchase
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    JOIN products p ON od.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    WHERE c.category_name = p_category_name
    AND TO_CHAR(o.order_date, 'YYYY') = v_ord_year
    GROUP BY p.product_name
    ORDER BY p.product_name;
END;
$$ LANGUAGE plpgsql;