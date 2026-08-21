CREATE DATABASE IF NOT EXISTS shop_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shop_demo;

-- Bảng khách hàng
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registered_at DATE NOT NULL
);

-- Bảng sản phẩm
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Bảng đơn hàng
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Bảng chi tiết đơn hàng (mỗi dòng là 1 sản phẩm thuộc 1 đơn)
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email, registered_at) VALUES
('Trần Văn An', 'an.tran@gmail.com', '2024-01-03'),
('Nguyễn Minh B', 'minhb@gmail.com', '2024-01-05'),
('Lê Thị C', 'c.let@gmail.com', '2024-01-10'),
('Phạm Hoàng D', 'd.pham@gmail.com', '2024-01-13'),
('Đỗ Thúy E', 'thuydo@gmail.com', '2024-01-15'),
('Hoàng Văn F', 'f.hoang@gmail.com', '2024-02-03'),
('Bùi Đức G', 'g.bui@gmail.com', '2024-02-07'),
('Trịnh Mai H', 'h.trinh@gmail.com', '2024-02-09'),
('Vũ Hải I', 'i.vu@gmail.com', '2024-02-12'),
('Đặng Nhật K', 'k.dang@gmail.com', '2024-02-14'),
('Nguyễn Thị L', 'l.nguyen@gmail.com', '2024-02-17'),
('Phan Văn M', 'm.phan@gmail.com', '2024-03-01'),
('Đoàn Thị N', 'n.doan@gmail.com', '2024-03-05'),
('Trương Minh O', 'o.truong@gmail.com', '2024-03-10'),
('Võ Gia P', 'p.vo@gmail.com', '2024-03-15'),
('Lý Hải Q', 'q.ly@gmail.com', '2024-03-21'),
('Tạ Văn R', 'r.ta@gmail.com', '2024-03-25'),
('Cao Thị S', 's.cao@gmail.com', '2024-04-01'),
('Ngô Văn T', 't.ngo@gmail.com', '2024-04-08'),
('Dương Thu U', 'u.duong@gmail.com', '2024-04-13');

INSERT INTO products (name, price, stock) VALUES
('Bút bi Thiên Long', 5000, 100),
('Vở Campus', 20000, 50),
('Kéo nhỏ', 12000, 30),
('Thước kẻ 20cm', 7000, 60),
('Tẩy Student', 3000, 100),
('Gôm Pentel', 4000, 90),
('Bìa nhựa', 15000, 70),
('Bút chì 2B', 3500, 80),
('Gọt bút chì', 6000, 40),
('Tập A4', 25000, 40),
('Giấy note', 8000, 55),
('Bút dạ quang', 12000, 35),
('Compas', 30000, 25),
('Bảng con', 18000, 50),
('Bút lông bảng', 7000, 80),
('Kẹp giấy', 4000, 100),
('Hồ dán', 6000, 60),
('Sổ tay', 15000, 90),
('Mực bút máy', 20000, 25),
('Kẹp tài liệu', 18000, 30);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-05', 150000),
(2, '2024-01-07', 230000),
(3, '2024-01-12', 50000),
(4, '2024-01-14', 110000),
(5, '2024-01-16', 72000),
(6, '2024-02-05', 135000),
(7, '2024-02-09', 98000),
(8, '2024-02-13', 128000),
(9, '2024-02-17', 60000),
(10, '2024-02-19', 157000),
(11, '2024-02-21', 81000),
(12, '2024-03-03', 44000),
(13, '2024-03-06', 205000),
(14, '2024-03-12', 157000),
(15, '2024-03-16', 129000),
(16, '2024-03-22', 143000),
(17, '2024-03-27', 95000),
(18, '2024-04-03', 128000),
(19, '2024-04-09', 100000),
(20, '2024-04-14', 132000);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-05', 150000),
(2, '2024-01-07', 230000),
(3, '2024-01-12', 50000),
(4, '2024-01-14', 110000),
(5, '2024-01-16', 72000),
(6, '2024-02-05', 135000),
(7, '2024-02-09', 98000),
(8, '2024-02-13', 128000),
(9, '2024-02-17', 60000),
(10, '2024-02-19', 157000),
(11, '2024-02-21', 81000),
(12, '2024-03-03', 44000),
(13, '2024-03-06', 205000),
(14, '2024-03-12', 157000),
(15, '2024-03-16', 129000),
(16, '2024-03-22', 143000),
(17, '2024-03-27', 95000),
(18, '2024-04-03', 128000),
(19, '2024-04-09', 100000),
(20, '2024-04-14', 132000);

SELECT 
    o.id AS OrderID,
    c.name AS CustomerName,
    o.order_date AS OrderDate,
    o.total_amount AS TotalAmount
FROM orders o
JOIN customers c
    ON o.customer_id = c.id;

SELECT 
    o.id AS OrderID,
    c.name AS CustomerName,
    p.name AS ProductName,
    oi.quantity AS Quantity,
    oi.price AS Price
FROM orders o
JOIN customers c
    ON o.customer_id = c.id
JOIN order_items oi
    ON o.id = oi.order_id
JOIN products p
    ON oi.product_id = p.id
ORDER BY o.id;

SELECT 
    c.id AS CustomerID,
    c.name AS CustomerName,
    COUNT(o.id) AS TotalOrders,
    SUM(o.total_amount) AS TotalSpent
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.id, c.name;

SELECT 
    MONTH(order_date) AS Month,
    COUNT(*) AS TotalOrders
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT 
    p.id AS ProductID,
    p.name AS ProductName,
    SUM(oi.quantity) AS TotalSold
FROM products p
JOIN order_items oi
    ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY TotalSold DESC;

SELECT 
    MONTH(order_date) AS Month,
    SUM(total_amount) AS TotalRevenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT 
    c.id AS CustomerID,
    c.name AS CustomerName,
    SUM(o.total_amount) AS TotalSpent
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY TotalSpent DESC
LIMIT 5;

SELECT 
    c.name AS CustomerName,
    p.name AS ProductName,
    SUM(oi.quantity) AS TotalQuantity
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id
INNER JOIN order_items oi
    ON o.id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.id
GROUP BY c.id, c.name, p.id, p.name
ORDER BY c.id, p.id;

SELECT 
    c.id AS CustomerID,
    c.name AS CustomerName,
    COUNT(DISTINCT oi.product_id) AS DifferentProducts
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
JOIN order_items oi
    ON o.id = oi.order_id
GROUP BY c.id, c.name
HAVING COUNT(DISTINCT oi.product_id) >= 2
ORDER BY c.id;

SELECT 
    MONTH(o.order_date) AS Month,
    p.id AS ProductID,
    p.name AS ProductName,
    SUM(oi.quantity) AS TotalQuantity
FROM orders o
JOIN order_items oi
    ON o.id = oi.order_id
JOIN products p
    ON oi.product_id = p.id
WHERE YEAR(o.order_date) = 2024
GROUP BY 
    MONTH(o.order_date),
    p.id,
    p.name
ORDER BY 
    Month,
    ProductID;