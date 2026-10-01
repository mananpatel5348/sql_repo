USE insta_clone;

-- QUE :- 1 >
-----------------


CREATE TABLE Playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    play_count INT
);

INSERT INTO Playlists (song_name, artist, genre, play_count)
VALUES
("Tum Hi Ho", "Arijit Singh", "Bollywood", 120),
("Blinding Lights", "The Weeknd", "Pop", 250),
("Shape of You", "Ed Sheeran", "Pop", 180),
("Kesariya", "Arijit Singh", "Bollywood", 150),
("Perfect", "Ed Sheeran", "Pop", 200);

select * from playlists;

-- QUE - 2 >
---------------

SELECT song_name, artist AS Singer
FROM Playlists;

-- QUE - 3 >
------------------

SELECT * FROM playlists
WHERE genre = "Pop" AND play_count > 100
ORDER BY play_count desc;

-- QUE :- 4 >
----------------------

SELECT genre,
SUM(play_count)
from playlists
group by genre;


