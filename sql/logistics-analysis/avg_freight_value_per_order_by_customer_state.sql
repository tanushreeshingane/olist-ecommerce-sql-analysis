use db_olist;


 with order_freight as (
select order_id, sum(freight_value) as freight_val
from order_items OI 
group by order_id)


select customer_state, round(avg(freight_val),2) as avg_freight_value
from orders O
inner join order_freight OFR on O.order_id = OFR.order_id
inner join customers C on C.customer_id = O.customer_id
group by customer_state
order by avg_freight_value desc