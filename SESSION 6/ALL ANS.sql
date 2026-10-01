USE insta_clone;

-- QUE :- 1 >
---------------- 

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);
INSERT INTO orders (order_id, user_id, order_date)
VALUES
(1, 101, '2026-09-01'),
(2, 102, '2026-09-02'),
(3, 101, '2026-09-03'),
(4, 103, '2026-09-04'),
(5, 101, '2026-09-05');

SELECT user_id,
COUNT(*) AS order_count
FROM orders
GROUP BY user_id;

-- QUE :- 2 >
------------------
SELECT * from restaurants;

SELECT name,
AVG (rating) AS avg_rating
FROM restaurants
group by name
having avg_rating > 4.0;

-- QUE :- 3 >
--------------------
CREATE TABLE payments(
	user_id int primary key auto_increment,
    amount int,
    payment_date date
);

INSERT INTO payments(amount,payment_date)
values
(1200,"2026-09-23"),
(1250,"2026-09-23"),
(2001,"2026-09-26"),
(2020,"2026-09-29"),
(3700,"2026-10-1");

SELECT user_id from payments
where amount > 2000;

-- QUE :- 4 >
---------------
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO movies (movie_id, movie_name, rating)
VALUES
(1, '3 Idiots', 4.8),
(2, 'Dangal', 4.5),
(3, 'RRR', 4.2),
(4, 'Pathaan', 3.5),
(5, 'KGF', 4.6),
(6, 'Jawan', 3.9);

SELECT movie_name, rating
FROM movies
WHERE rating > (SELECT AVG(rating) FROM movies);


