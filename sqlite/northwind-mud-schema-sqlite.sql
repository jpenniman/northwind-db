-- Northwind Database for SQLite
-- This script does not create a database.
-- Run this script in the database you want the objects to be created.

DROP VIEW IF EXISTS category_sales_for_1997;
DROP VIEW IF EXISTS sales_by_category;
DROP VIEW IF EXISTS sales_totals_by_amount;
DROP VIEW IF EXISTS summary_of_sales_by_quarter;
DROP VIEW IF EXISTS summary_of_sales_by_year;
DROP VIEW IF EXISTS invoices;
DROP VIEW IF EXISTS order_details_extended;
DROP VIEW IF EXISTS order_subtotals;
DROP VIEW IF EXISTS product_sales_for_1997;
DROP VIEW IF EXISTS alphabetical_list_of_products;
DROP VIEW IF EXISTS current_product_list;
DROP VIEW IF EXISTS orders_qry;
DROP VIEW IF EXISTS products_above_average_price;
DROP VIEW IF EXISTS products_by_category;
DROP VIEW IF EXISTS quarterly_orders;
DROP VIEW IF EXISTS customer_and_suppliers_by_city;

DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS employee_territories;


CREATE TABLE employees (
	employee_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	last_name varchar (20) NOT NULL ,
	first_name varchar (10) NOT NULL ,
	title varchar (30) NULL ,
	title_of_courtesy varchar (25) NULL ,
	birth_date datetime NULL ,
	hire_date datetime NULL ,
	address varchar (60) NULL ,
	city varchar (15) NULL ,
	region varchar (15) NULL ,
	postal_code varchar (10) NULL ,
	country varchar (15) NULL ,
	home_phone varchar (24) NULL ,
	extension varchar (4) NULL ,
	photo blob NULL ,
	notes text NULL ,
	reports_to integer NULL ,
	photo_path varchar (255) NULL
);
CREATE  INDEX ix_employee_last_name ON employees(last_name);
CREATE  INDEX ix_employee_postal_code ON employees(postal_code);

CREATE TABLE categories (
	category_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	category_name varchar (15) NOT NULL ,
	description text NULL ,
	picture blob NULL
);
CREATE  INDEX ix_category_name ON categories(category_name);

CREATE TABLE customers (
	customer_id char (5) NOT NULL PRIMARY KEY,
	company_name varchar (40) NOT NULL ,
	contact_name varchar (30) NULL ,
	contact_title varchar (30) NULL ,
	address varchar (60) NULL ,
	city varchar (15) NULL ,
	region varchar (15) NULL ,
	postal_code varchar (10) NULL ,
	country varchar (15) NULL ,
	phone varchar (24) NULL ,
	fax varchar (24) NULL
);
CREATE  INDEX ix_customers_city ON customers(city);
CREATE  INDEX ix_customers_company_name ON customers(company_name);
CREATE  INDEX ix_customers_postal_code ON customers(postal_code);
CREATE  INDEX ix_customers_region ON customers(region);

CREATE TABLE shippers (
	shipper_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	company_name varchar (40) NOT NULL ,
	phone varchar (24) NULL
);

CREATE TABLE suppliers (
	supplier_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	company_name varchar (40) NOT NULL ,
	contact_name varchar (30) NULL ,
	contact_title varchar (30) NULL ,
	address varchar (60) NULL ,
	city varchar (15) NULL ,
	region varchar (15) NULL ,
	postal_code varchar (10) NULL ,
	country varchar (15) NULL ,
	phone varchar (24) NULL ,
	fax varchar (24) NULL ,
	home_page text NULL
);
CREATE  INDEX ix_suppliers_company_name ON suppliers(company_name);
CREATE  INDEX ix_suppliers_postal_code ON suppliers(postal_code);

