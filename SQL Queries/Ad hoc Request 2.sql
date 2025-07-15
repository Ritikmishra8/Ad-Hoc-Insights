# Q2: What is the percentage of unique product increase in 2021 vs. 2020? The final output
 # contains these fields: unique_products_2020, unique_products_2021, percentage_chg.

With unique_prod_20 as (
select count(distinct product_code) as unique_products_20
from  fact_sales_monthly
where fiscal_year = 2020),
  
unique_prod_21  as ( 
select count(distinct product_code) as unique_products_21
from   fact_sales_monthly
where  fiscal_year = 2021)
       
select unique_products_20,
	   unique_products_21,
	   Round((a.unique_products_21 - b.unique_products_20)*100/b.unique_products_20,2) as Percentage_chg
from unique_prod_21 a,
	   unique_prod_20 b
