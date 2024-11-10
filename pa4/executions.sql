-- IN
SET @location_name = 'Hills';
CALL get_location_info_sproc(@location_name);

-- OUT
CALL get_trail_count_sproc(@trail_count);
SELECT @trail_count AS trail_count;

-- INOUT
SET @user_id = 3;
CALL get_review_count_for_user_sproc(@user_id);
SELECT @user_id AS user_id;

-- TRANSACTION
CALL update_review_transaction(1, 'New title', 'Boring description.', '2021-06-17');
CALL update_review_transaction(3, 'Another title', 'Another description.', '2025-03-08');
