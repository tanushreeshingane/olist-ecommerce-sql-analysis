use db_olist;


with deliver_time_cte as (select order_id ,order_status,year(order_purchase_timestamp) as order_year ,
month(order_purchase_timestamp) as order_month,
datediff(day,order_estimated_delivery_date,order_delivered_customer_date) as delivery_time
from orders
where order_status = 'delivered')

select order_year ,order_month,case when delivery_time > 0 then 'Delayed'
 when delivery_time <= 0 then 'On-Time'
 end as delivery_status, count(order_id) as order_count
from deliver_time_cte
group by order_year ,order_month,case when delivery_time > 0 then 'Delayed'
 when delivery_time <= 0 then 'On-Time'
 end
 order by order_year ,order_month