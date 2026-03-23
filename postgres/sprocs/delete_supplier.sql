CREATE OR REPLACE FUNCTION delete_supplier(IN p_supplier_id integer) AS $$
BEGIN
    DELETE FROM suppliers WHERE supplier_id = p_supplier_id;
END;
$$ LANGUAGE plpgsql;