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

While keeping all the data in one big table might seem easier at first, it actually creates a massive headache for anyone trying to manage it. This is why database normalization is such a lifesaver.

Right now, the dataset is full of redundant information. For example, a customer like Priya Sharma has her name, city, and email repeated every single time she places an order. This leads to a major issue called an update anomaly. If Priya changes her email address, we would have to hunt down every single row where she appears and update it manually. If we miss even one spot, your data becomes inconsistent and unreliable.

The same thing happens with sales reps like Deepak Joshi. His office address is copied across dozens of rows. If his office moves, we're stuck doing a repetitive, error-prone cleanup. Also, there’s a storage problem: under the current setup, we can’t even add a new product to the system until someone actually buys it, which makes it impossible to keep a proper inventory.

Normalization fixes this by breaking the data into logical, separate tables like Customers, Products, Orders, and Sales Reps. Instead of repeating everything, we store each detail exactly once and use Foreign Keys to link them together. It might mean managing more tables, but it completely removes redundancy, prevents errors, and makes the database much easier to scale as the business grows.