CREATE TABLE orders (
	order_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	customer_id char (5) NULL ,
	employee_id integer NULL ,
	order_date datetime NULL ,
	required_date datetime NULL ,
	shipped_date datetime NULL ,
	ship_via integer NULL ,
	freight real NULL DEFAULT 0,
	ship_name varchar (40) NULL ,
	ship_address varchar (60) NULL ,
	ship_city varchar (15) NULL ,
	ship_region varchar (15) NULL ,
	ship_postal_code varchar (10) NULL ,
	ship_country varchar (15) NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_shippers FOREIGN KEY(ship_via) REFERENCES shippers(shipper_id),
    CONSTRAINT fk_orders_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
CREATE  INDEX ix_orders_customer_id ON orders(customer_id);
CREATE  INDEX ix_orders_customers_orders ON orders(customer_id);
CREATE  INDEX ix_orders_employee_id ON orders(employee_id);
CREATE  INDEX ix_orders_employees_orders ON orders(employee_id);
CREATE  INDEX ix_orders_order_date ON orders(order_date);
CREATE  INDEX ix_orders_shipped_date ON orders(shipped_date);
CREATE  INDEX ix_orders_shippers_orders ON orders(ship_via);
CREATE  INDEX ix_orders_ship_postal_code ON orders(ship_postal_code);

CREATE TABLE products (
	product_id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	product_name varchar (40) NOT NULL ,
	supplier_id integer NULL ,
	category_id integer NULL ,
	quantity_per_unit varchar (20) NULL ,
	unit_price real NULL DEFAULT 0,
	units_in_stock integer NULL DEFAULT 0,
	units_on_order integer NULL DEFAULT 0,
	reorder_level integer NULL DEFAULT 0,
	discontinued integer NOT NULL DEFAULT 0,
    CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories (category_id),
	CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id),
	CONSTRAINT ck_products_unit_price CHECK (unit_price >= 0),
	CONSTRAINT ck_reorder_level CHECK (reorder_level >= 0),
	CONSTRAINT ck_units_in_stock CHECK (units_in_stock >= 0),
	CONSTRAINT ck_units_on_order CHECK (units_on_order >= 0)
);
CREATE  INDEX ix_products_categories_products ON products(category_id);
CREATE  INDEX ix_products_category_id ON products(category_id);
CREATE  INDEX ix_products_product_name ON products(product_name);
CREATE  INDEX ix_products_supplier_id ON products(supplier_id);
CREATE  INDEX ix_products_suppliers_products ON products(supplier_id);

CREATE TABLE order_details (
	order_id integer NOT NULL ,
	product_id integer NOT NULL ,
	unit_price real NOT NULL DEFAULT 0,
	quantity integer NOT NULL DEFAULT 1,
	discount real NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, product_id),
	CONSTRAINT ck_discount CHECK (discount >= 0 and (discount <= 1)),
	CONSTRAINT ck_quantity CHECK (quantity > 0),
	CONSTRAINT ck_unit_price CHECK (unit_price >= 0)
);
CREATE  INDEX ix_order_details_order_id ON order_details(order_id);
CREATE  INDEX ix_order_product_id ON order_details(product_id);
CREATE  INDEX ix_order_products_order_details ON order_details(product_id);

CREATE TABLE region (
	region_id integer NOT NULL PRIMARY KEY,
	region_description varchar (50) NOT NULL
);

CREATE TABLE territories (
	territory_id varchar (20) NOT NULL PRIMARY KEY,
	territory_description varchar (50) NOT NULL ,
	region_id integer NOT NULL,
	CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES region (region_id)
);

CREATE TABLE employee_territories (
	employee_id integer NOT NULL ,
	territory_id varchar (20) NOT NULL ,
	PRIMARY KEY (employee_id, territory_id),
	CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
	CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES territories (territory_id)
);

CREATE TABLE customer_demographics (
	customer_type_id char (10) NOT NULL PRIMARY KEY,
	customer_desc text NULL
);

CREATE TABLE customer_customer_demo (
	customer_id char (5) NOT NULL ,
	customer_type_id char (10) NOT NULL ,
	PRIMARY KEY (customer_id, customer_type_id),
	CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES customer_demographics (customer_type_id)
);

CREATE VIEW customer_and_suppliers_by_city AS
SELECT city, company_name, contact_name, 'Customers' AS relationship
FROM customers
UNION SELECT city, company_name, contact_name, 'Suppliers'
FROM suppliers;

CREATE VIEW alphabetical_list_of_products AS
SELECT products.*, categories.category_name
FROM categories INNER JOIN products ON categories.category_id = products.category_id
WHERE products.discontinued=0;

CREATE VIEW current_product_list AS
SELECT product_list.product_id, product_list.product_name
FROM products AS product_list
WHERE product_list.discontinued=0;

CREATE VIEW orders_qry AS
SELECT orders.order_id, orders.customer_id, orders.employee_id, orders.order_date, orders.required_date, 
	orders.shipped_date, orders.ship_via, orders.freight, orders.ship_name, orders.ship_address, orders.ship_city, 
	orders.ship_region, orders.ship_postal_code, orders.ship_country, 
	customers.company_name, customers.address, customers.city, customers.region, customers.postal_code, customers.country
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id;

CREATE VIEW products_above_average_price AS
SELECT products.product_name, products.unit_price
FROM products
WHERE products.unit_price>(SELECT AVG(unit_price) FROM products);

