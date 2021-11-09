--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

-- Join query of my choice over atleast two of the tables in that database (read-only)
SELECT Player.name, score 
  FROM Player, PlayerGame, Game 
WHERE Player.ID = PlayerGame.playerID 
  AND PlayerGame.gameID = Game.ID 
  AND Game.ID = 2
  ;
