-- Indexing:

-- trails
CREATE INDEX idx_trails_location_id ON trails(location_id);
CREATE INDEX idx_trails_name ON trails(name);

-- reviews
CREATE INDEX idx_reviews_trail_id ON reviews(trail_id);
CREATE INDEX idx_reviews_date_posted ON reviews(date_posted);

-- Views:

-- Europe
CREATE VIEW europe_trails_popularity AS
SELECT 
    t.name AS trail_name,
    t.image_url AS image,
    l.coordinates,
    t.description,
    GROUP_CONCAT(SUBSTRING_INDEX(r.content, '.', 2) ORDER BY r.date_posted DESC SEPARATOR ', ') AS recent_reviews
FROM trails AS t
INNER JOIN locations AS l ON t.location_id = l.id
INNER JOIN reviews AS r ON t.id = r.trail_id
WHERE l.region = 'Europe'
GROUP BY t.id
ORDER BY COUNT(r.id) DESC;

SELECT * FROM europe_trails_popularity;

-- North America
CREATE VIEW north_america_trails_popularity AS
SELECT 
    t.name AS trail_name,
    t.image_url AS image,
    l.coordinates,
    t.description,
    GROUP_CONCAT(SUBSTRING_INDEX(r.content, '.', 2) ORDER BY r.date_posted DESC SEPARATOR ', ') AS recent_reviews
FROM trails AS t
INNER JOIN locations AS l ON t.location_id = l.id
INNER JOIN reviews AS r ON t.id = r.trail_id
WHERE l.region = 'North America'
GROUP BY t.id
ORDER BY COUNT(r.id) DESC;

SELECT * FROM north_america_trails_popularity;
