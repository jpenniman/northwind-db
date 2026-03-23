CREATE OR REPLACE FUNCTION delete_category(IN p_category_id integer) AS $$
BEGIN
    DELETE FROM categories WHERE category_id = p_category_id;
END;
$$ LANGUAGE plpgsql;