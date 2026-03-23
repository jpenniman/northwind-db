CREATE OR REPLACE FUNCTION add_order(
    IN customer_id char(5),
    IN employee_id integer,
    IN order_date timestamp,
    IN required_date timestamp,
    IN ship_via integer,
    IN freight numeric(19,4),
    IN ship_name varchar(40),
    IN ship_address varchar(60),
    IN ship_city varchar(15),
    IN ship_region varchar(15),
    IN ship_postal_code varchar(10),
    IN ship_country varchar(15),
    OUT order_id integer
) AS $$
BEGIN
    INSERT INTO orders (customer_id, employee_id, order_date, required_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
    VALUES (customer_id, employee_id, order_date, required_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
    RETURNING order_id INTO order_id;
END;
$$ LANGUAGE plpgsql;