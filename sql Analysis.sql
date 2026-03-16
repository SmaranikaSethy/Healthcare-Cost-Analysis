-- creating datbase
CREATE DATABASE Healthcare_cost;
use Healthcare_cost;

-- checking the dataset
select * from insurance_data LIMIT 10; 

ALTER TABLE insurance_data
RENAME COLUMN ï»¿age TO age;

-- Checking total records
SELECT COUNT(*) AS total_records FROM insurance_data;

-- checking missing values
SELECT * FROM insurance_data
WHERE age IS NULL
OR bmi IS NULL
OR charges IS NULL;

-- average medical cost
SELECT AVG(charges) AS avg_cost FROM insurance_data;

-- Maximum and Minimum Charges
SELECT MIN(charges) AS min_cost, MAX(charges) AS max_cost FROM insurance_data;

-- cost by smoker
SELECT smoker,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY smoker;

-- cost by region
SELECT region,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY region
ORDER BY avg_cost DESC;

-- cost by  gender
SELECT sex,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY sex;

-- Age vs medical cost
SELECT age,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY age
ORDER BY age;

-- BMI vs Charges
SELECT
ROUND(bmi) AS bmi_level,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY bmi_level
ORDER BY bmi_level;

-- Children vs Insurance cost
SELECT children,
AVG(charges) AS avg_cost
FROM insurance_data
GROUP BY children
ORDER BY children;

-- Top 10 Most Expensive Cases
SELECT *
FROM insurance_data
ORDER BY charges DESC
LIMIT 10;

-- Summary Table
CREATE VIEW insurance_summary AS
SELECT
region,
smoker,insurance_summary
AVG(charges) AS avg_cost,
COUNT(*) AS total_people
FROM insurance_data
GROUP BY region, smoker;

select * from insurance_summary