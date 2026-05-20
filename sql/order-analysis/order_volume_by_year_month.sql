use db_olist


select  year(order_purchase_timestamp) as order_year ,month(order_purchase_timestamp) as order_month ,count(order_id) as order_count
from orders
group by  year(order_purchase_timestamp),month(order_purchase_timestamp) 
order by order_year,order_month