CREATE OR REPLACE FUNCTION add_employee(
    IN last_name varchar(20),
    IN first_name varchar(10),
    IN title varchar(30),
    IN title_of_courtesy varchar(25),
    IN birth_date timestamp,
    IN hire_date timestamp,
    IN address varchar(60),
    IN city varchar(15),
    IN region varchar(15),
    IN postal_code varchar(10),
    IN country varchar(15),
    IN home_phone varchar(24),
    IN extension varchar(4),
    IN photo bytea,
    IN notes text,
    IN reports_to integer,
    IN photo_path varchar(255),
    OUT employee_id integer
) AS $$
BEGIN
    INSERT INTO employees (last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path)
    VALUES (last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path)
    RETURNING employee_id INTO employee_id;
END;
$$ LANGUAGE plpgsql;