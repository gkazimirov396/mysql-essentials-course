-- IN 
DELIMITER //

CREATE PROCEDURE get_location_info_sproc (IN location_name VARCHAR(255))
BEGIN
    SELECT l.name, l.country, l.region, l.coordinates 
    FROM locations AS l 
    WHERE l.name = location_name;
END//
 
DELIMITER ;


-- OUT
DELIMITER //

CREATE PROCEDURE get_trail_count_sproc (OUT trail_count INT)
BEGIN
    SELECT COUNT(t.id) INTO trail_count FROM trails AS t;
END//

DELIMITER ;
   


-- INOUT
DELIMITER //

CREATE PROCEDURE get_review_count_for_user_sproc (
    INOUT user_id INT
)
BEGIN
    DECLARE review_count INT;

    SELECT COUNT(r.id) INTO review_count FROM reviews AS r WHERE r.user_id = user_id;

    SET user_id = review_count;
END//

DELIMITER ;
   

-- Transaction
DELIMITER //

CREATE PROCEDURE update_review_transaction(
    IN review_id INT,
    IN new_title VARCHAR(255),
    IN new_content VARCHAR(255),
    IN new_date DATE
)
BEGIN
    DECLARE is_review_valid BOOLEAN;
    SET is_review_valid = YEAR(new_date) <= YEAR(CURRENT_TIMESTAMP());

    START TRANSACTION;

    UPDATE reviews AS r
    SET r.title = new_title
    WHERE r.id = review_id;

    UPDATE reviews AS r
    SET r.content = new_content
    WHERE r.id = review_id;

    UPDATE reviews AS r
    SET r.date_posted = new_date
    WHERE r.id = review_id;

    IF is_review_valid THEN
            COMMIT;
    ELSE
            ROLLBACK;
    END IF;
END//

DELIMITER ;
