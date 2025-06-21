create database ecommerce;
use ecommerce;

create table customers(
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique not null,
phone varchar(20) ,
address varchar(100),
city varchar(50),
state varchar(50),
zip_code varchar(20),
registration_date Date not null,
loyalty_points int default 0
);

describe customers;
-- drop table customers;


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    supplier_id INT,
    date_added DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

describe products;
-- drop table products;


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    shipping_address VARCHAR(200) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

describe orders;
-- drop table orders;
 
 CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

describe order_items;
-- drop table order_items;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department VARCHAR(50),
    manager_id INT,
    is_active BOOLEAN DEFAULT TRUE
);

describe employees;
-- drop table employees;


INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip_code, registration_date, loyalty_points) VALUES
('John', 'Smith', 'john.smith@email.com', '555-123-4567', '123 Main St', 'New York', 'NY', '10001', '2022-01-15', 150),
('Emily', 'Johnson', 'emily.j@email.com', '555-234-5678', '456 Oak Ave', 'Los Angeles', 'CA', '90001', '2022-02-20', 75),
('Michael', 'Williams', 'michael.w@email.com', '555-345-6789', '789 Pine Rd', 'Chicago', 'IL', '60601', '2022-03-10', 200),
('Sarah', 'Brown', 'sarah.b@email.com', '555-456-7890', '321 Elm St', 'Houston', 'TX', '77001', '2022-04-05', 50),
('David', 'Jones', 'david.j@email.com', '555-567-8901', '654 Maple Ave', 'Phoenix', 'AZ', '85001', '2022-05-12', 300),
('Jessica', 'Garcia', 'jessica.g@email.com', '555-678-9012', '987 Cedar Ln', 'Philadelphia', 'PA', '19019', '2022-06-18', 125),
('Robert', 'Miller', 'robert.m@email.com', '555-789-0123', '159 Birch Blvd', 'San Antonio', 'TX', '78201', '2022-07-22', 80),
('Jennifer', 'Davis', 'jennifer.d@email.com', '555-890-1234', '753 Spruce Dr', 'San Diego', 'CA', '92101', '2022-08-30', 175),
('Thomas', 'Rodriguez', 'thomas.r@email.com', '555-901-2345', '852 Willow Way', 'Dallas', 'TX', '75201', '2022-09-14', 225),
('Lisa', 'Martinez', 'lisa.m@email.com', '555-012-3456', '456 Redwood Cir', 'San Jose', 'CA', '95101', '2022-10-25', 100);




INSERT INTO products (product_name, description, category, price, cost, stock_quantity, supplier_id, date_added, is_active) VALUES
('Smartphone X', 'Latest model smartphone with advanced camera', 'Electronics', 999.99, 650.00, 100, 1, '2023-01-10', TRUE),
('Wireless Earbuds', 'Noise cancelling wireless earbuds', 'Electronics', 199.99, 120.00, 250, 1, '2023-01-15', TRUE),
('Laptop Pro', 'High-performance business laptop', 'Electronics', 1499.99, 950.00, 75, 2, '2023-02-05', TRUE),
('Smart Watch', 'Fitness tracking and notifications', 'Electronics', 249.99, 150.00, 180, 3, '2023-02-20', TRUE),
('Coffee Maker', 'Programmable 12-cup coffee maker', 'Appliances', 89.99, 45.00, 120, 4, '2023-03-01', TRUE),
('Blender', 'High-speed blender with 5 settings', 'Appliances', 59.99, 30.00, 200, 4, '2023-03-10', TRUE),
('Desk Chair', 'Ergonomic office chair', 'Furniture', 199.99, 110.00, 80, 5, '2023-04-05', TRUE),
('LED Desk Lamp', 'Adjustable brightness LED lamp', 'Home', 39.99, 18.00, 300, 6, '2023-04-15', TRUE),
('Backpack', 'Water-resistant laptop backpack', 'Accessories', 49.99, 22.00, 150, 7, '2023-05-01', TRUE),
('Water Bottle', 'Insulated stainless steel bottle', 'Accessories', 29.99, 12.00, 400, 8, '2023-05-10', TRUE);




