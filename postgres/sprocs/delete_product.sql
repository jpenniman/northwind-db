CREATE OR REPLACE FUNCTION delete_product(IN p_product_id integer) AS $$
BEGIN
    DELETE FROM products WHERE product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;