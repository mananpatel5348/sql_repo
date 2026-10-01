USE insta_clone;

-- QUE :- 1 >
-----------------

CREATE TABLE restaurants(
	id int primary key auto_increment,
    name varchar(100),
    location varchar(100),
    rating decimal (2,1)
);

-- QUE :- 2 >
-----------------

ALTER TABLE restaurants
ADD avg_cost int;

select * from restaurants;


-- QUE :- 3 >
----------------

DROP TABLE restaurants;

-- QUE :- 4 >
------------------

CREATE TABLE playlist(
	playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    created_by VARCHAR(50),
    created_at DATE
);