INSERT INTO orders (customer_id, order_date, status, total_amount, shipping_address, payment_method) VALUES
(1, '2023-01-20 10:30:00', 'Delivered', 999.99, '123 Main St, New York, NY 10001', 'Credit Card'),
(2, '2023-01-25 14:15:00', 'Shipped', 399.98, '456 Oak Ave, Los Angeles, CA 90001', 'PayPal'),
(3, '2023-02-10 09:45:00', 'Processing', 1749.98, '789 Pine Rd, Chicago, IL 60601', 'Credit Card'),
(4, '2023-02-15 16:20:00', 'Delivered', 249.99, '321 Elm St, Houston, TX 77001', 'Credit Card'),
(5, '2023-03-05 11:10:00', 'Shipped', 149.98, '654 Maple Ave, Phoenix, AZ 85001', 'PayPal'),
(6, '2023-03-20 13:25:00', 'Delivered', 259.98, '987 Cedar Ln, Philadelphia, PA 19019', 'Credit Card'),
(7, '2023-04-10 15:40:00', 'Processing', 199.99, '159 Birch Blvd, San Antonio, TX 78201', 'Credit Card'),
(8, '2023-04-25 10:05:00', 'Shipped', 89.98, '753 Spruce Dr, San Diego, CA 92101', 'PayPal'),
(9, '2023-05-05 14:50:00', 'Delivered', 79.98, '852 Willow Way, Dallas, TX 75201', 'Credit Card'),
(10, '2023-05-15 12:30:00', 'Processing', 29.99, '456 Redwood Cir, San Jose, CA 95101', 'Credit Card');


INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 999.99, 0),
(2, 2, 2, 199.99, 0),
(3, 3, 1, 1499.99, 0),
(3, 4, 1, 249.99, 0),
(4, 4, 1, 249.99, 0),
(5, 5, 1, 89.99, 0),
(5, 6, 1, 59.99, 0),
(6, 7, 1, 199.99, 0),
(6, 8, 1, 39.99, 20.00),
(7, 7, 1, 199.99, 0),
(8, 5, 1, 89.99, 0),
(9, 8, 2, 39.99, 0),
(10, 10, 1, 29.99, 0);




INSERT INTO employees (first_name, last_name, email, phone, hire_date, job_title, salary, department, manager_id, is_active) VALUES
('James', 'Wilson', 'james.w@company.com', '555-111-2222', '2020-01-15', 'CEO', 150000.00, 'Executive', NULL, TRUE),
('Mary', 'Taylor', 'mary.t@company.com', '555-222-3333', '2020-02-10', 'CFO', 135000.00, 'Executive', 1, TRUE),
('William', 'Anderson', 'william.a@company.com', '555-333-4444', '2020-03-05', 'CTO', 140000.00, 'Executive', 1, TRUE),
('Patricia', 'Thomas', 'patricia.t@company.com', '555-444-5555', '2020-04-20', 'Sales Manager', 95000.00, 'Sales', 1, TRUE),
('Richard', 'Hernandez', 'richard.h@company.com', '555-555-6666', '2020-05-15', 'Marketing Manager', 90000.00, 'Marketing', 1, TRUE),
('Jennifer', 'Moore', 'jennifer.m@company.com', '555-666-7777', '2021-01-10', 'Sales Representative', 65000.00, 'Sales', 4, TRUE),
('Charles', 'Martin', 'charles.m@company.com', '555-777-8888', '2021-02-15', 'Sales Representative', 62000.00, 'Sales', 4, TRUE),
('Linda', 'Jackson', 'linda.j@company.com', '555-888-9999', '2021-03-20', 'Customer Support', 58000.00, 'Support', 1, TRUE),
('Joseph', 'White', 'joseph.w@company.com', '555-999-0000', '2021-04-25', 'Web Developer', 85000.00, 'IT', 3, TRUE),
('Elizabeth', 'Lopez', 'elizabeth.l@company.com', '555-000-1111', '2021-05-30', 'Graphic Designer', 72000.00, 'Marketing', 5, TRUE);




