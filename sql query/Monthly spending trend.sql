-- Monthly Income, Expense and Net Savings
SELECT
    YEAR(txn_date)  AS yr,
    MONTH(txn_date) AS mo,
    MONTHNAME(txn_date) AS month_name,
    SUM(CASE WHEN txn_type = 'Income'  THEN amount ELSE 0 END) AS total_income,
    SUM(CASE WHEN txn_type = 'Expense' THEN amount ELSE 0 END) AS total_expense,
    SUM(CASE WHEN txn_type = 'Income'  THEN amount ELSE 0 END) -
    SUM(CASE WHEN txn_type = 'Expense' THEN amount ELSE 0 END) AS net_savings
FROM transactions
GROUP BY yr, mo, month_name
ORDER BY yr, mo;