-- This file runs against the default `postgres` database when the container
-- first starts. Build your schema here, then `docker build` + `docker run`.

CREATE DATABASE craigslist;

\connect craigslist

-- us
CREATE TABLE Users (
	user_id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL,
	password TEXT NOT NULL,
	CHECK(first_name !~ '\s' AND last_name !~ '\s'),
	CHECK (email ~* '^\w+@\w+[.]\w+$'),
	CHECK (char_length(password)>=8)
);

-- ct
CREATE TABLE Categories (
	cat_id SERIAL PRIMARY KEY,
	cat_name TEXT NOT NULL
);

-- ad (primary table)
CREATE TABLE Ads (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(user_id),
    category_id INT NOT NULL REFERENCES Categories(cat_id),
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL,    
    post_date DATE NOT NULL,
    exp_date DATE NOT NULL,
	city TEXT NOT NULL
);

-- sa
CREATE TABLE SavedAds(
	user_id INT NOT NULL REFERENCES Users(user_id),
	ad_id INT NOT NULL REFERENCES Ads(id),
	saved_date DATE NOT NULL,
	PRIMARY KEY (user_id, ad_id)
);

INSERT INTO Users (user_id, first_name, last_name, email, password) VALUES
(6868,'Witty','Bryenton','wbryenton0@1688.com','zL4\udp4yd'),
(1518,'Gilburt','McQuillin','gmcquillin1@technorati.com','bH9$odxCWcexuN'),
(183,'Tybie','Treble','ttreble3@canalblog.com','oW1,l,3_VLW_2<'),
(28,'Vick','Chilton','vchilton4@printfriendly.com','xK8#qq*?ivATw'),
(77,'Sadye','Winpenny','swinpenny5@wisc.edu','qZ41*v*>|UG+'),
(700,'Padriac','Oliffe','poliffe6@github.com','lH6!ueu%=4Y<1WM'),
(411,'Christophorus','Beall','cbeall7@howstuffworks.com','eP1=vq!Vb@X'),
(916,'Eddie','Povlsen','epovlsen8@hao123.com','sJ3,\$SFw#\87%'),
(237,'Gavan','Nevill','gnevill9@apple.com','bV6_HUR2N3JOP?N');

-- cat_id will auto-assign 1-10 in the order below
INSERT INTO Categories (cat_name) VALUES
('Home & Garden'),
('Food & Grocery'),
('Kids'),
('Kitchen'),
('Clothing'),
('Electronics'),
('Sports & Outdoors'),
('Pets'),
('Furniture'),
('Health & Wellness');


