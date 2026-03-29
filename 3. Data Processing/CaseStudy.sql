--------------------------------------------------------------------------
--BRIGHT COFFEE SHOP CODING
--------------------------------------------------------------------------

---1.RUNNING THE ENTIRE TABLE
select * 
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--2. CHECKING THE DATE RANGE(1st and last date of dataset) 
Select min(transaction_date) as Minimum_Date,
      max(transaction_date) as Maximum_Date
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--3. CHECKING DIFFERENT STORE LOCATIONS
Select distinct store_location
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--4. CHECKING PRODUCT SOLD FROM DIFFERENT STORES- 9 products 
select distinct product_category
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--5. CHECKING PRODUCT TYPES SOLD FROM DIFFERENT STORES - 29 product types
select distinct product_type
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--6.CHECKING PRODUCT DETAILS SOLD AT THE STORES - 
select distinct product_detail
from `workspace`.`default`.`bright_coffee_shop_analysis`;


--7. CHECKING FOR NULL VALUES
Select *
from `workspace`.`default`.`bright_coffee_shop_analysis`
where unit_price is null 
or transaction_qty is null 
or transaction_date is null;  


--8. CHECKING FOR MAX AND MIN UNIT PRICE 
Select min(unit_price) as Lowest_unit_price,
       max(unit_price) as Highest_unit_price
 from `workspace`.`default`.`bright_coffee_shop_analysis`;   


--9. EXTRACTING THE DAY AND MONTH NAMES
Select transaction_date,
      Dayname(transaction_date) as Day_name,
      Monthname(transaction_date) as Month_name
  from `workspace`.`default`.`bright_coffee_shop_analysis`;     


-- 10. CALCULATING THE  REVENUE 
Select unit_price,
       transaction_qty,
       unit_price * transaction_qty as Revenue
from `workspace`.`default`.`bright_coffee_shop_analysis`;      
       
--11. COMBINING FUNCTIONS TO GET CLEAN AND ENHANCED DATA
Select transaction_id,
       transaction_date,
       transaction_time,
       transaction_qty, 
       store_id,
       store_location,
       product_id,
       unit_price,
       product_category,
       product_type,
       product_detail,
--Adding columns to enhance the table for better insights 
--- New column added 1      
       Dayname(transaction_date) as Day_name,
---New column added 2       
       Monthname(transaction_date) as Month_name,
--- New column added 3 
       Dayofmonth(transaction_date) as Date_of_Month,
--- New Column added 4 ( Determinig weekenday / weekend)
 Case 
     When Dayname(transaction_date) in ('Sun', 'Sat') then 'Weekend'
     Else 'Weekday' 
 End as Day_classification,   
--- New column added 5 ( Determining Time Buckets)
Case 
     When date_format(transaction_time, 'HH:mm:ss') between '05:00:00' and '08:59:59'then '01.Busy Hour'
     When date_format(transaction_time, 'HH:mm:ss') between '09:00:00' and '11:59:59'then '02.Mid morning'
     When date_format(transaction_time, 'HH:mm:ss') between '12:00:00' and '15:59:59'then '03.Afternoon'
     When date_format(transaction_time, 'HH:mm:ss') between '16:00:00' and '18:59:59'then '04. Last Rush'
     Else '05.Night'
 End as Time_classification,
 --- New Column added 6 (Spend Buckets)
 Case 
     When (transaction_qty*unit_price) <=50 then '01. Low spender'
     When (transaction_qty*unit_price) between 51 and 200 then '02. Medium spender'
      When (transaction_qty*unit_price) between 201 and 300 then '03. High spender'
     Else '04.Premium Spender'
 End as Spend_bucket,
--- New column added 7 ( Revenue)
 transaction_qty*unit_price as Revenue
From `workspace`.`default`.`bright_coffee_shop_analysis`; 
