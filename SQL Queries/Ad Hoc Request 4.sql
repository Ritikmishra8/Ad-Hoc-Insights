# Q4: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields:
 # segment product_count_2020, product_count_2021,difference.
 
with cte1 as (select p.segment , count(distinct p.product_code) as product_count_20
from dim_product p join fact_sales_monthly s
using(product_code)
where s.fiscal_year = 2020
group by segment),

cte2 as (select p.segment , count(distinct p.product_code) as product_count_21
from dim_product p join fact_sales_monthly s
Using(product_code)
where fiscal_year = 2021	
group by segment)

select segment,a.product_count_20, b.product_count_21, (product_count_21 - product_count_20) as differnce
from cte1 a join cte2 b
Using(segment)
order by differnce desc
