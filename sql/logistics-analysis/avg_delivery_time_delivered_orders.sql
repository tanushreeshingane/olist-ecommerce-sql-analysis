use db_olist

select year(order_purchase_timestamp) as order_year ,avg(datediff(day,order_purchase_timestamp,order_delivered_customer_date)) as delivery_days
from orders
where order_status = 'delivered' 
group by year(order_purchase_timestamp)
order by order_year 