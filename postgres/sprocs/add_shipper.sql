CREATE OR REPLACE FUNCTION add_shipper(
    IN company_name varchar(40),
    IN phone varchar(24) DEFAULT NULL,
    OUT shipper_id integer
) AS $$
BEGIN
    INSERT INTO shippers (company_name, phone)
    VALUES (company_name, phone)
    RETURNING shipper_id INTO shipper_id;
END;
$$ LANGUAGE plpgsql;