select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from employees;



-- Beginner Queries
-- 1. List all customers with their full names and email addresses
select * from customers;
select concat(first_name,' ', last_name) as full_name, email 
from customers;

-- 2. find all products in the 'Electronics' category
select * from products;
select product_name, category, price
from products 
where category='Electronics';


-- 3. show the 5 most expensive products
select * from products;
select product_name,category,price
from products
order by price DESC
limit 5;

-- 4. count how many orders have been placed
select * from orders;
select count(order_id) as total_orders
from orders;
-- or we can use 
select count(*) as total_orders from orders;


-- 5. Find all customers from California (CA)
select * from customers;
select *
from customers 
where state="CA";


-- 6. Calculate the average price of all products
select * from products;
select avg(price) as average_price
from products;


-- 7. List all orders with a total amount over $500
select * from orders;
select * from orders
where total_amount>500;

-- 8. find products with less than 100 items in stock
select * from products;
select * from products
where stock_quantity<100;


INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip_code, registration_date, loyalty_points) VALUES ('Rick', 'Martin', 'rick.martin@email.com', '982-123-4567', '123 Main St', 'New York', 'NY', '10001', '2022-01-19', 150);

-- 9. Count how many customers registered each month
select * from customers;
select month(registration_date) as month_joined, Count(*) as new_customers
from customers
group by month(registration_date)
order by month_joined;

-- 10. find employees hired in 2021

select * from employees;
select * from employees
where hire_date like '2021%';



-- Intermediate  Queries
-- 11. Show customer names along with their order dates and amounts
select * from customers;
select * from orders;
select concat(first_name, " ", last_name) as full_name,order_date
from customers 
join orders
on customers.customer_id=orders.customer_id;

-- 12. find products that have never been ordered
select * from products;
select * from order_items;

select products.product_name
from products
Left join order_items
on products.product_id = order_items.product_id 
where order_items.order_id is null;


-- 13. Calcualte total sales by product category

select * from products;
select * from order_items;
select products.category, sum(order_items.quantity * (order_items.unit_price-(order_items.unit_price * (order_items.discount/100)))) As total_sales
from products
join order_items
on products.product_id=order_items.product_id
group by products.category
order by total_sales Desc;
-- creating a new column in customers table that will represent full name of customers
alter table customers
ADD  full_name varchar(200);
update customers
set full_name = CONCAT(first_name,' ',last_name);

-- 14. Create a view of high-value customers (spent>500)

select * from customers;
select * from orders;

-- using alias
CREATE VIEW high_value_customers AS
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(o.total_amount) > 500;

SELECT * FROM high_value_customers;


