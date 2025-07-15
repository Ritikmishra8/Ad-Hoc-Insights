#  Q9: Which channel helped to bring more gross sales in the fiscal year 2021 and the
 # percentage of contribution? The final output contains these fields: channel, gross_sales_mln, percentage.
 
 with cte as (select channel ,
			round(sum(sold_quantity* gross_price)/1000000,2) as gross_sales_mln
			from dim_customer c
			join fact_sales_monthly s
			using(customer_code)
			join fact_gross_price g
			on g.product_code =s.product_code
			where s.fiscal_year =2021
			group by channel)
select *,
concat(round(gross_sales_mln * 100/sum(gross_sales_mln) over() ,2),"%") as percentage_contribution
from cte
order by percentage_contribution desc
