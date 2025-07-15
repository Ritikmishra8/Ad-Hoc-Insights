# Q6: Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for 
# the fiscal year 2021 and  in the Indian market. The final output contains these fields: 
# customer_code, customer, average_discount_percentage.

select c.customer_code, c.customer,
round(avg(pre_invoice_discount_pct)*100,2) as avg_discount_pct
from dim_customer c
join fact_pre_invoice_deductions p
using(customer_code)
where c.market = "India" and fiscal_year = 2021
group by c.customer,c.customer_code 
order by avg_discount_pct desc
limit 5
