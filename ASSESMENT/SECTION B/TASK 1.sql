CREATE DATABASE foodapp_db;

USE foodapp_db;

CREATE TABLE restaurants(
	restaurant_id int primary key auto_increment,
    name varchar(50) not null,
    city varchar(50),
    cuisine_type varchar(20),
    rating decimal(3,1)
);

INSERT INTO restaurants(name,city,cuisine_type,rating)
values
("annapurna","palanpur","gujrati",4.9),
("kokomo","ahemdabad","fast food",4.5),
("dadas","mumbai","chaines",3.4),
("sasuma","palanpur","gujrati",4.2),
("mamadev","ahemdabad","kathiyavadi",3.5),
("burger king","mumbai","fast food",4.3);

select * from restaurants;

SET SQL_SAFE_UPDATES = 0;

update restaurants
set rating = 4.7
where name = "annapurna";

DELETE FROM restaurants
WHERE restaurant_id = 6;

SELECT * FROM restaurants
ORDER BY rating DESC;