## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem: The raw dataset had inconsistent date formats such as "01-01-2023", "2023/01/01", and "Jan 1, 2023", making it difficult to group and analyze data.
Resolution: All dates were converted into a standard "YYYY-MM-DD" format and split into year, month, and day in the dim_date table.

### Decision 2 — Handling NULL Values
Problem: Some records had missing values for fields like store name or product category, which could break joins and analysis.
Resolution: Missing values were either removed or replaced with default values to ensure all records were complete before loading into dimension tables.

### Decision 3 — Fixing Inconsistent Category Casing
Problem: Product categories appeared in different formats such as "electronics", "Electronics", and "ELECTRONICS", causing grouping errors.
Resolution: All category values were standardized to a consistent format (e.g., "Electronics", "Clothing", "Groceries") before loading into dim_product.
