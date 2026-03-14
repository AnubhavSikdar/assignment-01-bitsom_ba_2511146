# Anomaly Analysis

## Insert Anomaly

This table contains product information stored together with order information.

If the company wants to add a new product, it cannot be inserted unless an order exists.

For Example,
If a new product like:

- product_id = P009
- product_name = Keyboard
- category = Electronics
- unit_price = 1500

is to be added, we cannot store it because fields like order_id, customer_id, and sales_rep_id are required.

So the database forces us to create a fake order just to store the product.

This is an **insert anomaly**.


## Update Anomaly

Some information is repeated in many rows.

For example, sales representative Deepak Joshi (SR01) appears in many orders with the same office address:

Mumbai HQ, Nariman Point, Mumbai - 400021

Example rows include:

- ORD1114
- ORD1091
- ORD1054

If the office address changes, it must be updated in every row where SR01 appears.
If one row is missed, the database will have inconsistent data.

This is an **update anomaly**.

## Delete Anomaly

Deleting an order can also remove important information.

Example:
- Row ORD1027 contains product information for:
- product_id = P004
- product_name = Notebook
- category = Stationery

If this order is deleted and it was the only record for that product, the product information would also be lost.

This is a **delete anomaly**.


# Normalization Justification

Keeping everything in one table may look simple, but it creates many problems.

In this dataset, customer details, product details, and sales representative details are repeated many times. For example, Priya Sharma from Delhi appears in multiple orders. If her email changes, it must be updated in every row where she appears.

The same issue happens with sales representatives. For example, Deepak Joshi's office address appears in many rows. Updating it in multiple places increases the risk of mistakes.

Another issue is that new products cannot be stored unless an order exists.

Normalization solves these problems by splitting the data into separate tables such as Customers, Products, Orders, and Sales Representatives. Each piece of information is stored only once and linked using keys.

This reduces duplication, prevents anomalies, and keeps the data consistent.