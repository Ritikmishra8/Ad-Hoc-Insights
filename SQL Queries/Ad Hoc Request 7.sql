# Q7: Get the complete report of the Gross sales amount for the customer “Atliq Exclusive”
# for each month. The final report contains these columns: Month, Year, Gross sales Amount.

select 
monthname(s.date) as month,
s.fiscal_year,
round(sum(g.gross_price * s.sold_quantity)/1000000,2) as gross_sales_amount
from dim_customer c
join fact_sales_monthly s
using(customer_code)
join fact_gross_price g
using (product_code)
where customer = "Atliq Exclusive"
group by month, s.fiscal_year
order by s.fiscal_year
