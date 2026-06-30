-- Sample data
SELECT * FROM ZEPTO_V2
LIMIT 10;


-- null values
SELECT * FROM ZEPTO_V2
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT  category
FROM ZEPTO_V2
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(name)
FROM ZEPTO_V2
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(name) as "Number of products"
FROM ZEPTO_V2
GROUP BY name 
HAVING count(name) > 1
ORDER BY count(name) DESC;


-- Data cleaning

-- product with price = 0
SELECT * FROM ZEPTO_V2
WHERE mrp=0 OR discountedSellingPrice = 0;

DELETE FROM ZEPTO_V2
WHERE mrp=0;


-- convert paise to rupees
UPDATE ZEPTO_V2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM ZEPTO_V2;


-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM ZEPTO_V2
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM ZEPTO_V2
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;


-- Q3.Calculate Estimated Revenue for each category

SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM ZEPTO_V2
GROUP BY category
ORDER BY total_revenue;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM ZEPTO_V2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;


-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM ZEPTO_V2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM ZEPTO_V2
WHERE weightInGms >= 100
ORDER BY price_per_gram;


-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM ZEPTO_V2;



-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM ZEPTO_V2
GROUP BY category
ORDER BY total_weight;
