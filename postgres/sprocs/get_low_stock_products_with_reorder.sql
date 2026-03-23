CREATE OR REPLACE FUNCTION get_low_stock_products_with_reorder(
    IN p_threshold smallint DEFAULT 10
)
RETURNS TABLE (
    product_id integer,
    product_name varchar(40),
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    supplier_id integer,
    supplier_name varchar(40),
    stock_status varchar(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.product_id,
        p.product_name,
        p.units_in_stock,
        p.units_on_order,
        p.reorder_level,
        p.supplier_id,
        s.company_name AS supplier_name,
        CASE 
            WHEN p.units_in_stock <= p.reorder_level THEN 'REORDER NEEDED'
            WHEN p.units_in_stock < p_threshold THEN 'LOW STOCK'
            ELSE 'OK'
        END AS stock_status
    FROM products p
    LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
    WHERE p.discontinued = false
    AND (p.units_in_stock < p_threshold OR p.units_in_stock <= p.reorder_level)
    ORDER BY p.units_in_stock ASC;
END;
$$ LANGUAGE plpgsql;