-- 15.Find orders placed in the last 30 days (assuming current data is 2023-05-20

select * from order_items;
select * from orders;

select * from orders
where order_date between '2023-04-20' and '2023-05-20';

/* also you can use current_date function or DATEDIFF function */
-- find who placed order in the last 30 days from todays date ( There is no such element in the records) ...query just for reference 
select * from customers;

select customers.full_name,orders.order_date
from customers
join orders
on customers.customer_id=orders.customer_id
where orders.order_date >= current_date - interval 30 Day
order by orders.order_date;


-- 16. List products with their profit margin
select * from products;
select * from orders;

select products.product_name ,products.price,products.cost,
(products.cost - products.price) as profit,
ROUND(((products.price-products.cost)/products.price) * 100,2) as profit_margin
from products;

-- 17.find customers who havent placed any order
select * from customers;
select * from orders;
select customers.full_name, orders.order_date,orders.order_id
from customers
left join orders
on customers.customer_id = orders.customer_id
where orders.order_id is null;


-- 18. show employee names along their manager's name

select * from employees;
select employees.first_name as employee_first,employees.last_name as employee_last,
manager.first_name as manager_first, manager.last_name as manager_last 
from employees as employees
left join employees as manager
on employees.manager_id = manager.employee_id;

/* better using alias */
SELECT e.first_name AS employee_first, e.last_name AS employee_last,
       m.first_name AS manager_first, m.last_name AS manager_last
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;



-- 19. Calculate average order value
select * from orders;

select avg(total_amount) as average_order_value
from orders;


-- 20. Find products that are low in stock (less than 50% of average stock)
select * from products; 

select product_id,product_name,stock_quantity
from products
where stock_quantity < (Select avg(stock_quantity) * 0.5 from products);



















-- 21. Create a stored procedure to update product prices by percentage:



DELIMITER //
CREATE PROCEDURE update_product_prices(IN percentage DECIMAL(5,2), IN category_name VARCHAR(50))
BEGIN
    UPDATE products
    SET price = price * (1 + percentage/100)
    WHERE category = category_name;
END //
DELIMITER ;

-- Example usage:
CALL update_product_prices(10, 'Electronics');



-- 22. find top 3 customeres by total spending 
SELECT c.customer_id, c.first_name, c.last_name, 
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 3;



-- 23. Calculate monthly sales with percentage growth:
WITH monthly_sales AS (
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(total_amount) AS monthly_total
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    month,
    monthly_total,
    LAG(monthly_total) OVER (ORDER BY month) AS previous_month,
    ROUND((monthly_total - LAG(monthly_total) OVER (ORDER BY month)) / 
          LAG(monthly_total) OVER (ORDER BY month) * 100, 2) AS growth_percentage
FROM monthly_sales;


-- 24. Find customers who purchased the same product more than once
SELECT c.customer_id, c.first_name, c.last_name, p.product_name, COUNT(*) AS purchase_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name, p.product_id, p.product_name
HAVING COUNT(*) > 1
ORDER BY purchase_count DESC;


-- 25.Create a report of employee salaries by department with averages:

SELECT 
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
WHERE is_active = TRUE
GROUP BY department
ORDER BY avg_salary DESC;


-- 26.Find products that are frequently bought together:

SELECT 
    p1.product_name AS product1,
    p2.product_name AS product2,
    COUNT(*) AS times_bought_together
FROM order_items oi1
JOIN order_items oi2 ON oi1.order_id = oi2.order_id AND oi1.product_id < oi2.product_id
JOIN products p1 ON oi1.product_id = p1.product_id
JOIN products p2 ON oi2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
HAVING COUNT(*) > 1
ORDER BY times_bought_together DESC;



-- 27. Create a function to calculate customer lifetime value:
DELIMITER //
CREATE FUNCTION calculate_clv(customer_id_param INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE clv DECIMAL(10,2);
    
    SELECT SUM(total_amount) INTO clv
    FROM orders
    WHERE customer_id = customer_id_param;
    
    RETURN IFNULL(clv, 0);
END //
DELIMITER ;

-- Example usage:
SELECT first_name, last_name, calculate_clv(customer_id) AS customer_lifetime_value
FROM customers;

-- 28.Analyze sales by day of week:

SELECT 
    DAYNAME(order_date) AS day_of_week,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY DAYNAME(order_date), DAYOFWEEK(order_date)
ORDER BY DAYOFWEEK(order_date);


-- 29.Create a product recommendation query based on customer purchases:

WITH customer_categories AS (
    SELECT 
        o.customer_id,
        p.category,
        COUNT(*) AS purchase_count
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id, p.category
    ORDER BY o.customer_id, purchase_count DESC
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    cc.category AS favorite_category,
    p.product_name AS recommended_product
FROM customers c
JOIN customer_categories cc ON c.customer_id = cc.customer_id
JOIN products p ON cc.category = p.category
LEFT JOIN (
    SELECT oi.product_id, o.customer_id
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
) op ON p.product_id = op.product_id AND c.customer_id = op.customer_id
WHERE op.product_id IS NULL
ORDER BY c.customer_id, cc.purchase_count DESC;



-- 30. Create an index to optimize customer search queries:
CREATE INDEX idx_customer_name ON customers(last_name, first_name);
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_order_customer_date ON orders(customer_id, order_date);

-- Show existing indexes (optional):
SHOW INDEX FROM customers;
SHOW INDEX FROM orders;

