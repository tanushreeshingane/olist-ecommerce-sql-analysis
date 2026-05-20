use db_olist;

with product_count_cte as (
select  product_id , count(product_id) as product_count
from order_items 
group by product_id)

select P.product_category_name,PCT.product_category_name_english,sum(product_count) as total_product_count
from products P 
inner join product_count_cte PC on P.product_id = PC.product_id
inner join product_category_name_translation PCT on P.product_category_name = PCT.product_category_name
group by  P.product_category_name,PCT.product_category_name_english
order by total_product_count desc
