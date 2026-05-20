use db_olist;

with order_revenue as (select order_id,sum(payment_value) as total_payment_value 
from order_payments
group by order_id
)

select C.customer_state, sum(total_payment_value) as revenue
from orders O 
inner join order_revenue on O.order_id = order_revenue.order_id
inner join customers C on C.customer_id = O.customer_id
group by C.customer_state
order by revenue desc