USE insta_clone;

-- QUE :- 1 >
------------------
START TRANSACTION;

INSERT INTO Orders (order_id, username, order_total)
VALUES (101, 'Rahul', 1500.00);

COMMIT;

SELECT *
FROM Orders
WHERE order_id = 101;

-- QUE :- 2 > 
----------------
CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY,
    order_id INT,
    item_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);

START TRANSACTION;

INSERT INTO OrderItems (item_id, order_id, item_name, quantity, price)
VALUES 
(1, 101, 'Margherita Pizza', 1, 299.00),
(2, 101, 'Veg Burger', 2, 199.00);
ROLLBACK;
SELECT * FROM OrderItems
WHERE order_id = 101;

-- QUE :- 3 >
-------------------
START TRANSACTION;

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);

START TRANSACTION;

INSERT INTO Cart (cart_id, user_id, product_name, quantity, price)
VALUES (1, 101, 'iPhone 15', 1, 69999.00);
SAVEPOINT product_added;
INSERT INTO Cart (cart_id, user_id, product_name, quantity, price)
VALUES (2, 101, 'Boat Headphones', 1, 1999.00);
ROLLBACK TO SAVEPOINT product_added;
COMMIT;

SELECT * FROM Cart
WHERE user_id = 101;

-- QUE :- 4 >
-------------------
CREATE TABLE Wallet (
    user_id INT PRIMARY KEY,
    balance DECIMAL(10,2) DEFAULT 0.00
);
INSERT INTO Wallet (user_id, balance)
VALUES (101, 5000.00);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER deduct_wallet_balance
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance - NEW.amount
    WHERE user_id = NEW.user_id;
END //

DELIMITER ;

SELECT * FROM Wallet
WHERE user_id = 101;

-- QUE :- 5 >
------------------
CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10,2)
);
DELIMITER //

CREATE TRIGGER buggy_deduct_expense
AFTER INSERT ON Expenses
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance - NEW.amount - NEW.amount
    WHERE user_id = NEW.user_id;
END //

DELIMITER ;
INSERT INTO Expenses (user_id, amount)
VALUES (101, 1000.00);

SELECT * FROM Wallet;

DROP TRIGGER buggy_deduct_expense;

UPDATE Wallet
SET balance = 5000.00
WHERE user_id = 101;

SELECT * FROM Wallet;

DELIMITER //

CREATE TRIGGER deduct_expense
AFTER INSERT ON Expenses
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance - NEW.amount
    WHERE user_id = NEW.user_id;
END //

DELIMITER ;

INSERT INTO Expenses (user_id, amount)
VALUES (101, 1000.00);
