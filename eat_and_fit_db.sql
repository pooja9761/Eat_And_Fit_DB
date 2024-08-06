-- Ready For Demo Database

-- Drop existing database
DROP DATABASE IF EXISTS Eat_And_Fit;
-- ---------------------------------------------------------------------------------
-- Create new database

CREATE DATABASE Eat_And_Fit;
USE Eat_And_Fit;
-- ---------------------------------------------------------------------------------
-- Table 1: Customers details

CREATE TABLE cust_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each customer
    f_name VARCHAR(50),                        -- First name of the customer
    l_name VARCHAR(50),                        -- Last name of the customer
    email VARCHAR(100),                        -- Email address of the customer
    phone VARCHAR(15),                         -- Phone number of the customer
    address VARCHAR(255)                       -- Address of the customer
);
-- ---------------------------------------------------------------------------------
-- Table 2: City Details

CREATE TABLE city_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each city
    city_name VARCHAR(100),                    -- Name of the city
    Country VARCHAR(100)                       -- Country where the city is located
);
-- ---------------------------------------------------------------------------------
-- Table 3: Store Owner Details

CREATE TABLE onr_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each store owner
    onr_id INT UNIQUE,                         -- Unique ID for each store owner
    onr_name VARCHAR(100),                     -- Name of the store owner
    mobile_no VARCHAR(15),                     -- Mobile number of the store owner
    email VARCHAR(50),                        -- Email address of the store owner
    is_corp TINYINT(1) NOT NULL                -- Indicates if the store owner is corporate (1) or individual (0)
);
-- ---------------------------------------------------------------------------------
-- Table 4: Role Details

CREATE TABLE roll_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each role
    roll_name VARCHAR(50),                     -- Name of the role
    is_corp_user TINYINT(1) NOT NULL           -- Indicates if the role is for corporate users (1) or not (0)
);
-- ---------------------------------------------------------------------------------
-- Table 5: Job Details

CREATE TABLE job_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each job
    job_name VARCHAR(50),                      -- Name of the job
    is_salary_mrg TINYINT(1) NOT NULL,        -- Indicates if the job is related to salary management (1) or not (0)
    fk_roll_main_id INT,                      -- Foreign key to the role associated with the job
    FOREIGN KEY (fk_roll_main_id) REFERENCES roll_main(primary_key) -- Reference to the role table
);
-- ---------------------------------------------------------------------------------
-- Table 6: Stores Details

CREATE TABLE str_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each store
    store_no INT,                              -- Store number
    store_name VARCHAR(50),                    -- Name of the store
    str_add VARCHAR(100),                     -- Address of the store
    fk_city_main_id INT,                      -- Foreign key to the city where the store is located
    fk_onr_main_id INT,                      -- Foreign key to the store owner
    str_open_date DATE,                       -- Date when the store opened
    str_closed_date DATE,                     -- Date when the store closed (if applicable)
    is_closed TINYINT(1),                     -- Indicates if the store is closed (1) or open (0)
    FOREIGN KEY (fk_city_main_id) REFERENCES city_main(primary_key), -- Reference to the city table
    FOREIGN KEY (fk_onr_main_id) REFERENCES onr_main(primary_key) -- Reference to the store owner table
);
-- ---------------------------------------------------------------------------------
-- Table 7: Employees Details

CREATE TABLE emp_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each employee
    f_name VARCHAR(50),                        -- First name of the employee
    l_name VARCHAR(50),                        -- Last name of the employee
    email VARCHAR(100),                        -- Email address of the employee
    phone VARCHAR(15),                         -- Phone number of the employee
    fk_job_main_id INT,                       -- Foreign key to the job assigned to the employee
    fk_str_main_id INT,                       -- Foreign key to the store where the employee works
    hire_date DATE,                           -- Date when the employee was hired
    term_date DATE,                           -- Date when the employee was terminated (if applicable)
    is_term TINYINT(1) NOT NULL,              -- Indicates if the employee is terminated (1) or active (0)
    FOREIGN KEY (fk_str_main_id) REFERENCES str_main(primary_key), -- Reference to the store table
    FOREIGN KEY (fk_job_main_id) REFERENCES job_main(primary_key) -- Reference to the job table
);
-- ---------------------------------------------------------------------------------
-- Table 8: Payroll/ Salary

CREATE TABLE payroll_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each payroll record
    fk_emp_main_id INT,                       -- Foreign key to the employee associated with the payroll record
    current_pay DECIMAL(10, 2),               -- Current pay amount for the employee
    next_pay DECIMAL(10, 2),                  -- Next pay amount for the employee
    next_eff_date DATE,                       -- Date when the next pay becomes effective
    FOREIGN KEY (fk_emp_main_id) REFERENCES emp_main(primary_key) -- Reference to the employee table
);
-- ---------------------------------------------------------------------------------
-- Table 9: User Details

CREATE TABLE usr_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each user
    usr_id VARCHAR(25) UNIQUE,                 -- Unique ID for the user
    f_name VARCHAR(50),                        -- First name of the user
    l_name VARCHAR(50),                        -- Last name of the user
    fk_str_main_id INT,                       -- Foreign key to the store where the user is associated
    fk_job_main_id INT,                       -- Foreign key to the job assigned to the user
    fk_emp_main_id INT,                       -- Foreign key to the employee associated with the user (if applicable)
    FOREIGN KEY (fk_str_main_id) REFERENCES str_main(primary_key), -- Reference to the store table
    FOREIGN KEY (fk_job_main_id) REFERENCES job_main(primary_key), -- Reference to the job table
    FOREIGN KEY (fk_emp_main_id) REFERENCES emp_main(primary_key) -- Reference to the employee table
);
-- ---------------------------------------------------------------------------------
-- Table 10: Dining Tables

