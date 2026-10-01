use insta_clone;

-- QUE :- 1 >
------------------

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50)
);

-- QUE :- 2 >
--------------------

CREATE TABLE FoodOrder (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    user_id INT,
    order_total DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

-- QUE :- 3 >
------------------
CREATE TABLE SpotifyUser (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) NOT NULL,
    subscription_type VARCHAR(30)
);

INSERT INTO SpotifyUser 
(user_id, username, email, subscription_type)
VALUES
(1, 'manan', 'manan@gmail.com', 'Premium'),
(2, 'rahul', 'rahul@gmail.com', 'Free'),
(3, 'priya', 'priya@gmail.com', 'Premium'),
(4, 'jay', 'jay@gmail.com', 'Family'),
(5, 'neha', 'neha@gmail.com', 'Student'),
(6, 'krish', 'krish@gmail.com', 'Premium');

-- QUE :- 4 >
----------------

CREATE TABLE FoodOrder (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    user_id INT,
    order_total DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(id)
);

INSERT INTO FoodOrder
(order_id, restaurant_id, user_id, order_total)
VALUES
(1, 1, 1, 1500),
(2, 2, 2, 800),
(3, 3, 3, 2200),
(4, 1, 4, 1200),
(5, 2, 5, 700),
(6, 3, 6, 1800);

CREATE TABLE SpotifyUser (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) NOT NULL,
    subscription_type VARCHAR(30)
);

INSERT INTO SpotifyUser
(user_id, username, email, subscription_type)
VALUES
(1, 'manan', 'manan@gmail.com', 'Premium'),
(2, 'rahul', 'rahul@gmail.com', 'Free'),
(3, 'priya', 'priya@gmail.com', 'Premium'),
(4, 'jay', 'jay@gmail.com', 'Family'),
(5, 'neha', 'neha@gmail.com', 'Student'),
(6, 'krish', 'krish@gmail.com', 'Premium');

CREATE VIEW TopSpendersView AS
SELECT username, order_total
FROM FoodOrder
WHERE order_total > 1000;

SELECT * FROM TopSpendersView;

-- QUE :- 5 >
----------------
SELECT username, order_total
FROM TopSpendersView
WHERE order_total > 2000
ORDER BY order_total DESC;



