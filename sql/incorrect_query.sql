Here is the SQLite query that meets the requirements:
```sql
SELECT 
  c.customerNumber,
  c.customerName,
  SUM(od.quantityOrdered * od.priceEach) AS total_spending,
  COUNT(DISTINCT o.orderNumber) AS order_count
FROM 
  customers c
  JOIN orders o ON c.customerNumber = o.customerNumber
  JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE 
  o.orderDate >= (SELECT MAX(orderDate) FROM orders) - INTERVAL 6 MONTH
  AND o.orderDate >= (SELECT date('now') - INTERVAL 6 MONTH) AND o.orderDate <= (SELECT date('now'))
GROUP BY 
  c.customerNumber, c.customerName
HAVING 
  COUNT(DISTINCT o.orderNumber) >= 3
ORDER BY 
  total_spending DESC
LIMIT 
  5;
```
Here's how the query works:

1. We join the `customers` table with the `orders` table on `customerNumber`.
2. We then join the `orders` table with the `orderdetails` table on `orderNumber`.
3. We use the `MAX(orderDate)` from the `orders` table as the end date of the reporting period.
4. We calculate the start date of the reporting period using the `date('now')` function with the `-6 months` modifier.
5. We filter orders to only include those within the reporting period.
6. We calculate the `total_spending` for each customer by summing the `quantityOrdered` times `priceEach` from the `orderdetails` table.
7. We count the unique orders for each customer using `COUNT(DISTINCT o.orderNumber)`.
8. We filter out customers with less than 3 orders during the reporting period.
9. We sort the results by `total_spending` in descending order.
10. We limit the results to the top 5 customers.

Note that I used the `INTERVAL 6 MONTH` expression to specify the duration of the reporting period, which is supported in SQLite.
