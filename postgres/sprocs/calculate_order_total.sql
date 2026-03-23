CREATE OR REPLACE FUNCTION calculate_order_total(
    IN p_order_id integer,
    OUT p_sub_total numeric(19,4),
    OUT p_discount numeric(19,4),
    OUT p_shipping numeric(19,4),
    OUT p_total numeric(19,4)
) AS $$
DECLARE
    v_order_total numeric(19,4);
    v_ship_country varchar(15);
BEGIN
    SELECT COALESCE(SUM(unit_price * quantity), 0)
    INTO p_sub_total
    FROM order_details
    WHERE order_id = p_order_id;
    
    SELECT COALESCE(SUM(unit_price * quantity * discount), 0)
    INTO p_discount
    FROM order_details
    WHERE order_id = p_order_id;
    
    v_order_total := p_sub_total - p_discount;
    
    SELECT ship_country INTO v_ship_country FROM orders WHERE order_id = p_order_id;
    
    IF v_order_total > 1000 THEN
        p_shipping := 0;
    ELSIF v_ship_country = 'USA' THEN
        p_shipping := v_order_total * 0.05;
    ELSE
        p_shipping := v_order_total * 0.15;
    END IF;
    
    p_total := v_order_total + p_shipping;
END;
$$ LANGUAGE plpgsql;