CREATE TABLE din_table (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each dining table
    table_num INT,                            -- Number of the dining table
    ttl_cap INT                               -- Total capacity of the dining table
);
-- ---------------------------------------------------------------------------------
-- Table 11: Reservations

CREATE TABLE reserve_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each reservation
    fk_cust_main_id INT,                      -- Foreign key to the customer who made the reservation
    fk_din_table_id INT,                      -- Foreign key to the dining table reserved
    reservation_date DATE,                    -- Date of the reservation
    reservation_time TIME,                    -- Time of the reservation
    num_of_people INT,                       -- Number of people for the reservation
    FOREIGN KEY (fk_cust_main_id) REFERENCES cust_main(primary_key), -- Reference to the customer table
    FOREIGN KEY (fk_din_table_id) REFERENCES din_table(primary_key) -- Reference to the dining table table
);
-- ---------------------------------------------------------------------------------
-- Table 12: Menu Items

CREATE TABLE menu_item (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each menu item
    item_name VARCHAR(100),                    -- Name of the menu item
    description TEXT,                         -- Description of the menu item
    price DECIMAL(10, 2),                     -- Price of the menu item
    category VARCHAR(50)                      -- Category of the menu item (e.g., appetizer, main course)
);
-- ---------------------------------------------------------------------------------
-- Table 13: Orders

CREATE TABLE order_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each order
    fk_cust_main_id INT,                      -- Foreign key to the customer who placed the order
    fk_din_table_id INT,                      -- Foreign key to the dining table where the order was placed
    order_date DATE,                         -- Date when the order was placed
    order_time TIME,                         -- Time when the order was placed
    total_amount DECIMAL(10, 2),             -- Total amount of the order
    FOREIGN KEY (fk_cust_main_id) REFERENCES cust_main(primary_key), -- Reference to the customer table
    FOREIGN KEY (fk_din_table_id) REFERENCES din_table(primary_key) -- Reference to the dining table table
);
-- ---------------------------------------------------------------------------------
-- Table 14: Order Details

CREATE TABLE order_details (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each order detail record
    fk_order_main_id INT,                     -- Foreign key to the order associated with the detail
    fk_menu_item_id INT,                     -- Foreign key to the menu item ordered
    qty INT,                                 -- Quantity of the menu item ordered
    item_price DECIMAL(10, 2),               -- Price of the menu item at the time of the order
    FOREIGN KEY (fk_order_main_id) REFERENCES order_main(primary_key), -- Reference to the order table
    FOREIGN KEY (fk_menu_item_id) REFERENCES menu_item(primary_key) -- Reference to the menu item table
);
-- ---------------------------------------------------------------------------------
-- Table 15: Suppliers

CREATE TABLE vendor_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each supplier
    vendor_name VARCHAR(100),                  -- Name of the supplier
    contact_name VARCHAR(50),                  -- Contact person at the supplier
    phone VARCHAR(15),                         -- Phone number of the supplier
    email VARCHAR(100),                        -- Email address of the supplier
    address VARCHAR(255)                       -- Address of the supplier
);
-- ---------------------------------------------------------------------------------
-- Table 16: Inventory

CREATE TABLE inv_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each inventory item
    item_name VARCHAR(100),                    -- Name of the inventory item
    qty INT,                                  -- Quantity of the inventory item in stock
    fk_vendor_main_id INT,                    -- Foreign key to the supplier of the inventory item
    reorder_lvl INT,                          -- Reorder level for the inventory item
    unit VARCHAR(50),                         -- Unit of measurement for the inventory item
    FOREIGN KEY (fk_vendor_main_id) REFERENCES vendor_main(primary_key) -- Reference to the supplier table
);
-- ---------------------------------------------------------------------------------
-- Table 17: Purchases

CREATE TABLE Purchases (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each purchase record
    fk_vendor_main_id INT,                    -- Foreign key to the supplier from whom the items were purchased
    item_name VARCHAR(100),                   -- Name of the purchased item
    qty INT,                                 -- Quantity of the purchased item
    dvl_date DATE,                           -- Date of delivery for the purchased item
    unit_price DECIMAL(10, 2),               -- Unit price of the purchased item
    FOREIGN KEY (fk_vendor_main_id) REFERENCES vendor_main(primary_key) -- Reference to the supplier table
);
-- ---------------------------------------------------------------------------------
-- Table 18: Payment Method

CREATE TABLE payment_method (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each payment method
    method_name VARCHAR(50)                    -- Name of the payment method (e.g., Cash, Credit Card)
);
-- ---------------------------------------------------------------------------------
-- Table 19: Order payments

CREATE TABLE payments (
    primary_key INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each payment record
    fk_order_main_id INT,                     -- Foreign key to the order associated with the payment
    fk_payment_method_id INT,                 -- Foreign key to the payment method used
    payment_amount DECIMAL(10, 2),            -- Amount paid
    payment_date DATE,                       -- Date of the payment
    FOREIGN KEY (fk_order_main_id) REFERENCES order_main(primary_key), -- Reference to the order table
    FOREIGN KEY (fk_payment_method_id) REFERENCES payment_method(primary_key) -- Reference to the payment method table
);
