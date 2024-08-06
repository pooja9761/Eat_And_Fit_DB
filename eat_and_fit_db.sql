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
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);
-- ---------------------------------------------------------------------------------
-- Table 2: City Details

create table city_main (
primary_key int primary key auto_increment,
city_name varchar(100),
Country Varchar(100)
);
-- ---------------------------------------------------------------------------------
-- Table 3: Store Owner Details

create table onr_main (
primary_key int primary key auto_increment,
onr_id int unique,
onr_name varchar(100),
mobile_no varchar(15),
email varchar (50),
is_corp tinyint(1) not null
);
-- ---------------------------------------------------------------------------------
-- Table 4: Roll Details

create table roll_main (
primary_key int primary key auto_increment,
roll_name varchar(50),
is_corp_user tinyint(1) not null
);
-- ---------------------------------------------------------------------------------
-- Table 5: job Details

Create table job_main (
primary_key int primary key auto_increment,
job_name varchar(50),
is_salary_mrg TINYINT(1) NOT NULL,
fk_roll_main_id int,
foreign key (fk_roll_main_id) references roll_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 6: Stores Details

create table str_main (
primary_key int primary key auto_increment,
store_no int,
store_name varchar(50),
str_add varchar(100),
fk_city_main_id int,
fk_onr_main_id int,
str_open_date date,
str_closed_date date,
is_closed tinyint(1),
foreign key (fk_city_main_id) references city_main(primary_key),
foreign key (fk_onr_main_id) references onr_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 7: Employees Details

CREATE TABLE emp_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    fk_job_main_id int,
    fk_str_main_id int,
    hire_date DATE,
    term_date date,
    is_term tinyint(1) not null,
    FOREIGN KEY (fk_str_main_id) REFERENCES str_main(primary_key),
    FOREIGN KEY (fk_job_main_id) REFERENCES job_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 8: Payroll/ Salary

create table payroll_main (
primary_key int primary key auto_increment,
fk_emp_main_id int,
current_pay decimal (10, 2),
next_pay decimal (10, 2),
next_eff_date date,
foreign key (fk_emp_main_id) references emp_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 9: User Details

create table usr_main (
primary_key int primary key auto_increment,
usr_id varchar (25) unique,
f_name varchar (50),
l_name varchar (50),
fk_str_main_id int,
fk_job_main_id int,
fk_emp_main_id int,
foreign key (fk_str_main_id) references str_main(primary_key),
foreign key (fk_job_main_id) references job_main(primary_key),
foreign key (fk_emp_main_id) references emp_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 10: DiningTables

CREATE TABLE din_table (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    table_num INT,
    ttl_cap INT
);
-- ---------------------------------------------------------------------------------
-- Table 11: Reservations

CREATE TABLE reserve_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    fk_cust_main_id INT,
    fk_din_table_id INT,
    reservation_date DATE,
    reservation_time TIME,
    num_of_people INT,
    FOREIGN KEY (fk_cust_main_id) REFERENCES cust_main(primary_key),
    FOREIGN KEY (fk_din_table_id) REFERENCES din_table(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 12: MenuItems

CREATE TABLE menu_item (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50)
);
-- ---------------------------------------------------------------------------------
-- Table 13: Orders

CREATE TABLE order_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    fk_cust_main_id INT,
    fk_din_table_id INT,
    order_date DATE,
    order_time TIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (fk_cust_main_id) REFERENCES cust_main(primary_key),
    FOREIGN KEY (fk_din_table_id) REFERENCES din_table(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 14: OrderDetails

CREATE TABLE order_details (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    fk_order_main_id INT,
    fk_menu_item_id INT,
    qty INT,
    item_price DECIMAL(10, 2),
    FOREIGN KEY (fk_order_main_id) REFERENCES order_main(primary_key),
    FOREIGN KEY (fk_menu_item_id) REFERENCES menu_item(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 15: Suppliers

CREATE TABLE vendor_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    vendor_name VARCHAR(100),
    contact_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
-- ---------------------------------------------------------------------------------
-- Table 16: Inventory

CREATE TABLE inv_main (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100),
    qty INT,
    fk_vendor_main_id INT,
    reorder_lvl INT,
    unit VARCHAR(50),
    FOREIGN KEY (fk_vendor_main_id) REFERENCES vendor_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 17: Purchases

CREATE TABLE Purchases (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    fk_vendor_main_id INT,
    item_name VARCHAR(100),
    qty INT,
    dvl_date DATE,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (fk_vendor_main_id) REFERENCES vendor_main(primary_key)
);
-- ---------------------------------------------------------------------------------
-- Table 18: Payment Method

CREATE TABLE payment_method (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50)
);
-- ---------------------------------------------------------------------------------
-- Table 19: Order payments

CREATE TABLE payments (
    primary_key INT PRIMARY KEY AUTO_INCREMENT,
    fk_order_main_id INT,
    fk_payment_method_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (fk_order_main_id) REFERENCES order_main(primary_key),
    FOREIGN KEY (fk_payment_method_id) REFERENCES payment_method(primary_key)
);

-- ---------------------------------------------------------------------------------


