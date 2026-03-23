CREATE OR REPLACE FUNCTION update_customer(
    IN p_customer_id char(5),
    IN p_company_name varchar(40),
    IN p_contact_name varchar(30) DEFAULT NULL,
    IN p_contact_title varchar(30) DEFAULT NULL,
    IN p_address varchar(60) DEFAULT NULL,
    IN p_city varchar(15) DEFAULT NULL,
    IN p_region varchar(15) DEFAULT NULL,
    IN p_postal_code varchar(10) DEFAULT NULL,
    IN p_country varchar(15) DEFAULT NULL,
    IN p_phone varchar(24) DEFAULT NULL,
    IN p_fax varchar(24) DEFAULT NULL
) AS $$
BEGIN
    UPDATE customers
    SET company_name = p_company_name,
        contact_name = p_contact_name,
        contact_title = p_contact_title,
        address = p_address,
        city = p_city,
        region = p_region,
        postal_code = p_postal_code,
        country = p_country,
        phone = p_phone,
        fax = p_fax
    WHERE customer_id = p_customer_id;
END;
$$ LANGUAGE plpgsql;