CREATE OR REPLACE FUNCTION get_customer(IN p_customer_id char(5))
RETURNS TABLE (
    customer_id char(5),
    company_name varchar(40),
    contact_name varchar(30),
    contact_title varchar(30),
    address varchar(60),
    city varchar(15),
    region varchar(15),
    postal_code varchar(10),
    country varchar(15),
    phone varchar(24),
    fax varchar(24)
) AS $$
BEGIN
    RETURN QUERY
    SELECT c.customer_id, c.company_name, c.contact_name, c.contact_title, 
           c.address, c.city, c.region, c.postal_code, c.country, c.phone, c.fax
    FROM customers c
    WHERE c.customer_id = p_customer_id;
END;
$$ LANGUAGE plpgsql;