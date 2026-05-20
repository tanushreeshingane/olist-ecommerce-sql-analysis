use db_olist


select top 5 C.customer_unique_id as customer_id ,count(order_id) as order_count
from customers C 
inner join orders O on C.customer_id = O.customer_id
group by C.customer_unique_id
order by order_count desc 