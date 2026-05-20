
use db_olist

select payment_type, round(sum(payment_value),2) as total_revenue
from order_payments
group by payment_type
order by total_revenue desc 