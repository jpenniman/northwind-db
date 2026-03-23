CREATE OR REPLACE FUNCTION ten_most_expensive_products()
RETURNS TABLE (
    ten_most_expensive_products varchar(40),
    unit_price numeric(19,4)
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.product_name, p.unit_price
    FROM products p
    ORDER BY p.unit_price DESC
    LIMIT 10;
END;
$$ LANGUAGE plpgsql;