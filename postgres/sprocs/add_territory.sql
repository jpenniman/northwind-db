CREATE OR REPLACE FUNCTION add_territory(
    IN territory_id varchar(20),
    IN territory_description char(50),
    IN region_id integer
) AS $$
BEGIN
    INSERT INTO territories (territory_id, territory_description, region_id)
    VALUES (territory_id, territory_description, region_id);
END;
$$ LANGUAGE plpgsql;