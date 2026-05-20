use db_olist;

with order_revenue as (
select order_id, sum(payment_value) as revenue
from order_payments
group by order_id )

select Year(order_purchase_timestamp) as order_year,month(order_purchase_timestamp) as order_month 
, round(sum(revenue),2) as total_revenue

from orders O
inner join order_revenue ORV on O.order_id = ORV.order_id
group by Year(order_purchase_timestamp),month(order_purchase_timestamp)
order by order_year, order_month