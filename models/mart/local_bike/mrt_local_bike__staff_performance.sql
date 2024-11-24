SELECT 
  staff_last_name,
  store_name,
  COUNT(DISTINCT(customer_id)) AS number_customers,
  ROUND(SUM(total_order_item_amount),0) AS total_turnover,
  COUNT(DISTINCT(order_id)) AS total_orders,
  ROUND((SUM(total_order_item_amount)/COUNT(DISTINCT(customer_id))),0) AS avg_order_amount_store,
  
FROM {{ref('int_local_bike__order_items')}} 
WHERE order_status='delivered'
GROUP BY 1,2
ORDER BY ROUND(SUM(total_order_item_amount),0)
