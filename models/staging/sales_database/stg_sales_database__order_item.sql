select CONCAT(order_id, '_', product_id) AS order_item_id_P,
 order_id_P,
 product_id_P,
 seller_id_P,
 DATETIME(pickup_limit_date, "Europe/Paris") AS picked_up_limited_at_P,
 price as unit_price_P,
 shipping_cost_P,
 quantity as item_quantity_P,
 (price * quantity) + shipping_cost as total_order_item_amount_P
from {{ source('sales_database', 'order_item') }}
