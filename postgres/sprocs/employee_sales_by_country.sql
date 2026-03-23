CREATE OR REPLACE FUNCTION employee_sales_by_country(
    IN p_beginning_date timestamp, 
    IN p_ending_date timestamp
)
RETURNS TABLE (
    country varchar(15),
    last_name varchar(20),
    first_name varchar(10),
    shipped_date timestamp,
    order_id integer,
    sale_amount numeric(19,4)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        e.country,
        e.last_name,
        e.first_name,
        o.shipped_date,
        o.order_id,
        os.subtotal AS sale_amount
    FROM employees e
    JOIN orders o ON e.employee_id = o.employee_id
    JOIN order_subtotals os ON o.order_id = os.order_id
    WHERE o.shipped_date BETWEEN p_beginning_date AND p_ending_date;
END;
$$ LANGUAGE plpgsql;