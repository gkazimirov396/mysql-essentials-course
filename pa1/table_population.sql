-- Populating tables
INSERT INTO difficulties (name, description) 
VALUES 
('Easy', 'Trail is well-maintained and has gentle inclines'), 
('Moderate', 'Trail has some steeper inclines but is still manageable for most hikers'), 
('Difficult', 'Trail is steep and rocky, requiring experienced hikers to navigate safely');

INSERT INTO locations (name, country, region, coordinates)
VALUES 
 ('Mountains', 'United States', 'Rocky Mountains', '39.5501° N, 105.7821° W'),
    ('Forest', 'Canada', 'British Columbia', '53.7267° N, 127.6476° W'),
    ('Lake District', 'United Kingdom', 'Cumbria', '54.4609° N, 3.0886° W'),
    ('Canyonlands', 'United States', 'Utah', '38.3269° N, 109.8783° W'),
    ('Coastline', 'Australia', 'New South Wales', '33.8688° S, 151.2093° E'),
    ('Valley', 'Switzerland', 'Lauterbrunnen Valley', '46.5958° N, 7.9075° E'),
    ('Desert', 'Namibia', 'Namib Desert', '24.4698° S, 15.1608° E'),
    ('Waterfall Country', 'Wales', 'Brecon Beacons', '51.8819° N, 3.4360° W'),
    ('Hills', 'India', 'Western Ghats', '10.8505° N, 76.2711° E'),
    ('Coastline', 'New Zealand', 'North Island', '40.9006° S, 174.8860° E');

INSERT INTO trails (name, length, elevation, description, image_url, location_id, difficulty_id) 
VALUES 
('Example Trail 1', 5.2, 800, 'This trail offers stunning views of the surrounding mountains and valleys.', 'https://example.com/trail1.jpg', 1, 2),
('Example Trail 2', 7.8, 1200, 'This trail winds through a forested area and has a beautiful waterfall.', 'https://example.com/trail2.jpg', 1, 1),
('Example Trail 3', 10.5, 1700, 'This strenuous trail offers unbelievable views at the summit.', 'https://example.com/trail3.jpg', 1, 3),
('Example Trail 4', 4.2, 600, 'This family-friendly trail has a picnic area and a lake for swimming.', 'https://example.com/trail4.jpg', 1, 1),
('Example Trail 5', 6.7, 1000, 'This trail is popular with birdwatchers and offers great wildlife viewing opportunities.', 'https://example.com/trail5.jpg', 1, 2),
('Example Trail 6', 8.9, 1400, 'This trail boasts breathtaking views of a nearby canyon.', 'https://example.com/trail6.jpg', 1, 3);

INSERT INTO users (name, email, password, profile_type) 
VALUES 
('John Doe', 'johndoe@example.com', 'password123', 'noob'),
('Jane Smith', 'janesmith@example.com', 'password456', 'regular'),
('Robert Johnson', 'robertjohnson@example.com', 'password789', 'pro');

INSERT INTO reviews (user_id, trail_id, title, content, date_posted) 
VALUES 
(1, 1, 'Great Hike', 'I had a great time on this trail. The views were amazing!', '2021-06-15'),
(2, 3, 'Tough Hike', 'This trail was very difficult but the views from the top were worth it.', '2021-06-17'),
(3, 2, 'Family-Friendly Trail', 'This was a perfect trail for my family with young children. We enjoyed the waterfall and picnic area.', '2021-06-20'),
(1, 4, 'Fun Day Out', 'The lake was great for swimming and we had a nice picnic lunch on this easy trail.', '2021-06-22'),
(2, 5, 'Birdwatching Paradise', 'I saw so many different birds on this trail. It was a great experience!', '2021-06-25');

INSERT INTO ratings (user_id, trail_id, difficulty_id, score) 
VALUES 
(1, 1, 1, 4.5),
(2, 3, 2, 5),
(3, 2, 3, 3.5),
(1, 4, 1, 4),
(2, 5, 3, 4.5);
