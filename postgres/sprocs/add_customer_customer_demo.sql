CREATE OR REPLACE FUNCTION add_customer_customer_demo(
    IN customer_id char(5),
    IN customer_type_id char(10)
) AS $$
BEGIN
    INSERT INTO customer_customer_demo (customer_id, customer_type_id)
    VALUES (customer_id, customer_type_id);
END;
$$ LANGUAGE plpgsql;