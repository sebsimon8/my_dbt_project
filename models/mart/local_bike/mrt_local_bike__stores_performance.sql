SELECT 
  store_city,
  store_name,
  cp.population AS city_population,
  ROUND(COUNT(DISTINCT(customer_id))/cp.population*100,2) AS city_penetration_percentage,
  COUNT(DISTINCT(customer_id)) AS number_customers,
  ROUND(SUM(total_order_item_amount),0) AS total_turnover,
  COUNT(DISTINCT(order_id)) AS total_orders,
  ROUND((SUM(total_order_item_amount)/COUNT(DISTINCT(customer_id))),0) AS avg_order_amount_store,

  
FROM {{ref('int_local_bike__order_items')}} AS oi
LEFT JOIN {{ref('stg_local_bike__city_population')}} AS cp on cp.city=oi.store_city
WHERE order_status='delivered'
GROUP BY 1,2,3