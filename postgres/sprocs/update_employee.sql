CREATE OR REPLACE FUNCTION update_employee(
    IN p_employee_id integer,
    IN p_last_name varchar(20),
    IN p_first_name varchar(10),
    IN p_title varchar(30),
    IN p_title_of_courtesy varchar(25),
    IN p_birth_date timestamp,
    IN p_hire_date timestamp,
    IN p_address varchar(60),
    IN p_city varchar(15),
    IN p_region varchar(15),
    IN p_postal_code varchar(10),
    IN p_country varchar(15),
    IN p_home_phone varchar(24),
    IN p_extension varchar(4),
    IN p_photo bytea,
    IN p_notes text,
    IN p_reports_to integer,
    IN p_photo_path varchar(255)
) AS $$
BEGIN
    UPDATE employees
    SET last_name = p_last_name,
        first_name = p_first_name,
        title = p_title,
        title_of_courtesy = p_title_of_courtesy,
        birth_date = p_birth_date,
        hire_date = p_hire_date,
        address = p_address,
        city = p_city,
        region = p_region,
        postal_code = p_postal_code,
        country = p_country,
        home_phone = p_home_phone,
        extension = p_extension,
        photo = p_photo,
        notes = p_notes,
        reports_to = p_reports_to,
        photo_path = p_photo_path
    WHERE employee_id = p_employee_id;
END;
$$ LANGUAGE plpgsql;