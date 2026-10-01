use insta_clone;

-- que :-1 >
-----------------

CREATE TABLE playliste (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    name VARCHAR(255),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- QUE :- 2 >
------------------
INSERT INTO playliste (user_id, name, created_at)
VALUES
    (1, 'Workout Mix', '2026-09-15 07:30:00'),
    (2, 'Chill Vibes', '2026-09-18 20:15:00'),
    (3, 'Top Hits', '2026-09-25 18:45:00');
    
    SELECT * from playliste;
    
    -- QUE :- 3 >
    ---------------------
    
UPDATE playliste
SET name = 'Evening Chill'
WHERE user_id = 2;
    
    
    -- QUE :- 4 >
    -----------------
    
DELETE FROM playliste
WHERE name = 'Workout Mix'
  AND user_id = 1;
  
  -- QUE :- 5 >
  --------------------
  
 DROP PROCEDURE IF EXISTS GetMonthlyPlaylistCount;

DELIMITER //

CREATE PROCEDURE GetMonthlyPlaylistCount(
    IN p_user_id INT,
    IN p_month INT
)
BEGIN
    SELECT COUNT(*) AS total_playliste
    FROM playliste
    WHERE user_id = p_user_id
      AND MONTH(created_at) = p_month;
END //

DELIMITER ;

CALL GetMonthlyPlaylistCount(2, 9);