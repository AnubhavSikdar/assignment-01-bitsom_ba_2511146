-- Drop tables if they already exist
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;

-- ========================
-- Dimension Table: Date
-- ========================
CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL
);

-- ========================
-- Dimension Table: Store
-- ========================
CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT NOT NULL,
    city TEXT NOT NULL
);

-- ========================
-- Dimension Table: Product
-- ========================
CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL
);

-- ========================
-- Fact Table
-- ========================
CREATE TABLE fact_sales (
    sale_id INTEGER PRIMARY KEY,
    date_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ========================
-- Insert sample cleaned dimension data
-- ========================

INSERT INTO dim_date VALUES
(1,'2023-01-15',1,2023),
(2,'2023-02-10',2,2023),
(3,'2023-03-05',3,2023),
(4,'2023-04-12',4,2023),
(5,'2023-05-20',5,2023);

INSERT INTO dim_store VALUES
(1,'Central Store','Mumbai'),
(2,'City Mart','Delhi'),
(3,'Urban Shop','Bangalore');

INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'Running Shoes','Sports'),
(3,'Cotton Kurti','Clothing'),
(4,'Desk Lamp','Home'),
(5,'Python Book','Books');

-- ========================
-- Insert Fact Table data
-- ========================

INSERT INTO fact_sales VALUES
(1,1,1,1,2,90000),
(2,1,2,3,5,7500),
(3,2,1,4,3,4500),
(4,2,3,2,4,8000),
(5,3,2,1,1,45000),
(6,3,1,5,6,3000),
(7,4,3,4,2,3000),
(8,4,2,2,3,6000),
(9,5,1,3,4,6000),
(10,5,3,5,5,2500);