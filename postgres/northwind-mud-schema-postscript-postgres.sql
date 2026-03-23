--  The following adds constraints to the Northwind database

ALTER TABLE customer_customer_demo
	ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY 
	(
		customer_id,
		customer_type_id
	);

ALTER TABLE customer_demographics
	ADD CONSTRAINT pk_customer_demographics PRIMARY KEY 
	(
		customer_type_id
	);

ALTER TABLE customer_customer_demo
	ADD CONSTRAINT fk_customer_customer_demo FOREIGN KEY 
	(
		customer_type_id
	) REFERENCES customer_demographics (
		customer_type_id
	);

ALTER TABLE customer_customer_demo
	ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY
	(
		customer_id
	) REFERENCES customers (
		customer_id
	);

ALTER TABLE region
	ADD CONSTRAINT pk_region PRIMARY KEY 
	(
		region_id
	);

ALTER TABLE territories
	ADD CONSTRAINT pk_territories PRIMARY KEY 
	(
		territory_id
	);

ALTER TABLE territories
	ADD CONSTRAINT fk_territories_region FOREIGN KEY 
	(
		region_id
	) REFERENCES region (
		region_id
	);

ALTER TABLE employee_territories
	ADD CONSTRAINT pk_employee_territories PRIMARY KEY 
	(
		employee_id,
		territory_id
	);

ALTER TABLE employee_territories
	ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY 
	(
		employee_id
	) REFERENCES employees (
		employee_id
	);


ALTER TABLE employee_territories
	ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY 
	(
		territory_id
	) REFERENCES territories (
		territory_id
	);

ALTER TABLE employees
    ADD	CONSTRAINT fk_employees_employees FOREIGN KEY
	(
		reports_to
	) REFERENCES employees (
		employee_id
	);

ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY
	(
		order_id
	) REFERENCES orders (
		order_id
	),
	ADD CONSTRAINT fk_order_details_products FOREIGN KEY
	(
		product_id
	) REFERENCES products (
		product_id
	);

ALTER TABLE orders
    ADD	CONSTRAINT fk_orders_customers FOREIGN KEY
	(
		customer_id
	) REFERENCES customers (
		customer_id
	),
	ADD CONSTRAINT fk_orders_employees FOREIGN KEY
	(
		employee_id
	) REFERENCES employees (
		employee_id
	),
	ADD CONSTRAINT fk_orders_shippers FOREIGN KEY
	(
		ship_via
	) REFERENCES shippers (
		shipper_id
	);
-- Reset identity sequences to max values
SELECT setval(pg_get_serial_sequence('categories', 'category_id'), COALESCE((SELECT MAX(category_id) FROM categories), 1));
SELECT setval(pg_get_serial_sequence('employees', 'employee_id'), COALESCE((SELECT MAX(employee_id) FROM employees), 1));
SELECT setval(pg_get_serial_sequence('orders', 'order_id'), COALESCE((SELECT MAX(order_id) FROM orders), 1));
SELECT setval(pg_get_serial_sequence('products', 'product_id'), COALESCE((SELECT MAX(product_id) FROM products), 1));
SELECT setval(pg_get_serial_sequence('shippers', 'shipper_id'), COALESCE((SELECT MAX(shipper_id) FROM shippers), 1));
SELECT setval(pg_get_serial_sequence('suppliers', 'supplier_id'), COALESCE((SELECT MAX(supplier_id) FROM suppliers), 1));