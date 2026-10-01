USE insta_clone;

-- QUE :- 1 >
---------------
CREATE TABLE Restaurants(
	id int primary key auto_increment,
    name varchar(50),
    cuisine varchar(50),
    rating decimal(2,1),
    city varchar(20)
);

INSERT INTO Restaurants(name,cuisine,rating,city)
values
("lili vadi","gujrati",5,"ahemdabad"),
("honest","gujrati",3.6,"ahemdabad"),
("domino's","indian",4.6,"ahemdabad"),
("raguvanshi thal","kathiyavadi",3.9,"ahemdabad"),
("kokomo","fast food",4.9,"gandhinagar");

-- QUE :- 2 >
-----------------

update Restaurants
SET rating = 4.7
WHERE name = "lili vadi";

select * from Restaurants;

-- QUE :- 3 >
---------------

INSERT INTO Restaurants(name,cuisine,rating,city)
values
("rasthal","gujrati",3.2,"ahemdabad"),
("abcd","punjabi",2.6,"mehsana");

DELETE FROM Restaurants
WHERE rating < 3.5;

SET SQL_SAFE_UPDATES = 1;

-- QUE :- 4 >
------------------

select * from Restaurants
where city = "ahemdabad" and rating > 4.0
order by rating desc
limit  2;



