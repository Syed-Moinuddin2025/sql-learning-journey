 -- Calculate total revenue = quantity × price for each item in order_details
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id ;
