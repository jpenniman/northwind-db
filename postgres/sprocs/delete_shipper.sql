CREATE OR REPLACE FUNCTION delete_shipper(IN p_shipper_id integer) AS $$
BEGIN
    DELETE FROM shippers WHERE shipper_id = p_shipper_id;
END;
$$ LANGUAGE plpgsql;