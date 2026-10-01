use insta_clone;

-- QUE :- 1 >
---------------

CREATE TABLE influencer(
	influencer_id int primary key,
    name varchar(50)
);

INSERT INTO influencer (influencer_id, name)
VALUES
(1, 'Jignesh Patel'),
(2, 'Hetal Desai'),
(3, 'Yash Shah'),
(4, 'Dhruvi Mehta'),
(5, 'Parth Trivedi');

INSERT INTO influencer (influencer_id, name)
value (6, 'khajur bhai');

CREATE TABLE post(
	post_id int primary key,
    influencer_id  int,
    caption varchar(150),
    foreign key (influencer_id) references influencer(influencer_id)
);

INSERT INTO post (post_id, influencer_id, caption) VALUES
(101, 1, 'Ahmedabad ni street food journey'),
(102, 1, 'Gujarati food review'),
(103, 2, 'Gujarati traditional fashion'),
(104, 2, 'Navratri special vlog'),
(105, 3, 'Garba night special'),
(106, 3, 'Gujarat travel vlog'),
(107, 4, 'Gujarati homemade food'),
(108, 4, 'Gujarati recipe video'),
(109, 5, 'Gujarat na beautiful places'),
(110, 5, 'Gujarati culture vlog');

-- QUE :- 2 >
---------------

SELECT influencer.name,
post.caption
FROM influencer
INNER JOIN post
ON influencer.influencer_id = post.influencer_id;

-- QUE :- 3 >
----------------
SELECT influencer.influencer_id, influencer.name,
COALESCE(post.caption, 'No Posts') AS caption
FROM influencer
LEFT JOIN post
ON influencer.influencer_id = post.influencer_id;

-- QUE :- 4 >
------------------

SELECT influencer.name,
post.post_id,post.caption
FROM influencer
RIGHT JOIN post
ON influencer.influencer_id = post.influencer_id;






