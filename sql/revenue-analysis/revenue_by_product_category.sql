use db_olist;

with product_value_cte as (
select product_id, (sum(price)  + sum(freight_value)) as product_value
from order_items 
group by product_id) 

select P.product_category_name,PCT.product_category_name_english, sum(product_value) as product_revenue
from product_value_cte
inner join products P on product_value_cte.product_id = P.product_id 
inner join product_category_name_translation PCT on PCT.product_category_name = p.product_category_name
group by P.product_category_name,PCT.product_category_name_english
order by product_revenue desc