-- Retrieve all columns from the IGNGames table and order the results by release year, month, and day.
SELECT *
FROM [IGN Games Project]..IGNGames
ORDER BY release_year, release_month, release_day;

-- Show the count of games per score_phrase along with the average score, ordered by average score in descending order.
SELECT score_phrase, COUNT(title) AS NumberOfGames, ROUND(AVG(score),2) AS AverageScore
FROM [IGN Games Project]..IGNGames
GROUP BY score_phrase
ORDER BY AverageScore DESC;

-- Show which platform has the best games based on the average score and the total number of games per platform, ordered by average score in descending order.
SELECT platform, AVG(score) AS AverageScore, COUNT(Rank) AS NumberOfGames
FROM [IGN Games Project]..IGNGames
GROUP BY platform
ORDER BY AverageScore DESC;

-- Show the number of games per decade, grouping by the floor of release year divided by 10 and ordered by decade.
SELECT
  FLOOR(release_year / 10) * 10 AS decade,
  COUNT(*) AS num_games
FROM
  [IGN Games Project]..IGNGames
GROUP BY
  FLOOR(release_year / 10)
ORDER BY
  decade;

-- Show the most popular genres based on average score, ordered by average score in descending order.
SELECT
  genre,
  ROUND(AVG(score),2) AS average_score
FROM
  [IGN Games Project]..IGNGames
GROUP BY
  genre
ORDER BY
  average_score DESC;

-- Retrieve all columns from the IGNGames table where the genre starts with 'Hard', ordered by score in descending order.
SELECT * FROM [IGN Games Project]..IGNGames
WHERE genre LIKE 'Hard%'
ORDER BY score DESC;

-- Show the most popular platforms based on release year, where the score is greater than 9.0, ordered by the number of games in descending order.
SELECT
  platform,
  COUNT(*) AS num_games 
FROM [IGN Games Project]..IGNGames
WHERE score > 9.0
GROUP BY
  platform
ORDER BY
  num_games DESC;

-- Show the most popular platforms based on release year, with a score greater than 9.0, along with the percentage of high-score games, ordered by percentage and total games in descending order.
SELECT
  platform,
  COUNT(*) AS total_games,
  SUM(CASE WHEN score > 9.0 THEN 1 ELSE 0 END) AS high_score_games,
  (SUM(CASE WHEN score > 9.0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_high_score
FROM
  [IGN Games Project]..IGNGames
GROUP BY
  platform
ORDER BY
  percentage_high_score DESC, total_games DESC;

-- Show the most popular genres based on the number of critic's choices, ordered by the number of critic's choices in descending order.
SELECT
  genre,
  COUNT(*) AS num_critic_choices
FROM
  [IGN Games Project]..IGNGames
WHERE
  editors_choice = 'Y'
GROUP BY
  genre
ORDER BY
  num_critic_choices DESC;

