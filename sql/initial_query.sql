
SELECT
    c.customerNumber,
    c.customerName,
    COALESCE(SUM(o.totalAmount) AS total_spending, 0) AS total_spending,
    COUNT(o.orderNumber) AS order_count
FROM
    customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
WHERE
    o.orderDate >= (SELECT recent_6_month_start FROM reporting_context)
    AND o.orderDate <= (SELECT recent_6_month_start FROM reporting_context) + INTERVAL 6 MONTH
GROUP BY
    c.customerNumber, c.customerName
HAVING
    COUNT(o.orderNumber) >= 3
ORDER BY
    total_spending DESC
LIMIT
    5;
