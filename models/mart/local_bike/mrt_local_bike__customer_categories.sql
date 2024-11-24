SELECT 
  customer_spending_status,
  COUNT(customer_id) AS number_customers,
  SUM(total_amount) AS total_turnover,
  ROUND(AVG(total_amount),0) AS avg_total_spend_per_customer,
  ROUND(AVG(total_orders),3) AS avg_orders_per_customer,
  ROUND(AVG(total_amount/total_orders),0) AS avg_basket_per_customer,
  ROUND(AVG(total_items),1) AS avg_items_per_customer,
  ROUND(AVG(total_distinct_items),1) AS avg_distinct_items_per_customer
FROM {{ref('int_local_bike__customers')}}
GROUP BY customer_spending_status