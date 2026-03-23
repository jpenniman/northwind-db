CREATE OR REPLACE FUNCTION add_product(
    IN product_name varchar(40),
    IN supplier_id integer DEFAULT NULL,
    IN category_id integer DEFAULT NULL,
    IN quantity_per_unit varchar(20) DEFAULT NULL,
    IN unit_price numeric(19,4) DEFAULT NULL,
    IN units_in_stock smallint DEFAULT 0,
    IN units_on_order smallint DEFAULT 0,
    IN reorder_level smallint DEFAULT 0,
    IN discontinued boolean DEFAULT false,
    OUT product_id integer
) AS $$
BEGIN
    INSERT INTO products (product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
    VALUES (product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
    RETURNING product_id INTO product_id;
END;
$$ LANGUAGE plpgsql;