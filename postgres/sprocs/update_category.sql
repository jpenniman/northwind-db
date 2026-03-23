CREATE OR REPLACE FUNCTION update_category(
    IN p_category_id integer,
    IN p_category_name varchar(15),
    IN p_description text,
    IN p_picture bytea
) AS $$
BEGIN
    UPDATE categories
    SET category_name = p_category_name,
        description = p_description,
        picture = p_picture
    WHERE category_id = p_category_id;
END;
$$ LANGUAGE plpgsql;