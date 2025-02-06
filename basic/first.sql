-- Create a table named chai_db
CREATE TABLE chai_db (
  id           SERIAL PRIMARY KEY,  -- Primary key with auto-increment
  chai_name    VARCHAR(50),         -- Name of the chai
  price        DECIMAL(5,2),        -- Price of the chai with 2 decimal places
  chai_type    VARCHAR(50),         -- Type of the chai
  isAvailable  BOOLEAN              -- Availability status of the chai
);

-- Insert records into the chai_db table
INSERT INTO chai_db(chai_name, price, chai_type, isavailable) VALUES
('Masala Chai', 30.00, 'Spiced', TRUE),
('Green Chai', 35.00, 'Herbal', TRUE),
('Black Chai', 35.00, 'Cold', FALSE),
('Oolong Chai', 60.00, 'Special', TRUE);

-- Select all records from the chai_db table
SELECT * FROM chai_db;

-- Select chai_name and price columns from the chai_db table
SELECT chai_name, price FROM chai_db;

-- Select chai_name and price with aliases from the chai_db table
SELECT chai_name AS "Chai Name", price AS "Cost in INR" FROM chai_db;

-- Select all records where chai_name contains 'Chai'
SELECT * FROM chai_db WHERE chai_name LIKE '%Chai%';

-- Select all records where chai_name starts with 'Green'
SELECT * FROM chai_db WHERE chai_name LIKE 'Green%';

-- Select all records where price is less than or equal to 30
SELECT * FROM chai_db WHERE price <= 30;

-- Select all records ordered by price in descending order
SELECT * FROM chai_db ORDER BY price DESC;

-- Select all records ordered by price in ascending order
SELECT * FROM chai_db ORDER BY price;

-- Update the price and availability of 'Black Chai'
UPDATE chai_db SET price = 25, isavailable = TRUE WHERE chai_name = 'Black Chai';

-- Delete the record where chai_name is 'Black Chai'
DELETE FROM chai_db WHERE chai_name = 'Black Chai';