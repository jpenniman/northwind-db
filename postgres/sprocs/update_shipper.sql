CREATE OR REPLACE FUNCTION update_shipper(
    IN p_shipper_id integer,
    IN p_company_name varchar(40),
    IN p_phone varchar(24) DEFAULT NULL
) AS $$
BEGIN
    UPDATE shippers
    SET company_name = p_company_name,
        phone = p_phone
    WHERE shipper_id = p_shipper_id;
END;
$$ LANGUAGE plpgsql;