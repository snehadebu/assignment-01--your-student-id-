## Anomaly Analysis

### Insert Anomaly
In the dataset, order and customer information are stored together. For example, in row with order_id "ORD2001", customer_id "CUST028" is recorded along with order details. If a new customer needs to be added but has not placed any order yet, there is no way to insert that customer into the dataset. This is because customer data is dependent on order rows.

### Update Anomaly
Customer information is repeated across multiple rows. For example, customer_id "CUST032" appears in multiple rows such as "ORD2002" and "ORD2037". If any customer detail needs to be updated, all rows must be modified. Missing even one row will result in inconsistent data.

### Delete Anomaly
If an order is deleted, associated customer information may also be lost. For example, if the only order for customer_id "CUST050" (such as order_id "ORD2033") is deleted, then all information about that customer is removed from the dataset.
