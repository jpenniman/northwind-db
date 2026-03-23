CREATE OR REPLACE FUNCTION update_product(
    IN p_product_id integer,
    IN p_product_name varchar(40),
    IN p_supplier_id integer DEFAULT NULL,
    IN p_category_id integer DEFAULT NULL,
    IN p_quantity_per_unit varchar(20) DEFAULT NULL,
    IN p_unit_price numeric(19,4) DEFAULT NULL,
    IN p_units_in_stock smallint DEFAULT NULL,
    IN p_units_on_order smallint DEFAULT NULL,
    IN p_reorder_level smallint DEFAULT NULL,
    IN p_discontinued boolean DEFAULT NULL
) AS $$
BEGIN
    UPDATE products
    SET product_name = p_product_name,
        supplier_id = p_supplier_id,
        category_id = p_category_id,
        quantity_per_unit = p_quantity_per_unit,
        unit_price = p_unit_price,
        units_in_stock = p_units_in_stock,
        units_on_order = p_units_on_order,
        reorder_level = p_reorder_level,
        discontinued = p_discontinued
    WHERE product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;