-- Run in MYSQL Workbench

CREATE DATABASE fintrack;
USE fintrack;

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    txn_date DATE,
    category VARCHAR(50),
    description VARCHAR(100),
    amount DECIMAL(10,2),
    txn_type VARCHAR(20)  -- 'Income' or 'Expense'
);

ALTER TABLE transactions
ADD COLUMN account_name VARCHAR(100);