CREATE VIEW products_by_category AS
SELECT categories.category_name, products.product_name, products.quantity_per_unit, products.units_in_stock, products.discontinued
FROM categories INNER JOIN products ON categories.category_id = products.category_id
WHERE products.discontinued = false;

CREATE VIEW quarterly_orders AS
SELECT DISTINCT customers.customer_id, customers.company_name, customers.city, customers.country
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_date BETWEEN '19970101' AND '19971231';

CREATE VIEW invoices AS
SELECT orders.ship_name, orders.ship_address, orders.ship_city, orders.ship_region, orders.ship_postal_code, 
	orders.ship_country, orders.customer_id, customers.company_name AS customer_name, customers.address, customers.city, 
	customers.region, customers.postal_code, customers.country, 
	(employees.first_name || ' ' || employees.last_name) AS salesperson, 
	orders.order_id, orders.order_date, orders.required_date, orders.shipped_date, shippers.company_name AS shipper_name, 
	order_details.product_id, products.product_name, order_details.unit_price, order_details.quantity, 
	order_details.discount, 
	(((order_details.unit_price*quantity*(1-discount)/100))*100) AS extended_price, orders.freight
FROM 	shippers INNER JOIN 
		(products INNER JOIN 
			(
				(employees INNER JOIN 
					(customers INNER JOIN orders ON customers.customer_id = orders.customer_id) 
				ON employees.employee_id = orders.employee_id) 
			INNER JOIN order_details ON orders.order_id = order_details.order_id) 
		ON products.product_id = order_details.product_id) 
	ON shippers.shipper_id = orders.ship_via;

CREATE VIEW order_details_extended AS
SELECT order_details.order_id, order_details.product_id, products.product_name, 
	order_details.unit_price, order_details.quantity, order_details.discount, 
	(((order_details.unit_price*quantity*(1-discount)/100))*100) AS extended_price
FROM products INNER JOIN order_details ON products.product_id = order_details.product_id;

CREATE VIEW order_subtotals AS
SELECT order_details.order_id, SUM(((order_details.unit_price*quantity*(1-discount)/100))*100) AS subtotal
FROM order_details
GROUP BY order_details.order_id;

CREATE VIEW product_sales_for_1997 AS
SELECT categories.category_name, products.product_name, 
	SUM(((order_details.unit_price*quantity*(1-discount)/100))*100) AS product_sales
FROM (categories INNER JOIN products ON categories.category_id = products.category_id) 
	INNER JOIN (orders 
		INNER JOIN order_details ON orders.order_id = order_details.order_id) 
	ON products.product_id = order_details.product_id
WHERE ((orders.shipped_date BETWEEN '19970101' AND '19971231'))
GROUP BY categories.category_name, products.product_name;

CREATE VIEW category_sales_for_1997 AS
SELECT product_sales_for_1997.category_name, SUM(product_sales_for_1997.product_sales) AS category_sales
FROM product_sales_for_1997
GROUP BY product_sales_for_1997.category_name;

CREATE VIEW sales_by_category AS
SELECT categories.category_id, categories.category_name, products.product_name, 
	SUM(order_details_extended.extended_price) AS product_sales
FROM 	categories INNER JOIN 
		(products INNER JOIN 
			(orders INNER JOIN order_details_extended ON orders.order_id = order_details_extended.order_id) 
		ON products.product_id = order_details_extended.product_id) 
	ON categories.category_id = products.category_id
WHERE orders.order_date BETWEEN '19970101' AND '19971231'
GROUP BY categories.category_id, categories.category_name, products.product_name;

CREATE VIEW sales_totals_by_amount AS
SELECT order_subtotals.subtotal AS sale_amount, orders.order_id, customers.company_name, orders.shipped_date
FROM 	customers INNER JOIN 
		(orders INNER JOIN order_subtotals ON orders.order_id = order_subtotals.order_id) 
	ON customers.customer_id = orders.customer_id
WHERE (order_subtotals.subtotal > 2500) AND (orders.shipped_date BETWEEN '19970101' AND '19971231');

CREATE VIEW summary_of_sales_by_quarter AS
SELECT orders.shipped_date, orders.order_id, order_subtotals.subtotal
FROM orders INNER JOIN order_subtotals ON orders.order_id = order_subtotals.order_id
WHERE orders.shipped_date IS NOT NULL;

CREATE VIEW summary_of_sales_by_year AS
SELECT orders.shipped_date, orders.order_id, order_subtotals.subtotal
FROM orders INNER JOIN order_subtotals ON orders.order_id = order_subtotals.order_id
WHERE orders.shipped_date IS NOT NULL;
