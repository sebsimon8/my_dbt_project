SELECT 
    order_id,
    customer_id,
    CASE WHEN order_status=4 THEN 'delivered' ELSE 'not_delivered' END AS order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id
FROM {{ source('local_bike', 'orders') }}