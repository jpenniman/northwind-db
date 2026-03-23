CREATE OR REPLACE FUNCTION delete_region(IN p_region_id integer) AS $$
BEGIN
    DELETE FROM region WHERE region_id = p_region_id;
END;
$$ LANGUAGE plpgsql;