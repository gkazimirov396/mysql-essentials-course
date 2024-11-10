SELECT trails.id, diff.name, trails.difficulty_id FROM difficulties AS diff
    INNER JOIN trail_difficulty AS td ON diff.id = td.difficulty_id
    INNER JOIN trails ON trails.id = td.trail_id;

SELECT u.name AS user_name
FROM users AS u
INNER JOIN ratings AS r ON r.user_id = u.id
INNER JOIN difficulties AS diff ON r.difficulty_id = diff.id
WHERE diff.name = "Difficult"
GROUP BY u.name
HAVING COUNT(diff.name) = (
    SELECT MAX(diff_count)
    FROM (
        SELECT COUNT(diff.name) AS diff_count
        FROM users AS u
        INNER JOIN ratings AS r ON r.user_id = u.id
        INNER JOIN difficulties AS diff ON r.difficulty_id = diff.id
        WHERE diff.name = "Difficult"
        GROUP BY u.name
    ) AS max_diff_count
);
