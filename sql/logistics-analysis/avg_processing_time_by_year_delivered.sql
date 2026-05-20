use db_olist

select year(order_purchase_timestamp) as order_year ,avg(datediff(day,order_purchase_timestamp,order_delivered_carrier_date)) as processing_time
from orders
where order_status = 'delivered' 
group by year(order_purchase_timestamp)
order by order_year 