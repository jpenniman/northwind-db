CREATE OR REPLACE FUNCTION update_territory(
    IN p_territory_id varchar(20),
    IN p_territory_description char(50),
    IN p_region_id integer
) AS $$
BEGIN
    UPDATE territories
    SET territory_description = p_territory_description,
        region_id = p_region_id
    WHERE territory_id = p_territory_id;
END;
$$ LANGUAGE plpgsql;