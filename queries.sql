CREATE DATABASE restaurants_db;
USE restaurants_db;

CREATE TABLE yelp_info (
id INT auto_increment PRIMARY KEY,
RestaurantName TEXT,
Rating VarChar(30),
Address Text
);

CREATE TABLE google_info (
id INT auto_increment PRIMARY KEY,
RestaurantName TEXT,
Rating VarChar(30),
Address Text
);

-- change column encoding for address and name or else error pops up
ALTER TABLE yelp_info MODIFY COLUMN Address Text
CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

CREATE TABLE restaurant_info
	SELECT * FROM yelp_info
    UNION
    Select * from google_info;
    
-- Remove Duplicate values

DELETE a
FROM 
	restaurant_info AS a,
	restaurant_info AS b
WHERE
    a.id < b.id

    AND a.RestaurantName <=> b.RestaurantName 
    AND a.Address <=> b.Address;

-- delete rows with incomplete addresses
Delete a
FROM restaurant_info AS a
WHERE a.Address = "Washington";
    
select * from restaurant_info
order by RestaurantName;
