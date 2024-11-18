select CONCAT(order_id, '_', product_id) AS order_item_id_Z,
 order_id_Z,
 product_id_Z,
 seller_id_Z,
 DATETIME(pickup_limit_date, "Europe/Paris") AS picked_up_limited_at_Z,
 price as unit_price_Z,
 shipping_cost_Z,
 quantity as item_quantity_Z,
 (price * quantity) + shipping_cost as total_order_item_amount_Z
from {{ source('sales_database', 'order_item') }}
