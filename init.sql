/* This is using the trick Jordan showed us in class to build the working image, database before completely seeding the database with data. I really like this approach because it allows me to test the database structure and make sure everything is working before I add a lot of data. */

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS expiration;
DROP TABLE IF EXISTS save_ads;


CREATE TABLE users (
	user_id				serial PRIMARY KEY,
	first_name			varchar(255) NOT NULL,
	last_name			varchar(255),
	email				varchar(255) NOT NULL,
	password			varchar(255) NOT NULL
);


CREATE TABLE ads (
	ad_id				serial PRIMARY KEY,
	user_id		 		integer REFERENCES users, 
	title				varchar(255) NOT NULL, 
	body				varchar(255) NOT NULL, 
	price				integer NOT NULL, 
	posting_date		date NOT NULL
);


CREATE TABLE category (
	cat_id				serial PRIMARY KEY,
	ad_id				integer REFERENCES ads, 
	cat_name			varchar(255) NOT NULL
);


CREATE TABLE location (
	loc_id				serial PRIMARY KEY,
	ad_id				integer REFERENCES ads,
	city				varchar(255) NOT NULL,
	state				varchar(255) NOT NULL
);

CREATE TABLE expiration (
	exp_id				serial PRIMARY KEY,
	ad_id				integer REFERENCES ads,
	expired				boolean
);

CREATE TABLE save_ads (
	save_id				serial PRIMARY KEY,
	user_id				integer REFERENCES users,
	ad_id				integer REFERENCES ads 
);


INSERT INTO users (first_name, last_name, email, password) VALUES
('John', 'Doe', 'john.doe@example.com', 'password123');
INSERT INTO users (first_name, last_name, email, password) VALUES
('Jane', 'Smith', 'jane.smith@example.com', 'password456');
INSERT INTO users (first_name, last_name, email, password) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 'password789');

INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(1, 'iPhone 12 for sale', 'Selling my iPhone 12 in good condition.', 500, '2023-01-15');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(2, 'Used Laptop', 'A used laptop with 8GB RAM and 256GB SSD.', 300, '2023-02-10');
INSERT INTO ads (user_id, title, body, price, posting_date) VALUES
(3, 'Mountain Bike', 'A mountain bike suitable for off-road trails.', 200, '2023-03-05');

INSERT INTO category (ad_id, cat_name) VALUES
(1, 'Electronics');
INSERT INTO category (ad_id, cat_name) VALUES
(2, 'Computers');
INSERT INTO category (ad_id, cat_name) VALUES
(3, 'Sports');

INSERT INTO location (ad_id, city, state) VALUES
(1, 'New York', 'NY');
INSERT INTO location (ad_id, city, state) VALUES
(2, 'Los Angeles', 'CA');
INSERT INTO location (ad_id, city, state) VALUES
(3, 'Denver', 'CO');

INSERT INTO expiration (ad_id, expired) VALUES
(1, false);
INSERT INTO expiration (ad_id, expired) VALUES
(2, false);
INSERT INTO expiration (ad_id, expired) VALUES
(3, false);

INSERT INTO save_ads (user_id, ad_id) VALUES
(1, 2);
INSERT INTO save_ads (user_id, ad_id) VALUES
(2, 1);
INSERT INTO save_ads (user_id, ad_id) VALUES
(3, 3);


-- Added Aliases so I don't have to remember the full syntax for the docker commands

-- buildcraig='docker build -t craigslist_db .'
-- runcraig='docker run --name craigslist --rm -e POSTGRES_PASSWORD=password -p 5454:5432 -d craigslist_db'
-- pgcraig='PGPASSWORD=password pgcli -h localhost -p 5454 -U postgres -d craigslist'


