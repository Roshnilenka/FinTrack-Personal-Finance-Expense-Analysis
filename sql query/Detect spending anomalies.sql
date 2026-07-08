-- Find transactions significantly above category average
-- Anomalies Analysis
-- Find transactions significantly above category average

SELECT
    t.txn_date,
    t.category,
    t.description,
    t.amount,
    ROUND(avg_by_cat.avg_amount, 2) AS category_avg,
    ROUND(t.amount - avg_by_cat.avg_amount, 2) AS above_avg_by
FROM transactions AS t
JOIN (
    SELECT
        category,
        AVG(amount) AS avg_amount
    FROM transactions
    WHERE txn_type = 'debit'
    GROUP BY category
) AS avg_by_cat
ON t.category = avg_by_cat.category
WHERE t.txn_type = 'debit'
  AND t.amount > avg_by_cat.avg_amount * 1.5
ORDER BY above_avg_by DESC
LIMIT 10;