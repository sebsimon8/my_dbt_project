SELECT 
  c.customer_segment,
  oi.category_name,
  ROUND(COUNT(DISTINCT(oi.customer_id))) AS number_category_customers_per_customer_segment,
  ROUND(SUM(oi.total_order_item_amount),0) AS total_turnover_per_customer_segment,
  ROUND(SUM(oi.item_quantity)) AS total_items_quantity_per_customer_segment,
  ROUND(SUM(oi.total_order_item_amount)/SUM(oi.item_quantity),0) AS avg_price_per_item,
FROM {{ref('int_local_bike__customers')}} AS c
LEFT JOIN {{ref('int_local_bike__order_items')}} AS oi ON oi.customer_id=c.customer_id
GROUP BY customer_segment,category_name
ORDER BY customer_segment,category_name DESC