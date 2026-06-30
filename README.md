🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

📌 Project Overview
The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

✅ Set up a messy, real-world e-commerce inventory database

✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies

✅ Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees

✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more

📁 Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.
Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🔧 Project Workflow
Here’s a step-by-step breakdown of what we do in this project:

1. Database & Table Creation
We start by creating a SQL table with appropriate data types:
```sql
CREATE TABLE zepto (
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```
2. Data Import
If you're not able to use the import feature, write this code instead:
```sql
   SHOW VARIABLES LIKE 'local_infile';
    SET GLOBAL local_infile = 1;
    truncate table ZEPTO_V2;
    
    LOAD DATA LOCAL INFILE 'Path of the file'
    INTO TABLE ZEPTO_V2
    CHARACTER SET latin1
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
```
3. 🔍 Data Exploration

    * Counted the total number of records in the dataset.
    * Examined a sample of the dataset to understand its structure and contents.
    * Checked all columns for missing (null) values.
    * Identified the distinct product categories present in the dataset.
    * Compared the number of in-stock and out-of-stock products.
    * Detected products with multiple entries, indicating different SKUs.


4. 🧹 Data Cleaning
    * Identified and removed rows where the MRP or discounted selling price was zero.
    * Converted the mrp and discountedSellingPrice values from paise to rupees to ensure consistency and improve readability.

5. 📊 Business Insights
    * Identified the top 10 best-value products based on the highest discount percentage.
    * Found high-MRP products that are currently out of stock.
    * Estimated the potential revenue for each product category.
    * Filtered premium products (MRP > ₹500) that offer minimal discounts.
    * Ranked the top 5 product categories with the highest average discount percentages.
    * Calculated the price per gram to identify the best value-for-money products.
    * Categorized products into Low, Medium, and Bulk weight groups.
    * Measured the total inventory weight for each product category.


Open zepto_SQL_data_analysis.sql
  This file contains:
  * Created a MySQL database for the project.
  * Imported the dataset into the database.
  * Loaded the dataset into MySQL for analysis.
  * Created the required database tables.
  * Performed data exploration to understand the dataset structure and quality.
  * Cleaned the data by handling invalid records and ensuring consistency.
  * Conducted SQL-based business analysis to generate actionable insights.



💡 Thanks for checking out the project! Your support means a lot — feel free to star ⭐ this repo or share it with someone learning SQL.🚀
