## Q1: Provide list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

sql
SELECT DISTINCT market
FROM dim_customer
WHERE customer = "Atliq Exclusive"
  AND region = "APAC";

