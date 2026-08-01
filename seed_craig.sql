-- Seed the data with new data

INSERT INTO users (first_name, last_name, email, password) VALUES
('Bob', 'Williams', 'bob.williams@example.com', 'password321');
INSERT INTO users (first_name, last_name, email, password) VALUES
('Emily', 'Brown', 'emily.brown@example.com', 'password654');
INSERT INTO users (first_name, last_name, email, password) VALUES
('Michael', 'Davis', 'michael.davis@example.com', 'password987');

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(4, 'Gaming Console', 'A gaming console with two controllers.', 400, '2023-04-20');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(5, 'Smartwatch', 'A smartwatch with fitness tracking features.', 150, '2023-05-15');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(6, 'Digital Camera', 'A digital camera with 20MP resolution.', 250, '2023-06-10');

INSERT INTO category (ad_id, cat_name) VALUES
(4, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(5, 'Wearables');
INSERT INTO category (ad_id, cat_name) VALUES
(6, 'Photography');

INSERT INTO location (ad_id, city, state) VALUES
(4, 'Chicago', 'IL');
INSERT INTO location (ad_id, city, state) VALUES
(5, 'Houston', 'TX');
INSERT INTO location (ad_id, city, state) VALUES
(6, 'San Francisco', 'CA');

INSERT INTO expiration (ad_id, expired) VALUES
(4, false);
INSERT INTO expiration (ad_id, expired) VALUES
(5, false);
INSERT INTO expiration (ad_id, expired) VALUES
(6, false);

INSERT INTO save_ads (user_id, ad_id) VALUES
(4, 5);
INSERT INTO save_ads (user_id, ad_id) VALUES
(5, 4);
INSERT INTO save_ads (user_id, ad_id) VALUES
(6, 6);


-- Seeding additional data to test the CTE

-- Additional ads for existing users (same person, different items)

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(4, 'Office Desk', 'Adjustable standing desk, barely used.', 180, '2023-04-25');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(4, 'Bluetooth Speaker', 'Portable speaker with 12hr battery life.', 60, '2023-05-02');

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(5, 'Road Bike', 'Lightweight aluminum frame, size medium.', 320, '2023-05-20');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(5, 'Air Fryer', '5.8qt capacity, includes recipe book.', 70, '2023-06-01');

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(6, 'Drone with Camera', '4K drone, low flight hours.', 500, '2023-06-15');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(6, 'Electric Guitar', 'Fender Stratocaster, includes case.', 450, '2023-07-01');


INSERT INTO category (ad_id, cat_name) VALUES
(7, 'Furniture');
INSERT INTO category (ad_id, cat_name) VALUES
(8, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(9, 'Sports');
INSERT INTO category (ad_id, cat_name) VALUES
(10, 'Home & Kitchen');
INSERT INTO category (ad_id, cat_name) VALUES
(11, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(12, 'Musical Instruments');


INSERT INTO location (ad_id, city, state) VALUES
(7, 'Chicago', 'IL');
INSERT INTO location (ad_id, city, state) VALUES
(8, 'Chicago', 'IL');
INSERT INTO location (ad_id, city, state) VALUES
(9, 'Houston', 'TX');
INSERT INTO location (ad_id, city, state) VALUES
(10, 'Houston', 'TX');
INSERT INTO location (ad_id, city, state) VALUES
(11, 'San Francisco', 'CA');
INSERT INTO location (ad_id, city, state) VALUES
(12, 'San Francisco', 'CA');


INSERT INTO expiration (ad_id, expired) VALUES
(7, false);
INSERT INTO expiration (ad_id, expired) VALUES
(8, false);
INSERT INTO expiration (ad_id, expired) VALUES
(9, false);
INSERT INTO expiration (ad_id, expired) VALUES
(10, false);
INSERT INTO expiration (ad_id, expired) VALUES
(11, false);
INSERT INTO expiration (ad_id, expired) VALUES
(12, false);


-- Additional ads with overlapping categories for aggregation practice

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(1, 'Wireless Earbuds', 'Noise-cancelling, barely used.', 90, '2023-07-10');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(2, 'Tablet', '10-inch tablet, 64GB storage.', 200, '2023-07-15');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(3, 'Tennis Racket', 'Wilson racket, good condition.', 45, '2023-07-20');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(4, 'Soccer Ball', 'Official size 5, barely used.', 20, '2023-07-25');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(5, 'Laptop', '13-inch, 16GB RAM, 512GB SSD.', 700, '2023-08-01');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(6, 'Basketball Hoop', 'Adjustable height, portable stand.', 120, '2023-08-05');


INSERT INTO category (ad_id, cat_name) VALUES
(13, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(14, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(15, 'Sports');
INSERT INTO category (ad_id, cat_name) VALUES
(16, 'Sports');
INSERT INTO category (ad_id, cat_name) VALUES
(17, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(18, 'Sports');


INSERT INTO location (ad_id, city, state) VALUES
(13, 'New York', 'NY');
INSERT INTO location (ad_id, city, state) VALUES
(14, 'Los Angeles', 'CA');
INSERT INTO location (ad_id, city, state) VALUES
(15, 'Denver', 'CO');
INSERT INTO location (ad_id, city, state) VALUES
(16, 'Chicago', 'IL');
INSERT INTO location (ad_id, city, state) VALUES
(17, 'Houston', 'TX');
INSERT INTO location (ad_id, city, state) VALUES
(18, 'San Francisco', 'CA');


INSERT INTO expiration (ad_id, expired) VALUES
(13, false);
INSERT INTO expiration (ad_id, expired) VALUES
(14, false);
INSERT INTO expiration (ad_id, expired) VALUES
(15, false);
INSERT INTO expiration (ad_id, expired) VALUES
(16, false);
INSERT INTO expiration (ad_id, expired) VALUES
(17, false);
INSERT INTO expiration (ad_id, expired) VALUES
(18, false);
