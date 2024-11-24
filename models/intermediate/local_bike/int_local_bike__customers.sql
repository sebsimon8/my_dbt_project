
SELECT 
  customer_id,
  COUNT(DISTINCT product_name) AS total_distinct_items,
  SUM(item_quantity) AS total_items,
  ROUND(SUM(total_order_item_amount),0) AS total_amount,
  COUNT(DISTINCT(order_id)) AS total_orders,
  CASE 
    WHEN ROUND(SUM(total_order_item_amount),0) >7228 THEN 'VIP_customer'
    WHEN ROUND(SUM(total_order_item_amount),0) <1301 THEN 'Small_customer' 
    ELSE 'Average_customer'
  END AS customer_segment

FROM {{ref('int_local_bike__order_items')}} 
WHERE order_status='delivered' 
GROUP BY customer_id
ORDER BY SUM(total_order_item_amount) DESC