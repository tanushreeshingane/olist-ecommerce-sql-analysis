use db_olist

select year(order_purchase_timestamp) as order_year,month(order_purchase_timestamp) as order_month,
avg(datediff(day,order_purchase_timestamp,order_approved_at)) as avg_approval_time
from orders
where order_status <> 'unavailable' and order_status <> 'canceled'
group by year(order_purchase_timestamp),month(order_purchase_timestamp)
order by year(order_purchase_timestamp),month(order_purchase_timestamp)