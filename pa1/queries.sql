SELECT trails.name, trails.elevation 
FROM trails 
INNER JOIN difficulties ON trails.difficulty_id = difficulties.id 
WHERE difficulties.name IN ("Moderate", "Difficult") 
ORDER BY trails.elevation DESC;

SELECT trails.name, AVG(ratings.score) as avg_rating 
FROM trails 
INNER JOIN ratings ON trails.id = ratings.trail_id 
GROUP BY trails.id 
HAVING AVG(ratings.score) >= 4 
ORDER BY avg_rating DESC;

SELECT trails.name, trails.length 
FROM trails 
INNER JOIN locations ON trails.location_id = locations.id 
WHERE locations.region = "Rocky Mountains" 
ORDER BY trails.length ASC;
