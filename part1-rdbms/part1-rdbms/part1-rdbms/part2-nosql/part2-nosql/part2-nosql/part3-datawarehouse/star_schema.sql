-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id TEXT PRIMARY KEY,
    full_date TEXT NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL
);

CREATE TABLE dim_store (
    store_id TEXT PRIMARY KEY,
    store_name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE dim_product (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    transaction_id TEXT PRIMARY KEY,
    date_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    total_amount INTEGER NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- CLEANED INSERT DATA
-- =========================

-- dim_date (standardized YYYY-MM-DD format)
INSERT INTO dim_date VALUES
('D001','2023-01-01',2023,1,1),
('D002','2023-01-02',2023,1,2),
('D003','2023-01-03',2023,1,3),
('D004','2023-01-04',2023,1,4),
('D005','2023-01-05',2023,1,5);

-- dim_store (cleaned names, no NULLs)
INSERT INTO dim_store VALUES
('S001','Store A','Mumbai'),
('S002','Store B','Delhi'),
('S003','Store C','Kolkata');

-- dim_product (consistent category casing)
INSERT INTO dim_product VALUES
('P001','Laptop','Electronics'),
('P002','Shirt','Clothing'),
('P003','Milk','Groceries'),
('P004','Phone','Electronics'),
('P005','Jeans','Clothing');

-- fact_sales (10 rows minimum, cleaned data)
INSERT INTO fact_sales VALUES
('T001','D001','S001','P001',1,50000),
('T002','D001','S002','P002',2,2000),
('T003','D002','S003','P003',3,180),
('T004','D002','S001','P004',1,20000),
('T005','D003','S002','P005',2,3000),
('T006','D003','S003','P001',1,50000),
('T007','D004','S001','P002',3,3000),
('T008','D004','S002','P003',5,300),
('T009','D005','S003','P004',2,40000),
('T010','D005','S001','P005',1,1500);
