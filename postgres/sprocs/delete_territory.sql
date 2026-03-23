CREATE OR REPLACE FUNCTION delete_territory(IN p_territory_id varchar(20)) AS $$
BEGIN
    DELETE FROM territories WHERE territory_id = p_territory_id;
END;
$$ LANGUAGE plpgsql;