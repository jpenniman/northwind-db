CREATE OR REPLACE FUNCTION add_region(
    IN region_id integer,
    IN region_description char(50)
) AS $$
BEGIN
    INSERT INTO region (region_id, region_description)
    VALUES (region_id, region_description);
END;
$$ LANGUAGE plpgsql;