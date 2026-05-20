use db_olist
 
select order_status,count(order_id) as order_count
from orders
group by order_status
order by order_count desc
