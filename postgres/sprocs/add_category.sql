CREATE OR REPLACE FUNCTION add_category(
    IN category_name varchar(15),
    IN description text DEFAULT NULL,
    IN picture bytea DEFAULT NULL,
    OUT category_id integer
) AS $$
BEGIN
    IF category_name IS NULL THEN
        RAISE EXCEPTION 'CategoryName cannot be null.';
    END IF;
    
    INSERT INTO categories (category_name, description, picture)
    VALUES (category_name, description, picture)
    RETURNING category_id INTO category_id;
END;
$$ LANGUAGE plpgsql;