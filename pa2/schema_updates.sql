CREATE TABLE trail_difficulty (
    trail_id INT,
    difficulty_id INT,
    
    PRIMARY KEY (trail_id, difficulty_id),
    FOREIGN KEY (trail_id) REFERENCES trails(id),
    FOREIGN KEY (difficulty_id) REFERENCES difficulties(id)
);
