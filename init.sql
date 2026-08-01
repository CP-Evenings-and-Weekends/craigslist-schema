create database craigslist;

\connect craigslist

CREATE TABLE users (
    id            SERIAL PRIMARY KEY,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    email         TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE categories (
    id                    SERIAL PRIMARY KEY,
    name                  TEXT NOT NULL UNIQUE,
    default_lifetime_days INTEGER NOT NULL DEFAULT 30
);

CREATE TABLE locations (
    id    SERIAL PRIMARY KEY,
    name  TEXT NOT NULL,
    state TEXT
);

CREATE TABLE ads (
    id          SERIAL PRIMARY KEY,
    user_id     INTEGER NOT NULL REFERENCES users(id),
    category_id INTEGER NOT NULL REFERENCES categories(id),
    location_id INTEGER NOT NULL REFERENCES locations(id),
    title       TEXT NOT NULL,
    body        TEXT NOT NULL,
    price       NUMERIC(10, 2),
    posted_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    expires_at  TIMESTAMPTZ
);

CREATE TABLE saved_ads (
    user_id  INTEGER NOT NULL REFERENCES users(id),
    ad_id    INTEGER NOT NULL REFERENCES ads(id),
    saved_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, ad_id)
);

INSERT INTO categories (name, default_lifetime_days) VALUES
('for sale', 45),
('housing', 30),
('jobs', 14),
('services', 60);

INSERT INTO locations (name, state) VALUES
('Downtown', 'FL'),
('Winter Park', 'FL'),
('Apopka', 'FL');

INSERT INTO users (first_name, last_name, email, password_hash) VALUES
('Alice', 'Nguyen', 'alice@example.com', md5('alice@example.com')),
('Bob', 'Martinez', 'bob@example.com', md5('bob@example.com')),
('Carla', 'Dominguez', 'carla@example.com', md5('carla@example.com')),
('Derek', 'Osei', 'derek@example.com', md5('derek@example.com')),
('Emma', 'Choi', 'emma@example.com', md5('emma@example.com')),
('Franklin', 'Reyes', 'franklin@example.com', md5('franklin@example.com')),
('Grace', 'Kim', 'grace@example.com', md5('grace@example.com')),
('Hassan', 'Ali', 'hassan@example.com', md5('hassan@example.com')),
('Ines', 'Costa', 'ines@example.com', md5('ines@example.com')),
('Jamal', 'Brooks', 'jamal@example.com', md5('jamal@example.com'));

INSERT INTO ads (user_id, category_id, location_id, title, body, price, posted_at) VALUES
(1, 1, 1, 'Used mountain bike', 'Great condition, 21-speed, barely ridden.', 180.00, now() - INTERVAL '2 days'),
(1, 3, 2, 'Part-time barista wanted', 'Looking for a friendly barista, weekends only.', NULL, now() - INTERVAL '5 days'),
(2, 2, 1, 'Cozy 1BR downtown', 'Walk to everything, laundry in unit.', 1450.00, now() - INTERVAL '1 days'),
(2, 4, 3, 'Lawn mowing service', 'Weekly mowing and edging, free estimates.', 40.00, now() - INTERVAL '10 days'),
(3, 1, 2, 'IKEA couch, like new', 'Moving sale, must go this weekend.', 220.00, now() - INTERVAL '3 days'),
(3, 3, 1, 'Line cook needed', 'Busy downtown kitchen, experience preferred.', NULL, now() - INTERVAL '1 days'),
(4, 2, 3, 'Room for rent, quiet house', 'Shared kitchen and bath, utilities included.', 650.00, now() - INTERVAL '7 days'),
(4, 1, 1, 'PS5 with two controllers', 'Barely used, comes with three games.', 350.00, now() - INTERVAL '4 days'),
(5, 4, 2, 'Piano lessons', 'Beginner to intermediate, in-home lessons.', 30.00, now() - INTERVAL '6 days'),
(5, 1, 3, 'Dining table + 4 chairs', 'Solid wood, minor scratches.', 150.00, now() - INTERVAL '8 days'),
(6, 3, 1, 'Delivery driver, own car', 'Flexible hours, mileage reimbursed.', NULL, now() - INTERVAL '2 days'),
(6, 2, 2, '2BR apartment near park', 'Recently renovated, pet friendly.', 1600.00, now() - INTERVAL '3 days'),
(7, 1, 3, 'Electric guitar + amp', 'Great starter setup, includes gig bag.', 275.00, now() - INTERVAL '9 days'),
(7, 4, 1, 'House cleaning, weekly', 'Reliable, references available.', 60.00, now() - INTERVAL '1 days'),
(8, 3, 3, 'Warehouse associate', 'Full-time, morning shift, forklift cert a plus.', NULL, now() - INTERVAL '11 days'),
(8, 1, 2, 'Free moving boxes', 'About 20 boxes, various sizes, pickup only.', 0.00, now() - INTERVAL '12 days'),
(9, 2, 1, 'Studio downtown', 'Small but efficient, great natural light.', 1100.00, now() - INTERVAL '2 days'),
(9, 4, 3, 'Tutoring, math & science', 'High school and college level, evenings.', 35.00, now() - INTERVAL '4 days'),
(10, 1, 1, 'Road bike, size medium', 'Carbon frame, recently tuned up.', 400.00, now() - INTERVAL '5 days'),
(10, 3, 2, 'Office assistant', 'Part-time, front desk and scheduling.', NULL, now() - INTERVAL '3 days'),
(1, 2, 3, 'Duplex, 3BR/2BA', 'Fenced yard, garage, close to schools.', 1900.00, now() - INTERVAL '6 days'),
(2, 1, 2, 'Kids bike, size 16"', 'Outgrown, great condition.', 45.00, now() - INTERVAL '7 days'),
(3, 4, 1, 'Handyman services', 'Small repairs, furniture assembly, painting.', 50.00, now() - INTERVAL '2 days'),
(4, 3, 2, 'Retail associate', 'Weekend availability required.', NULL, now() - INTERVAL '9 days'),
(5, 2, 1, 'Shared room, downtown loft', 'Great roommates, walkable neighborhood.', 700.00, now() - INTERVAL '10 days'),
(6, 1, 3, 'Vintage record player', 'Fully functional, sounds great.', 120.00, now() - INTERVAL '1 days'),
(7, 3, 3, 'Freelance graphic designer', 'Project-based, logo and branding work.', NULL, now() - INTERVAL '4 days'),
(8, 4, 2, 'Pet sitting', 'Daily visits or overnight, insured.', 25.00, now() - INTERVAL '5 days'),
(9, 1, 1, 'Bookshelf, tall oak', 'Sturdy, 6 shelves, minor wear.', 65.00, now() - INTERVAL '3 days'),
(10, 2, 3, 'Furnished 1BR, month-to-month', 'All utilities included, flexible lease.', 1300.00, now() - INTERVAL '2 days');

INSERT INTO saved_ads (user_id, ad_id) VALUES
(1, 3),
(1, 8),
(1, 12),
(2, 1),
(2, 5),
(3, 7),
(3, 9),
(3, 17),
(4, 2),
(5, 4),
(5, 6),
(5, 30),
(6, 11),
(7, 15),
(7, 20),
(9, 21),
(9, 22);