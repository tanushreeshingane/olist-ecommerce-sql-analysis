use db_olist;

with seller_order_count as (
select OI.seller_id, C.customer_state, count(distinct O.order_id) as order_count
from  order_items OI 
inner join orders O on O.order_id = OI.order_id
inner join customers C on C.customer_id = O.customer_id
group by  OI.seller_id, C.customer_state),

ranked_seller_order_count as(
select *,DENSE_RANK() over(partition by customer_state order by order_count desc) as dns_rank
from seller_order_count)


select customer_state,seller_id
from ranked_seller_order_count
where dns_rank = 1