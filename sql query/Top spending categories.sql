-- Top 10 Expense Categories

SELECT
    category,
    SUM(amount) AS total_spent,
    COUNT(*) AS num_transactions,
    ROUND(
        SUM(amount) * 100.0 /
        (
            SELECT SUM(amount)
            FROM transactions
            WHERE txn_type = 'debit'
        ),
        2
    ) AS pct_of_total
FROM transactions
WHERE txn_type = 'debit'
GROUP BY category
ORDER BY total_spent DESC
LIMIT 10;
