---Query1 - To check the sample of the table on how it looks like and if data is loaded correctly
select * 
from `workspace`.`default`.`bright_coffee_shop_analysis` 
limit 100;

----------------------------------------------------------------------
---1.Checking the date range 
----------------------------------------------------------------------
---Query2 - Day started collecting data on the 01-01-2023
select min(transaction_date) as Start_Date
from `workspace`.`default`.`bright_coffee_shop_analysis` 


---Query3 - Day last collected data on the 30-06-2023
select max(transaction_date) as Latest_Date
from `workspace`.`default`.`bright_coffee_shop_analysis` 
------------------------------------------------------------------
----2.Checking the number of stores ( store locations)
--------------------------------------------------------------------
---Query4 - Store locations and number of stores ( which there are 3)
select distinct  store_location
from `workspace`.`default`.`bright_coffee_shop_analysis`; 

-------------------------------------------------------------------
---3. checking for product sold accross all the stores
------------------------------------------------------------------
---Query5 - Diiferent category of products sold are 9 
select distinct  product_category
from `workspace`.`default`.`bright_coffee_shop_analysis`;

---Query6 - Diiferent details of products 
select distinct  product_detail
from `workspace`.`default`.`bright_coffee_shop_analysis`;


---Query7 - Diiferent types of products 
select distinct  product_type
from `workspace`.`default`.`bright_coffee_shop_analysis`;

----------------------------------------------------------------------------
---Query 8 - Create total amount 
select *,
      (unit_price * transaction_qty) as Total_Amount
from `workspace`.`default`.`bright_coffee_shop_analysis`;

---Query 9- High perfoming products 
select product_detail,
       Sum(unit_price * transaction_qty) as Revenue
from `workspace`.`default`.`bright_coffee_shop_analysis`
Group by  product_detail
Order by Revenue desc;  


---Query 10 - Low performing products 
select product_detail,
       Sum(unit_price * transaction_qty) as Revenue
from `workspace`.`default`.`bright_coffee_shop_analysis`
Group by  product_detail
Order by Revenue asc; 

--Query 11 -- Sales by product category 
select product_category,
       Sum(unit_price * transaction_qty) as Total_revenue,
       Sum(transaction_qty) as Total_units
from `workspace`.`default`.`bright_coffee_shop_analysis`
Group by  product_category
Order by Total_revenue desc; 

-- Query 12 - Total revenue 
Select Sum(unit_price * transaction_qty) as Total_Revenue
from `workspace`.`default`.`bright_coffee_shop_analysis`;

-- Query 13 - Total units sold 
Select Sum(transaction_qty) as Total_units
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--Query 14 -- Creat 30min time bucket 
Select 
    transaction_time_bucket,
    SUM(transaction_qty) AS total_units_sold,
    SUM(transaction_qty * unit_price) AS total_revenue
From (
    Select *,
           CONCAT(
               DATE_FORMAT(transaction_time, 'yyyy-MM-dd HH:'),
               LPAD(FLOOR(MINUTE(transaction_time)/30)*30, 2, '0')
           ) AS transaction_time_bucket
    from `workspace`.`default`.`bright_coffee_shop_analysis`
) 
Group BY transaction_time_bucket
Order BY transaction_time_bucket;
