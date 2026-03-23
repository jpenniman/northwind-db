CREATE OR REPLACE FUNCTION add_supplier(
    IN company_name varchar(40),
    IN contact_name varchar(30) DEFAULT NULL,
    IN contact_title varchar(30) DEFAULT NULL,
    IN address varchar(60) DEFAULT NULL,
    IN city varchar(15) DEFAULT NULL,
    IN region varchar(15) DEFAULT NULL,
    IN postal_code varchar(10) DEFAULT NULL,
    IN country varchar(15) DEFAULT NULL,
    IN phone varchar(24) DEFAULT NULL,
    IN fax varchar(24) DEFAULT NULL,
    IN homepage text DEFAULT NULL,
    OUT supplier_id integer
) AS $$
BEGIN
    INSERT INTO suppliers (company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage)
    VALUES (company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage)
    RETURNING supplier_id INTO supplier_id;
END;
$$ LANGUAGE plpgsql;