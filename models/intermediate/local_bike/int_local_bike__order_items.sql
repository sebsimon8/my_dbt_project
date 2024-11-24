
SELECT 
    oi.order_item_id,
    oi.order_id,
    oi.item_id,
    p.product_name,
    b.brand_name,
    cat.category_name,
    oi.item_quantity,
    oi.item_listing_price,
    oi.percent_discount,
    oi.total_order_item_amount,
    o.order_status,
    o.order_date,
    c.customer_id,
    store.store_name,
    store.store_city,
    staff.staff_last_name

FROM {{ref('stg_local_bike__order_items')}} AS oi 
LEFT JOIN {{ref('stg_local_bike__orders')}} AS o ON oi.order_id=o.order_id
LEFT JOIN {{ref('stg_local_bike__products')}} AS p ON p.product_id=oi.product_id
LEFT JOIN {{ref('stg_local_bike__categories')}} AS cat ON cat.category_id=p.category_id
LEFT JOIN {{ref('stg_local_bike__brands')}}  AS b ON b.brand_id=p.brand_id
LEFT JOIN {{ref('stg_local_bike__customers')}}  AS c ON c.customer_id=o.customer_id
LEFT JOIN {{ref('stg_local_bike__staffs')}}  AS staff ON staff.staff_id=o.staff_id
LEFT JOIN {{ref('stg_local_bike__stores')}}  AS store ON store.store_id=o.store_id