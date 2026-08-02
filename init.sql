-- This file runs against the default `postgres` database when the container
-- first starts. Build your schema here, then `docker build` + `docker run`.
--
-- Typical pattern (see cars-database for a fuller example):


create database craigslist;

\connect craigslist

CREATE TABLE Users ( --alias = us
	user_id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL,
	CHECK(first_name !~ '\s' AND last_name !~ '\s'),
	CHECK (email ~* '^\w+@\w+[.]\w+$'),
	   CHECK (
            LENGTH(password) >= 8
            AND password ~ '[A-Z]'      -- at least one uppercase
            AND password ~ '[a-z]'      -- at least one lowercase
            AND password ~ '[0-9]'      -- at least one number
            AND password ~ '[^A-Za-z0-9]' -- at least one symbol
    
);


CREATE TABLE Ads ( --alias = ad
	ad_id SERIAL PRIMARY KEY,
	user_id SERIAL UNIQUE NOT NULL REFERENCES Users(user_id),
	city TEXT NOT NULL,
    category_id INT UNIQUE NOT NULL,
    title TEXT NOT NULL,
	posting_date DATE NOT NULL,
    price INT NOT NULL,
    body TEXT NOT NULL,
	exp_date DATE NOT NULL,
);


CREATE TABLE Categories --alias = cat
(
	category_id SERIAL PRIMARY KEY,
	category_name TEXT,
	
);


CREATE TABLE saved_ads ( --alias = sd
	user_id INT UNIQUE NOT NULL REFERENCES Users(user_id),
	ad_id INT UNIQUE NOT NULL REFERENCES Ads(ad_id),
	saved_date DATE NOT NULL,

);


INSERT INTO Users VALUES
--user_id,first_name,last_name,email,password
43,Scotti,Sapsforde,ssapsforde0@sitemeter.com,$2a$04$khddKfCqxIeLXHcQGcYaqOU
75,Thatcher,Curtiss,tcurtiss1@cyberchimps.com,$2a$04$jvixeldKfwASYwOvqfYWFepe
82,Carrol,Stent,cstent2@ucla.edu,$2a$04$RcQb/69aU82fpOflo0TKTOREtyVNdaJCW0tb
73,Mark,Croizier,mcroizier3@gravatar.com,$2a$04$pkYDbEL2Bdx/GRrHEcjhuFaPO
76,Saunder,MacCracken,smaccracken4@utexas.edu,BMZ63u5B0/3retoUEp40ds20EblSm.uHagWIe
71,Frederique,Caseri,fcaseri5@cdbaby.com,$2a$04$U6FXc0VzkJw.prnOlan1dl43VYAS
56,Meggi,Manicom,mmanicom6@bing.com,$2a$04$9UEda/8dKOuAXOKAD04FseozQOKeHL.2VeXfWe
14,Damita,Baiyle,dbaiyle7@sbwire.com,$2a$04$bywwL/DGfcUMlLh5Mj0zw.3GEZlhm
78,Erin,Walbrun,ewalbrun8@jiathis.com,$2a$04$9e8vN659lUqdlX0e5ve/yuACTFNk.HOcr.QNy
18,Ferne,Mardling,fmardling9@blog.com,$2a$04$ZiQJTbjL/vi64jB0f0lg1OTPF.OF6otcRubC


INSERT INTO Ads VALUES


--ad_id,user_id,city,category_id,title,posting_date,price,body,exp_date
(5446000811,27,"Hurrion",68-824-6333,Pineapple Coconut Rice Mix,2026-04-29 05:42:07,3.99,"A flavorful blend of rice with tropical pineapple and coconut flavors.",2025-08-05 17:18:12);
(8221074764,61,"O'Hollegan",25-023-0481,Vintage Graphic Tee,2025-08-24 05:22:21,25.99,Retro-style graphic tee with a soft wash for a vintage feel.,2025-11-30 08:54:48);
6990854456,9,Minshall,63-523-5964,LED Disco Ball Light,2026-10-10 18:10:01,19.99,Fun light that creates a disco atmosphere for parties.,2025-08-20 20:41:24
2121147888,92,Whitlow,96-348-4301,Mechanical Pencil Set,2026-09-18 18:48:08,19.99,"Precision pencils for drawing, sketching, and writing.",2026-01-06 08:01:14
1288402554,49,Tiebe,77-848-3444,Portable Charcoal Grill,2026-06-04 16:14:01,89.99,Compact charcoal grill perfect for tailgating.,2026-06-13 11:53:39
4810676846,56,Lidgerton,12-328-7395,Kids Tablet,2026-09-12 11:46:29,129.99,Durable tablet designed for kids with parental controls.,2025-09-27 12:40:09
6540327919,61,Rennie,83-230-3850,Canned Coconut Milk,2025-12-25 11:25:08,1.89,"Rich coconut milk, great for cooking and baking.",2026-01-03 16:13:47
4210415839,99,Keeffe,43-397-5298,Biodegradable Trash Bags,2026-11-07 14:07:32,12.99,Eco-friendly trash bags that break down naturally.,2025-12-23 07:45:28
8256929405,11,Coggins,97-193-1741,Bamboo Memory Foam Pillow,2026-07-10 11:10:56,34.99,Ergonomically designed pillow with breathable bamboo cover.,2026-04-05 12:50:16
7222282025,88,Primo,75-887-1440,Classic Vanilla Fudge,2026-04-25 12:38:42,4.49,"Creamy vanilla fudge, a sweet treat for all occasions.",2025-08-09 11:39:11
1775147061,47,Bouskill,90-679-7721,Black Bean Soup,2025-11-29 12:34:07,3.49,"Spicy and flavorful soup made with black beans, perfect as a meal or starter.",2026-02-18 08:52:00
3050244925,39,Bayley,34-103-7124,Frozen Hash Browns,2025-09-19 00:09:24,2.99,"Shredded potatoes, perfect for breakfasts.",2026-01-19 13:17:29
0310198461,79,Strood,11-765-5567,Raspberry Lemonade Mix,2025-11-27 18:20:45,3.99,"A refreshing drink mix that combines sweet raspberries and tart lemons, perfect for summer.",2026-06-12 18:37:50
4701523208,66,Conklin,87-510-2186,Classic BBQ Sauce,2025-12-04 19:04:25,2.79,Smoky and sweet BBQ sauce for grilling and dipping.,2025-09-11 06:29:16
9718783571,19,Tice,14-240-3553,Trail Mix (Deluxe),2026-01-20 20:23:14,4.59,"A delightful mix of nuts, fruit, and chocolate.",2025-11-25 18:04:31
1291340017,20,Akram,05-052-2067,Silicone Ice Cube Tray,2026-08-03 08:21:18,10.99,Flexible tray for easy-release ice cubes.,2026-04-05 21:31:59
0684000016,90,Taks,81-753-6727,Puffer Winter Coat,2025-08-29 21:06:43,99.99,A warm and stylish puffer coat perfect for winter weather.,2026-01-26 23:49:11
5788075580,91,Pervew,23-676-2334,Chocolate Hazelnut Spread,2025-10-17 02:23:43,5.99,"A creamy spread made with chocolate and hazelnuts, perfect for toast.",2026-05-06 13:29:04
2454686813,28,Purple,04-714-0241,Scent Diffuser Oil,2025-11-18 02:06:13,14.99,Essential oil blends for a soothing atmosphere in your home.,2026-04-01 02:44:56
5890829971,16,Montgomery,62-769-0653,Digital Stopwatch Timer,2026-09-08 05:13:38,12.99,Accurate stopwatch for timing events and workouts.,2026-01-01 08:11:01
8009616389,54,Goodge,01-539-7487,Electric Rice Cooker,2025-11-23 13:11:09,39.99,Multi-function rice cooker for all types of rice recipes.,2025-09-05 22:00:48
6582941283,50,Archbould,93-713-7190,Electric Wax Warmer,2025-08-09 12:25:23,22.99,Wax warmer for creating a soothing atmosphere with fragrances.,2026-03-06 14:20:09
6881195710,29,Lothlorien,31-493-9968,Steak Seasoning Rub,2026-09-10 03:12:40,2.49,A blend of spices perfect for seasoning steak.,2026-06-17 00:39:21
0412327295,55,Maudett,73-845-0211,Home Brewing Starter Kit,2026-03-06 00:16:19,79.99,All-in-one kit for brewing beer at home.,2026-06-27 23:48:13
1700372505,55,Dullingham,88-375-1815,Organic Blueberries,2025-11-03 21:00:53,5.49,Fresh organic blueberries perfect for snacking or baking.,2026-04-23 09:55:49
1742878202,48,Sarfass,07-121-2594,Heated Throw Blanket,2026-09-18 11:06:31,49.99,Soft blanket that provides warmth with adjustable settings.,2026-06-08 16:26:32
7160770803,35,Schimpke,56-588-7572,Fishing Tackle Box,2025-10-19 09:00:06,24.99,Organized tackle box for fishing gear.,2025-12-07 18:51:19
6499770590,24,Dregan,35-154-2466,Smart Light Switch,2026-09-27 09:01:38,29.99,Control lights remotely with this smart switch.,2025-11-04 22:43:32
2264159731,3,Oxbury,27-061-1038,Chocolate Mint Cookies,2026-04-10 04:02:32,2.29,Delicious cookies with rich chocolate flavor and a hint of mint.,2026-06-11 16:04:29
9544249990,5,Cornelisse,43-104-4967,Sports Windbreaker,2026-02-06 08:24:18,44.99,Lightweight windbreaker for outdoor activities.,2025-08-27 07:30:13
0527517674,85,Marcombe,12-597-1364,Blue Corn Tortilla Chips,2026-03-27 20:13:51,3.49,"Crunchy chips made from blue corn, perfect for dipping.",2026-02-07 16:16:47
3057795986,3,Mc Kellen,50-203-9723,Pet Travel Bowl,2025-12-01 04:51:21,10.99,Collapsible travel bowl for pets on the go.,2025-12-14 22:58:31
2643313054,66,Pratley,63-480-9171,Pet Water Bottle,2025-11-15 16:33:41,18.99,Portable water bottle for pets when traveling.,2025-12-18 05:37:14
9575203771,41,Snel,46-308-6174,Multi-Tool,2025-08-16 19:37:00,39.99,Versatile multi-tool with 15 different functions.,2026-07-04 11:39:24
2232008738,73,Diegan,95-517-0449,Cinnamon Rolls,2025-08-09 13:52:15,4.49,"Sweet and gooey cinnamon rolls, ready to bake.",2025-12-23 15:37:52
2593930322,26,Medcraft,37-279-4103,Spice Rack,2025-09-09 02:21:12,39.99,Rotating spice rack with 20 spice jars.,2025-12-02 11:56:15
