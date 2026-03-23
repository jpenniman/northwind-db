CREATE OR REPLACE FUNCTION update_order(
    IN p_order_id integer,
    IN p_customer_id char(5),
    IN p_employee_id integer,
    IN p_order_date timestamp,
    IN p_required_date timestamp,
    IN p_shipped_date timestamp,
    IN p_ship_via integer,
    IN p_freight numeric(19,4),
    IN p_ship_name varchar(40),
    IN p_ship_address varchar(60),
    IN p_ship_city varchar(15),
    IN p_ship_region varchar(15),
    IN p_ship_postal_code varchar(10),
    IN p_ship_country varchar(15)
) AS $$
BEGIN
    UPDATE orders
    SET customer_id = p_customer_id,
        employee_id = p_employee_id,
        order_date = p_order_date,
        required_date = p_required_date,
        shipped_date = p_shipped_date,
        ship_via = p_ship_via,
        freight = p_freight,
        ship_name = p_ship_name,
        ship_address = p_ship_address,
        ship_city = p_ship_city,
        ship_region = p_ship_region,
        ship_postal_code = p_ship_postal_code,
        ship_country = p_ship_country
    WHERE order_id = p_order_id;
END;
$$ LANGUAGE plpgsql;