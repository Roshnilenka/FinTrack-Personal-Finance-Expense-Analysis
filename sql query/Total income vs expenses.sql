-- Transaction Summary by Type
-- Total income VS expenses
SELECT
    txn_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    ROUND(AVG(amount), 2) AS avg_amount
FROM transactions
GROUP BY txn_type
ORDER BY total_amount DESC;