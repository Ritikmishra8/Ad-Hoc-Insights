# Q5: Get the products that have the highest and lowest manufacturing costs. The final
 # output should contain these fields: product_code, product, manufacturing_cost.

select p.product, m.product_code, m.manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
using(product_code)
where manufacturing_cost in (select max(manufacturing_cost) from fact_manufacturing_cost
							               union
                             select min(manufacturing_cost) from fact_manufacturing_cost)
                             order by manufacturing_cost desc
