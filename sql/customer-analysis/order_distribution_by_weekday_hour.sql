use db_olist;

with cte as (
select datepart(weekday,order_purchase_timestamp) as week_day,datename(dw,order_purchase_timestamp) as order_week_day , 
datepart(HOUR,order_purchase_timestamp) as order_hour, count(order_id) as order_count
from orders
group by datepart(weekday,order_purchase_timestamp),datename(dw,order_purchase_timestamp)  ,datepart(HOUR,order_purchase_timestamp) )



select order_week_day,order_hour,order_count 
from cte 
order by week_day,order_hour