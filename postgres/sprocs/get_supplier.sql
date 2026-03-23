CREATE OR REPLACE FUNCTION get_supplier(IN p_supplier_id integer)
RETURNS TABLE (
    supplier_id integer,
    company_name varchar(40),
    contact_name varchar(30),
    contact_title varchar(30),
    address varchar(60),
    city varchar(15),
    region varchar(15),
    postal_code varchar(10),
    country varchar(15),
    phone varchar(24),
    fax varchar(24),
    homepage text
) AS $$
BEGIN
    RETURN QUERY
    SELECT s.supplier_id, s.company_name, s.contact_name, s.contact_title,
           s.address, s.city, s.region, s.postal_code, s.country, s.phone, s.fax, s.homepage
    FROM suppliers s
    WHERE s.supplier_id = p_supplier_id;
END;
$$ LANGUAGE plpgsql;