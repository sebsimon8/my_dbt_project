SELECT 
  CONCAT(order_id, '_', item_id) AS order_item_id,
  order_id,
  item_id,
  product_id,
  quantity AS item_quantity,
  list_price AS item_listing_price,
  discount AS percent_discount,
  ROUND((list_price-list_price*discount)*quantity,2) AS total_order_item_amount
FROM {{ source('local_bike', 'order_items') }}
ORDER BY (list_price-list_price*discount)*quantity DESC