use db_olist

select C.customer_state ,avg(datediff(day,order_purchase_timestamp,order_delivered_customer_date)) as delivery_time
from orders O
inner join customers C on C.customer_id = O.customer_id
where order_status = 'delivered' 
group by C.customer_state
order by delivery_time desc