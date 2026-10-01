-- QUE :- 2 >
--------------------

CREATE DATABASE insta_clone;
USE insta_clone;
CREATE TABLE users(
	user_id int primary key auto_increment,
    username varchar(50),
    email varchar(30),
    follower_count int
);
INSERT INTO 
users(username,email,follower_count)
values
("Manan_patel_2303","mananpatel123@gmail.com",840),
("jash_patel_5848", "jashpatel123@gmail.com",843),
("heetu_patel_1111", "heet1111@gmail.com",1545);

-- QUE :- 3 >
-----------------

CREATE TABLE posts(
	post_id int primary key auto_increment,
    user_id int,
    caption varchar(100),
    post_date date,
	foreign key (user_id) references users(user_id) 
);



