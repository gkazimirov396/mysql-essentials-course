-- = with non-correlated subqueries result:
SELECT l.name, l.country FROM locations AS l
WHERE l.id = (SELECT l.id FROM locations AS l WHERE l.country = "Canada" AND l.region = "British Columbia");

UPDATE locations AS l
SET l.country = "Amsterdam"
WHERE l.id = (SELECT l.id FROM locations AS l WHERE l.country = "Canada");

DELETE FROM locations AS l
WHERE l.id = (SELECT l.id FROM locations AS l WHERE l.country = "Canada");

-- IN with non-correlated subqueries result:
SELECT t.name, t.description
FROM trails AS t
WHERE t.id IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

UPDATE trails AS t
SET t.difficulty_id = (SELECT d.id FROM difficulties AS d WHERE d.name = 'Difficult')
WHERE t.id IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

DELETE FROM trails AS t
WHERE t.id IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

-- NOT IN with non-correlated subqueries result:
SELECT t.name, t.description
FROM trails AS t
WHERE t.id NOT IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

UPDATE trails AS t
SET t.difficulty_id = (SELECT d.id FROM difficulties AS d WHERE d.name = 'Difficult')
WHERE t.id NOT IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

DELETE FROM trails AS t
WHERE t.id NOT IN (SELECT r.trail_id FROM ratings AS r WHERE r.score > 4);

-- EXISTS with non-correlated subqueries result:
SELECT t.name FROM trails AS t
WHERE EXISTS (SELECT 1 FROM ratings AS r WHERE r.score < 3);

UPDATE trails AS t
SET t.description = "something"
WHERE EXISTS (SELECT 1 FROM reviews AS r WHERE r.score < 3);

DELETE FROM trails
WHERE EXISTS (SELECT 1 FROM reviews AS r WHERE r.score < 3);

-- NOT EXISTS with non-correlated subqueries result:
SELECT t.name FROM trails AS t
WHERE NOT EXISTS (SELECT 1 FROM ratings AS r WHERE r.score < 3);

UPDATE trails AS t
SET t.description = "something"
WHERE NOT EXISTS (SELECT 1 FROM reviews AS r WHERE r.score < 3);

DELETE FROM trails
WHERE NOT EXISTS (SELECT 1 FROM reviews AS r WHERE r.score < 3);

-- = with correlated subqueries result:
SELECT t.name FROM trails AS t
WHERE t.location_id = (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);

UPDATE trails AS t
SET t.length = t.length * 1.1
WHERE t.location_id = (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.name = 'Forest'
);

DELETE FROM trails AS t
WHERE t.location_id = (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.name = 'Forest'
);

-- IN with correlated subqueries result:
SELECT t.name
FROM trails AS t
WHERE t.location_id IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);

UPDATE trails AS t
SET t.description = "new desc"
WHERE t.location_id IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);

DELETE FROM trails AS t
WHERE t.location_id IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);
-- NOT IN with correlated subqueries result:
SELECT t.name
FROM trails AS t
WHERE t.location_id NOT IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);

UPDATE trails AS t
SET t.description = "new desc"
WHERE t.location_id NOT IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);

DELETE FROM trails AS t
WHERE t.location_id NOT IN (
    SELECT l.id
    FROM locations AS l
    INNER JOIN locations ON t.location_id = l.id
    WHERE l.country = 'United States' AND l.region = 'Rocky Mountains'
);
-- EXISTS with correlated subqueries result:
SELECT u.id, u.name FROM users AS u
WHERE EXISTS (
    SELECT 1
    FROM trails AS t
    INNER JOIN locations AS l ON t.location_id = l.id
    WHERE t.id IN (SELECT trail_id FROM reviews WHERE user_id = u.id)
    AND l.region = 'Utah'
);

UPDATE users AS u
SET u.profile_type = 'pro'
WHERE EXISTS (
    SELECT 1
    FROM trails AS t
    INNER JOIN locations AS l ON t.location_id = l.id
    WHERE t.id IN (SELECT trail_id FROM reviews WHERE user_id = u.id) 
    AND l.region = 'Utah'
);

DELETE FROM reviews AS r
WHERE EXISTS (
    SELECT 1
    FROM users
    WHERE users.id = r.user_id
);
-- NOT EXISTS with correlated subqueries result:
SELECT u.id, u.name FROM users AS u
WHERE NOT EXISTS (
    SELECT 1
    FROM trails AS t
    INNER JOIN locations AS l ON t.location_id = l.id
    WHERE t.id IN (SELECT trail_id FROM reviews WHERE user_id = u.id) 
    AND l.region = 'Utah'
);

UPDATE users AS u
SET u.profile_type = 'pro'
WHERE NOT EXISTS (
    SELECT 1
    FROM trails AS t
    INNER JOIN locations AS l ON t.location_id = l.id
    WHERE l.region = 'Utah'
);

DELETE FROM reviews AS r
WHERE NOT EXISTS (
    SELECT 1
    FROM users
    WHERE users.id = r.user_id
);
-- four queries

(SELECT t.name AS title, t.description AS content, NULL AS trail_id FROM trails AS t)
UNION
(SELECT r.title, r.content, r.trail_id FROM reviews AS r);

(SELECT t.name AS title, t.description AS content, NULL AS trail_id FROM trails AS t)
UNION ALL
(SELECT r.title, r.content, r.trail_id FROM reviews AS r);

(SELECT r.trail_id FROM reviews AS r)
INTERSECT
(SELECT rt.trail_id FROM ratings AS rt);

(SELECT r.trail_id FROM reviews AS r)
EXCEPT
(SELECT rt.trail_id FROM ratings AS rt);

