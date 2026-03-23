CREATE OR REPLACE FUNCTION get_shipper(IN p_shipper_id integer)
RETURNS TABLE (
    shipper_id integer,
    company_name varchar(40),
    phone varchar(24)
) AS $$
BEGIN
    RETURN QUERY
    SELECT s.shipper_id, s.company_name, s.phone
    FROM shippers s
    WHERE s.shipper_id = p_shipper_id;
END;
$$ LANGUAGE plpgsql;