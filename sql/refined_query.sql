
SELECT
    c.customerNumber,
    c.customerName,
    COALESCE(SUM(o.totalAmount), 0) AS total_spending,
    COUNT(o.orderNumber) AS order_count
FROM
    customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
WHERE
    o.orderDate >= (SELECT recent_6_month_start FROM reporting_context)
    AND o.orderDate <= date('now')
GROUP BY
    c.customerNumber, c.customerName
HAVING
    COUNT(o.orderNumber) >= 3
ORDER BY
    COALESCE(SUM(o.totalAmount), 0) DESC
LIMIT
    5;
