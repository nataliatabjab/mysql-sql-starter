-- Part 1) The SELECT Statement

-- -- We first establish what database we want to use
USE sql_store

-- -- Select the data we want to retrieve
SELECT *
FROM customers
WHERE state = 'FL';jj

-- ...

-- Part 2) The SELECT Clause

-- -- The SELECT "statement" is the full instruction you give to the database;
-- -- The SELECT "clause" is just the SELECT keyword—a piece of this statement.

SELECT
first_name,
last_name,
points,
(points + 10) * 100 AS 'discount factor' 
FROM customers;

UPDATE customers
SET state="VA" WHERE customer_id=1;
SELECT DISTINCT state from customers;

-- Exercise: Return all the products (name, unit price, new price = unit price * 1.1)
SELECT
name,
unit_price,
unit_price * 1.1 AS 'new price'
FROM products;

-- ...

-- Part 3) The WHERE Clause
SELECT * FROM customers WHERE points > 3000;

-- -- Both != and <> mean "not equal to"
SELECT * FROM customers WHERE state <> 'MA';

-- -- Date format in MySQL is 'YYYY-MM-DD'
SELECT * FROM customers WHERE birth_date > '1990-01-01';

-- -- Exercise: Get orders placed this year (2019 at time of video)
SELECT order_id FROM orders WHERE order_date >= '2019-01-01';

-- ...

-- Part 4) The AND, OR, and NOT Operators 

-- AND operator -> stacks conditions
SELECT * FROM customers WHERE birth_date > '1990-01-01' AND points > 1000;

-- Order of Operations follows: AND > OR. Can override using ()
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR 
                              (points > 1000 AND state = 'VA'); 

-- NOT operator negates conditions
SELECT *
FROM customers
WHERE NOT (birth_date > '1990-01-01' AND points > 1000);

-- From the order_items table, get the items 
--      for order #6
--      where the total price is greater than 30

SELECT
product_id,
quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 6 AND (quantity * unit_price) > 30;

-- ...

-- Part 5) The IN Operator
SELECT *
FROM customers
WHERE state IN('VA', 'FL', 'GA');

-- Exercise: Return products with
-- quantity in stock equal to 49, 38, 72

SELECT * FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- ...

-- Part 6) The BETWEEN Operator

SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 30000

-- Exercise: Return customers born between 1/1/1990 and 1/1/2000

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';

-- ...

-- Part 7) The LIKE Operator

-- Retrieve rows that match a specific string pattern

SELECT * FROM customers WHERE last_name LIKE 'b%'; -- last names starting with b
SELECT * FROM customers WHERE last_name LIKE '%b%'; -- last names with a b anywhere

-- Exercises: Get the customers whose...

-- 1) addresses contain TRAIL or AVENUE
SELECT * FROM customers WHERE address LIKE "%TRAIL%" OR
                              address LIKE "%AVENUE%";

-- 2) phone numbers end with 9
SELECT * FROM customers WHERE phone LIKE "%9";

-- ...

-- Part 8) The REGEXP Operator

SELECT *
FROM customers
WHERE last_name LIKE '%field'
REGEXP 