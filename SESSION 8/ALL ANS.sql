USE insta_clone;

-- QUE :- 1 >
----------------- 	

DROP PROCEDURE IF EXISTS show_user;

DELIMITER //

CREATE PROCEDURE show_user()
BEGIN
    DECLARE v_name VARCHAR(50);
    DECLARE v_age INT;

    SET v_name = 'John';
    SET v_age = 25;

    SELECT CONCAT('Name: ', v_name) AS Name,
           CONCAT('Age: ', v_age) AS Age;
END //

DELIMITER ;

CALL show_user();

-- QUE :- 2 >
---------------

USE insta_clone;

DELIMITER //

CREATE PROCEDURE check_delivery()
BEGIN
    DECLARE v_order_amount DECIMAL(10,2);

    SET v_order_amount = 600;

    IF v_order_amount > 500 THEN
        SELECT 'Eligible for free delivery' AS Message;
    ELSE
        SELECT 'Delivery charges apply' AS Message;
    END IF;
END //

DELIMITER ;

CALL check_delivery();

-- QUE :- 3 >
---------------------

DELIMITER //

CREATE PROCEDURE print_numbers()
BEGIN
    DECLARE v_counter INT DEFAULT 1;

    simple_loop: LOOP
        SELECT v_counter;

        IF v_counter = 5 THEN
            LEAVE simple_loop;
        END IF;

        SET v_counter = v_counter + 1;
    END LOOP simple_loop;
END //

DELIMITER ;

CALL print_numbers();

-- QUE :- 4 >
-----------------
CREATE TABLE PRODUCTS (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100)
);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME)
VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Headphones'),
(4, 'Keyboard'),
(5, 'Mouse');


DROP PROCEDURE IF EXISTS print_products;

DELIMITER //

CREATE PROCEDURE print_products()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_product_name VARCHAR(255);

    DECLARE product_cursor CURSOR FOR
        SELECT PRODUCT_NAME FROM PRODUCTS;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN product_cursor;

    read_loop: LOOP
        FETCH product_cursor INTO v_product_name;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT v_product_name AS Product_Name;
    END LOOP;

    CLOSE product_cursor;
END //

DELIMITER ;

CALL print_products();

-- QUE :- 5 >
--------------------

DELIMITER //

CREATE PROCEDURE divide_numbers()
BEGIN
    DECLARE v_num1 DECIMAL(10,2) DEFAULT 10;
    DECLARE v_num2 DECIMAL(10,2) DEFAULT 0;
    DECLARE v_result DECIMAL(10,2);

    DECLARE CONTINUE HANDLER FOR SQLSTATE '22012'
    BEGIN
        SELECT 'Cannot divide by zero' AS Message;
    END;

    SET v_result = v_num1 / v_num2;

    IF v_num2 <> 0 THEN
        SELECT v_result AS Result;
    END IF;
END //

DELIMITER ;

CALL divide_numbers();