-- user_id values map to the real Users.user_id values
INSERT INTO Ads (user_id, category_id, title, body, price, post_date, exp_date, city) VALUES
(6868, 1, 'Outdoor Folding Table', 'Lightweight and portable folding table for camping or picnics.', 39.99, '2026-02-18', '2026-07-20', 'Oceanside'),
(1518, 2, 'Artisan Bread Loaf', 'Fresh artisan bread, perfect for sandwiches', 3.99, '2026-02-07', '2025-10-22', 'Austin'),
(183, 4, 'Microwave Popcorn Maker', 'Healthier way to make popcorn in the microwave without oil.', 19.99, '2026-02-18', '2026-05-04', 'Chicago'),
(28, 2, 'Frozen Chicken Nuggets', 'Crispy chicken nuggets for quick meals.', 4.49, '2025-09-13', '2026-03-22', 'Orlando'),
(77, 3, 'Kids Crafting Station', 'Complete station with supplies for kids art projects.', 49.99, '2025-10-02', '2026-07-05', 'Chatanooga'),
(700, 4, 'Electric Rice Cooker', 'Multi-function rice cooker for all types of rice recipes.', 39.99, '2025-12-10', '2026-03-08', 'Cane'),
(411, 5, 'Pleated Midi Dress', 'A stylish midi dress with stylish pleats, suitable for any occasion.', 79.99, '2026-05-31', '2025-12-18', 'Los Angeles'),
(916, 2, 'Cauliflower Rice Stir-Fry', 'Frozen cauliflower rice blended with mixed vegetables and seasonings.', 4.99, '2026-05-16', '2026-02-10', 'San Francisco'),
(237, 3, 'Childrens Educational Workbook', 'Activity workbook for early learning and fun.', 12.99, '2026-01-25', '2025-10-20', 'Oahu'),
(6868, 2, 'Coconut Oil Spray', 'A zero-calorie coconut oil spray for cooking and baking.', 4.99, '2026-02-03', '2025-08-16', 'Newport Beach'),
(1518, 1, 'Under Desk Footrest', 'Adjustable footrest for improved comfort while sitting.', 29.99, '2025-11-21', '2026-04-10', 'Tustin'),
(183, 2, 'Apricot Jam', 'Sweet and tangy jam made from natural apricots.', 4.29, '2025-11-06', '2025-10-21', 'San Clemente'),
(28, 2, 'Vegetarian Pizza', 'Frozen pizza loaded with vegetables and cheese.', 5.49, '2026-01-20', '2025-11-14', 'Paris'),
(77, 1, 'Over-the-Door Shoe Organizer', 'Space-saving solution to store shoes and keep them organized.', 22.99, '2026-04-29', '2025-09-19', 'Flossmoor'),
(700, 2, 'Balsamic Glazed Brussels Sprouts', 'Roasted Brussels sprouts drizzled with balsamic glaze.', 4.99, '2026-07-29', '2025-08-29', 'Carmel'),
(411, 1, 'Window Bird Feeder', 'Suction cup bird feeder for close-up bird watching.', 19.99, '2026-02-05', '2025-11-06', 'Tampa'),
(916, 5, 'Bamboo Cotton Tank Top', 'Sustainable tank top made of bamboo cotton, offering breathability and comfort.', 22.99, '2026-07-12', '2025-09-30', 'Phoenix'),
(237, 2, 'Vegetable Pizza Rolls', 'Frozen pizza rolls filled with vegetables and cheese, perfect for snacks.', 6.49, '2026-03-05', '2026-07-21', 'New York'),
(6868, 4, 'Coconut Bowls Set', 'Handmade eco-friendly bowls made from real coconuts.', 22.99, '2026-04-20', '2026-01-16', 'Lagunas'),
(1518, 5, 'Plaid Flannel Shirt', 'Soft flannel shirt with a timeless plaid pattern, perfect for layering.', 29.99, '2025-09-22', '2026-06-26', 'Salt Lake City'),
(183, 4, 'Fruit Infuser Water Bottle', 'Water bottle designed to infuse flavors from fruits.', 15.99, '2025-09-01', '2025-11-22', 'Homewood'),
(28, 2, 'Maple Pecan Oatmeal Cookies', 'Soft oatmeal cookies with maple and pecans.', 3.99, '2025-11-08', '2026-01-05', 'Baltimore'),
(77, 8, 'Adjustable Pet Grooming Table', 'Professional grooming table with adjustable height.', 109.99, '2026-02-24', '2026-01-13', 'Quantico'),
(700, 2, 'Pasta Primavera Kit', 'Quick meal kit with pasta and fresh vegetables.', 7.49, '2025-09-23', '2025-08-28', 'Palm Springs'),
(411, 2, 'Fresh Basil Pesto', 'A fresh, flavorful basil pesto for pasta and more', 4.79, '2026-02-04', '2026-03-08', 'Hollywood'),
(916, 7, 'Insulated Cooler', 'Leak-proof cooler bag ideal for picnics and camping.', 39.99, '2025-10-10', '2026-05-26', 'Oceanside'),
(237, 7, 'High-Quality Yoga Block', 'Foam yoga block for enhancing poses and stability.', 12.99, '2025-10-02', '2025-08-31', 'Laguna Hills'),
(6868, 5, 'Knitted Infinity Scarf', 'A warm knitted scarf to keep you cozy in winter.', 29.99, '2026-03-21', '2025-10-01', 'San Juan Capistrano'),
(1518, 6, 'Smart Thermostat with Wi-Fi', 'Wi-Fi enabled thermostat that learns your habits.', 169.99, '2025-12-06', '2026-03-27', 'San Clemente'),
(183, 10, 'Weighted Blanket', 'Therapeutic weighted blanket for better sleep.', 79.99, '2026-06-07', '2026-05-06', 'San Francisco'),
(28, 2, 'Lasagna Noodles', 'Wide pasta sheets for making lasagna.', 1.89, '2025-10-10', '2025-10-17', 'Winter Park'),
(77, 2, 'Sweet Potatoes (organic)', 'Fresh organic sweet potatoes, great for roasting or mashing.', 1.99, '2026-03-25', '2026-07-26', 'Fort Myers'),
(700, 9, 'Mobile Workbench', 'Sturdy mobile workbench with storage options.', 199.99, '2026-06-21', '2025-09-21', 'Dana Point'),
(411, 6, 'Wireless Mouse', 'Ergonomic wireless mouse with adjustable DPI.', 25.99, '2026-06-21', '2026-04-25', 'San Diego'),
(916, 2, 'Organic Baby Spinach', 'Fresh baby spinach leaves, great for salads and smoothies.', 2.99, '2026-05-25', '2026-07-23', 'Reno'),
(237, 2, 'Smoked Paprika', 'Add a smoky flavor to your dishes.', 2.99, '2026-02-26', '2026-07-30', 'Las Vegas');
 