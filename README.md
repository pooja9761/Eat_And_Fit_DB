# Eat_And_Fit_DB
Simple restaurant database in MySQL with sample data query's

Certainly! Let's break down the database structure and then discuss how to create a flowchart. 

### Database Structure

Here's a summary of the tables in your database along with their relationships:

1. **Customers (`cust_main`)**
   - `primary_key` (PK)
   - `f_name`
   - `l_name`
   - `email`
   - `phone`
   - `address`

2. **Cities (`city_main`)**
   - `primary_key` (PK)
   - `city_name`
   - `Country`

3. **Store Owners (`onr_main`)**
   - `primary_key` (PK)
   - `onr_id` (unique)
   - `onr_name`
   - `mobile_no`
   - `email`
   - `is_corp` (Corporate indicator)

4. **Roles (`roll_main`)**
   - `primary_key` (PK)
   - `roll_name`
   - `is_corp_user` (Corporate user indicator)

5. **Jobs (`job_main`)**
   - `primary_key` (PK)
   - `job_name`
   - `is_salary_mrg` (Salary management indicator)
   - `fk_roll_main_id` (FK to `roll_main`)

6. **Stores (`str_main`)**
   - `primary_key` (PK)
   - `store_no`
   - `store_name`
   - `str_add`
   - `fk_city_main_id` (FK to `city_main`)
   - `fk_onr_main_id` (FK to `onr_main`)
   - `str_open_date`
   - `str_closed_date`
   - `is_closed` (Closed indicator)

7. **Employees (`emp_main`)**
   - `primary_key` (PK)
   - `f_name`
   - `l_name`
   - `email`
   - `phone`
   - `fk_job_main_id` (FK to `job_main`)
   - `fk_str_main_id` (FK to `str_main`)
   - `hire_date`
   - `term_date`
   - `is_term` (Termination indicator)

8. **Payroll (`payroll_main`)**
   - `primary_key` (PK)
   - `fk_emp_main_id` (FK to `emp_main`)
   - `current_pay`
   - `next_pay`
   - `next_eff_date`

9. **Users (`usr_main`)**
   - `primary_key` (PK)
   - `usr_id` (unique)
   - `f_name`
   - `l_name`
   - `fk_str_main_id` (FK to `str_main`)
   - `fk_job_main_id` (FK to `job_main`)
   - `fk_emp_main_id` (FK to `emp_main`)

10. **Dining Tables (`din_table`)**
    - `primary_key` (PK)
    - `table_num`
    - `ttl_cap` (Total capacity)

11. **Reservations (`reserve_main`)**
    - `primary_key` (PK)
    - `fk_cust_main_id` (FK to `cust_main`)
    - `fk_din_table_id` (FK to `din_table`)
    - `reservation_date`
    - `reservation_time`
    - `num_of_people`

12. **Menu Items (`menu_item`)**
    - `primary_key` (PK)
    - `item_name`
    - `description`
    - `price`
    - `category`

13. **Orders (`order_main`)**
    - `primary_key` (PK)
    - `fk_cust_main_id` (FK to `cust_main`)
    - `fk_din_table_id` (FK to `din_table`)
    - `order_date`
    - `order_time`
    - `total_amount`

14. **Order Details (`order_details`)**
    - `primary_key` (PK)
    - `fk_order_main_id` (FK to `order_main`)
    - `fk_menu_item_id` (FK to `menu_item`)
    - `qty`
    - `item_price`

15. **Suppliers (`vendor_main`)**
    - `primary_key` (PK)
    - `vendor_name`
    - `contact_name`
    - `phone`
    - `email`
    - `address`

16. **Inventory (`inv_main`)**
    - `primary_key` (PK)
    - `item_name`
    - `qty`
    - `fk_vendor_main_id` (FK to `vendor_main`)
    - `reorder_lvl`
    - `unit`

17. **Purchases (`Purchases`)**
    - `primary_key` (PK)
    - `fk_vendor_main_id` (FK to `vendor_main`)
    - `item_name`
    - `qty`
    - `dvl_date`
    - `unit_price`

18. **Payment Methods (`payment_method`)**
    - `primary_key` (PK)
    - `method_name`

19. **Order Payments (`payments`)**
    - `primary_key` (PK)
    - `fk_order_main_id` (FK to `order_main`)
    - `fk_payment_method_id` (FK to `payment_method`)
    - `payment_amount`
    - `payment_date`

### Flowchart

A flowchart for your database will help visualize the relationships and processes. Below is a textual representation of how you might structure the flowchart. You would typically use a diagramming tool like Lucidchart, Microsoft Visio, or draw.io to create the visual.

1. **Entities**
   - **Customers**
   - **Cities**
   - **Store Owners**
   - **Roles**
   - **Jobs**
   - **Stores**
   - **Employees**
   - **Payroll**
   - **Users**
   - **Dining Tables**
   - **Reservations**
   - **Menu Items**
   - **Orders**
   - **Order Details**
   - **Suppliers**
   - **Inventory**
   - **Purchases**
   - **Payment Methods**
   - **Order Payments**

2. **Relationships**
   - **Customers** → **Reservations** → **Dining Tables**
   - **Orders** → **Customers**
   - **Orders** → **Dining Tables**
   - **Order Details** → **Orders** → **Menu Items**
   - **Stores** → **Cities**
   - **Stores** → **Store Owners**
   - **Employees** → **Stores**
   - **Employees** → **Jobs** → **Roles**
   - **Payroll** → **Employees**
   - **Users** → **Stores**
   - **Users** → **Jobs**
   - **Users** → **Employees**
   - **Inventory** → **Suppliers**
   - **Purchases** → **Suppliers**
   - **Order Payments** → **Orders**
   - **Order Payments** → **Payment Methods**

### Diagramming the Flowchart

To visualize this:

1. **Start with Entities**: Create a block for each entity.
2. **Draw Relationships**: Use arrows to connect blocks. For example, draw an arrow from "Customers" to "Reservations" to represent that a customer can make a reservation.
3. **Use Notations**: Label each arrow to describe the type of relationship (e.g., "FK to").
