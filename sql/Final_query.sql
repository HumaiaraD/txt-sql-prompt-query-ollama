
SELECT
    c.customerNumber,
    c.customerName,
    SUM(od.quantityOrdered * od.priceEach) AS total_spending,
    COUNT(DISTINCT o.orderNumber) AS order_count
FROM customers AS c
JOIN orders AS o
    ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
    ON o.orderNumber = od.orderNumber
WHERE o.orderDate BETWEEN
    date((SELECT MAX(orderDate) FROM orders), '-6 months')
    AND (SELECT MAX(orderDate) FROM orders)
GROUP BY c.customerNumber, c.customerName
HAVING COUNT(DISTINCT o.orderNumber) >= 3
ORDER BY total_spending DESC
LIMIT 5;
