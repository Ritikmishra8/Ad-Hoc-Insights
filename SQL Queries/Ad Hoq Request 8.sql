# Q8: In which quarter of 2020, got the maximum total_sold_quantity? The final output
 # contains these fields sorted by the total_sold_quantity: Quarter, total_sold_quantity.


WITH CTE AS 
(SELECT
	   MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) AS month_num,
     fiscal_year,
     sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020)
SELECT 
	  CONCAT("Q", CEILING(month_num/3)) AS Quarter,
    SUM(sold_quantity) AS sold_quantity
FROM CTE
GROUP BY Quarter
ORDER BY Quarter
