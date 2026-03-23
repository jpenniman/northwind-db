CREATE OR REPLACE FUNCTION update_region(
    IN p_region_id integer,
    IN p_region_description char(50)
) AS $$
BEGIN
    UPDATE region
    SET region_description = p_region_description
    WHERE region_id = p_region_id;
END;
$$ LANGUAGE plpgsql;