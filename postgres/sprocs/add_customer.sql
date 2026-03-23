CREATE OR REPLACE FUNCTION add_customer(
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
    OUT customer_id char(5)
) AS $$
DECLARE
    result_code integer := 2627;
    attempt_num smallint := 0;
    new_customer_id char(5);
BEGIN
    WHILE result_code = 2627 AND attempt_num < 3 LOOP
        new_customer_id := (
            chr(floor(random() * 26)::int + 65) ||
            chr(floor(random() * 26)::int + 65) ||
            chr(floor(random() * 26)::int + 65) ||
            chr(floor(random() * 26)::int + 65) ||
            chr(floor(random() * 26)::int + 65)
        );
        
        INSERT INTO customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax)
        VALUES (new_customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax);
        
        customer_id := new_customer_id;
        attempt_num := attempt_num + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;