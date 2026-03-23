CREATE OR REPLACE FUNCTION add_customer_demographic(
    IN customer_type_id char(10),
    IN customer_desc text
) AS $$
BEGIN
    INSERT INTO customer_demographics (customer_type_id, customer_desc)
    VALUES (customer_type_id, customer_desc);
END;
$$ LANGUAGE plpgsql;