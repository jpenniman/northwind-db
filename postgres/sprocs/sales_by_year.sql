CREATE OR REPLACE FUNCTION sales_by_year(
    IN p_beginning_date timestamp, 
    IN p_ending_date timestamp
)
RETURNS TABLE (
    shipped_date timestamp,
    order_id integer,
    subtotal numeric(19,4),
    year text
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        o.shipped_date,
        o.order_id,
        os.subtotal,
        TO_CHAR(o.shipped_date, 'YYYY') AS year
    FROM orders o
    JOIN order_subtotals os ON o.order_id = os.order_id
    WHERE o.shipped_date BETWEEN p_beginning_date AND p_ending_date;
END;
$$ LANGUAGE plpgsql;