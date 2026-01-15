-- LEVEL 2: INTERMEDIATE ANALYTICS (JOINS & LOGIC)


-- Which specific bicycle models have never been sold?
SELECT p.product_id, p.product_name FROM products p
LEFT JOIN 
order_items i ON p.product_id = i.product_id
WHERE i.product_id IS NULL;

-- Who are the top 3 performing sales staff members based on total revenue generated?
SELECT 
    s.first_name || ' ' || s.last_name AS staff_member,
    s.email,
    SUM(i.list_price * i.quantity * (1 - i.discount)) AS total_net_revenue
FROM staffs s
JOIN orders o ON s.staff_id = o.staff_id
JOIN order_items i ON o.order_id = i.order_id
GROUP BY s.staff_id, s.first_name, s.last_name, s.email
ORDER BY total_net_revenue DESC
LIMIT 3;

-- Calculate the total revenue for each state (NY, CA, TX) and identify which specific brand is the top-seller in each of those, states.
select c.state, SUM(i.list_price * i.quantity * (1 - i.discount)) as revenue_per_state ,  b.brand_name from customers c
join orders o on c.customer_id = o.customer_id
join order_items i on o.order_id = i.order_id
join products p on i.product_id = p.product_id
join brands b on p.brand_id = b.brand_id
group by c.state, b.brand_name
order by c.state, revenue_per_state desc;

SELECT 
    c.state, 
    b.brand_name, 
    SUM(i.list_price * i.quantity * (1 - i.discount)) AS brand_revenue_in_state
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items i on o.order_id = i.order_id
JOIN products p on i.product_id = p.product_id
JOIN brands b on p.brand_id = b.brand_id
GROUP BY c.state, b.brand_name
ORDER BY c.state, brand_revenue_in_state DESC;

-- Which customers have placed more than 3 orders? List their full names and their total order count.
select distinct c.customer_id, c.first_name ||' '|| c.last_name as full_name, count(distinct o.order_id) as total_unique_orders from customers c
join orders o on c.customer_id = o.customer_id

group by c.customer_id
having total_unique_orders >= 3
order by total_unique_orders desc;

-- Create a "Price Tier" column using a CASE statement to categorize bikes as:'Budget' (Under $500),'Mid-Range' ($500 - $2000), 'Luxury' (Over $2000)
select *, 
case 
	when list_price < 500 then 'Budget'
	when list_price between 500 and 2000 then 'Mid-Range'
	else 'Luxury'
end as price_tier
from products;

-- What is the average time (in days) between an order being placed and the date it was actually shipped?

select avg(julianday(shipped_date) - julianday(order_date)) as avg_day_difference from orders;

-- Which store location carries the most diverse selection (the highest number of unique product categories)?
select stores.store_name, count(distinct(p.category_id) )as total_unique_categories from stores
join stocks s on stores.store_id = s.store_id
join products p on s.product_id = p.product_id
where s.quantity > 0
group by stores.store_name;