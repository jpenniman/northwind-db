CREATE OR REPLACE FUNCTION process_order_with_inventory_check(
    IN p_customer_id char(5),
    IN p_employee_id integer,
    IN p_order_date timestamp,
    IN p_required_date timestamp,
    IN p_ship_via integer,
    IN p_freight numeric(19,4),
    IN p_ship_name varchar(40),
    IN p_ship_address varchar(60),
    IN p_ship_city varchar(15),
    IN p_ship_region varchar(15),
    IN p_ship_postal_code varchar(10),
    IN p_ship_country varchar(15),
    OUT p_order_id integer,
    OUT p_error_message varchar(500)
) AS $$
BEGIN
    p_error_message := '';
    
    IF NOT EXISTS (SELECT 1 FROM customers WHERE customer_id = p_customer_id) THEN
        p_error_message := 'Invalid customer ID';
        RETURN;
    END IF;
    
    IF p_required_date < p_order_date THEN
        p_error_message := 'Required date cannot be before order date';
        RETURN;
    END IF;
    
    INSERT INTO orders (customer_id, employee_id, order_date, required_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
    VALUES (p_customer_id, p_employee_id, p_order_date, p_required_date, p_ship_via, p_freight, p_ship_name, p_ship_address, p_ship_city, p_ship_region, p_ship_postal_code, p_ship_country)
    RETURNING order_id INTO p_order_id;
END;
$$ LANGUAGE plpgsql;