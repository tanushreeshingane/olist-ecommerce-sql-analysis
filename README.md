# OLIST ecommerce project (SQL)

### 🛒 Project Summary 
Analyzed ~100K+ e-commerce transactions to identify revenue drivers, delivery inefficiencies, and customer behavior patterns using SQL.

### 📌 Project Overview 
This project analyzes the Brazilian E-Commerce OLIST dataset to understand customer behavior, seller performance, revenue trends, and logistics efficiency. The goal of the project is to identify patterns and trends in the data to support data-driven decision-making.

### ❗ Problem Statement
This project analyzes historical e-commerce transaction data from the OLIST dataset using SQL. The objective is to explore customer behavior, revenue patterns, and logistics performance by performing multi-table joins and aggregations to extract actionable business insights.

### 📂 Data Source
OLIST Brazilian E-Commerce Dataset from Kaggle [Dataset link](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### 🎯 Objective
The goals of this analysis are to:

- Understand the structure of the dataset.
- Identify key trends and patterns.
- Explore relationships between important business attributes.
- Analyze customer, seller, payment, and logistics behavior.
- Provide actionable recommendations based on observed patterns and insights.


### ⚙️ Tools & Technologies
- Microsoft SQL Server (SQL development and analysis)

### 📂 Database Schema
Tables used :
- orders (~99k records)
- order_items 
- order_payments
- order_reviews
- products (~32k records)
- product_category_name_translation
- sellers (~3k records)
- customers (~99k records)

#### Relationship Overview
- order_items linked to orders via order_id
- order_payments linked to orders via order_id
- order_reviews linked to orders via order_id
- order_items linked to products via product_id
- order_items linked to sellers via seller_id
- customers linked to orders via customer_id
- products linked to product_category_name_translation via product_category_name


#### Data Preparation 
- Handled missing values in product_category_name to ensure consistency in product-level analysis.
- Excluded orders with missing delivery timestamps to maintain accuracy in logistics calculations.

### 🔍 Analysis Performed
- Analysed volume of orders through months and years, order status, product category.
- Analysed average delivery time through months and years, customer state.
- Volume of on-time and delayed orders through months and years.
- Revenue by customer state, payment type, month and year.
- Top 5 sellers through customer state (based on number of orders).

### ⚡ Key SQL concepts used
- Select, Where, Group By
- Joins (INNER JOIN)
- Aggregations (AVG,SUM,COUNT)
- CTEs (Common Table Expressions) 
- Windows functions (DENSE_RANK)
- Case statement for classification
- Datefunctions (YEAR, MONTH, DATEDIFF)

### 📄 Sample Query

		-- 	Revenue by Customer State
		
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
			
			
		-- On-Time vs Delayed deliveries Volume by month and years
		
			with deliver_time_cte as (select order_id ,order_status,year(order_purchase_timestamp) as order_year ,
			month(order_purchase_timestamp) as order_month,
			datediff(day,order_estimated_delivery_date,order_delivered_customer_date) as delivery_time
			from orders
			where order_status = 'delivered')
			
			select order_year ,order_month,case when delivery_time > 0 then 'Delayed'
			when delivery_time <= 0 then 'On-Time'
			end as delivery_status, count(order_id) as order_count
			from deliver_time_cte
			group by order_year ,order_month,case when delivery_time > 0 then 'Delayed'
			when delivery_time <= 0 then 'On-Time'
			end
			order by order_year ,order_month
					

### 🧠 Key Insights

#### Sales & Product Insights
- Most frequently ordered product categories:
  - Bed Bath Table
  - Health Beauty
  - Sports Leisure
  - Furniture Decor
  - Computers Accessories

- Highest revenue-generating categories:
  - Health Beauty
  - Watches Gifts
  - Bed Bath Table

- The majority of orders were successfully delivered, with a very low proportion of cancellations or unavailable orders, indicating stable order fulfillment performance.

#### Revenue Insights
- Revenue showed steady growth over the years, indicating increasing platform adoption
- Highest revenue was recorded in November 2017.
- Highest revenue-generating states:
  - SP (São Paulo)
  - RJ (Rio de Janeiro)
  - MG (Minas Gerais)

#### Customer Behavior Insights
- Most orders were placed on Mondays and Tuesdays, suggesting higher early-week engagement.
- Tuesday at 2 PM recorded the highest order activity.
- Early morning hours had the lowest order volume.
- Identified the top 5 customers with the highest order counts.

#### Logistics & Delivery Insights
- Average delivery time reduced from 19 days to 12 days between 2016–2018.
- Average processing time reduced from 13 days to 3 days, indicating improved operational efficiency.
- Average approval time became nearly zero after September 2016, reflecting faster internal processing.
- States RR (Roraima), AP (Amapá), and AM (Amazonas) recorded the highest delivery times, highlighting logistical challenges in remote regions.
- States SP (São Paulo), MG (Minas Gerais), and PR (Paraná) had the lowest freight costs and delivery times, indicating stronger logistics infrastructure in these states.


### 📌 Business Recommendations
- Promote high-performing payment methods such as credit cards and boleto using cashback or discount campaigns.
- Bundle frequently purchased categories with low-performing products to improve sales.
- Improve logistics operations in remote states with high freight costs and delivery times.
- Schedule marketing campaigns during peak ordering periods for better engagement.


### ⚠️ Limitations
- The dataset contains historical data from 2016–2018 and may not reflect current e-commerce trends or customer behavior.
- Individual product-level details are limited, restricting deeper analysis at the specific product level.
- Customer reviews are associated with entire orders rather than individual products, making product-specific sentiment analysis difficult.
- Some geographic regions have significantly fewer orders, which may affect the reliability of regional comparisons.
- The geolocation table was excluded from the analysis due to redundancy with existing customer and seller location data.


### 🧩 Skills Demonstrated
- SQL querying and optimization
- Data cleaning and transformation
- Analytical problem solving
- Relational database understanding
- Business insight generation


### 🔗 Contact 
- [LinkedIn](https://www.linkedin.com/in/tanushree-shingane/)

- [Email](mailto:tanushreeshingane@gmail.com)
