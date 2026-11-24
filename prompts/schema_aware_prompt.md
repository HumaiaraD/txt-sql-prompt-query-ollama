
# Schema-Aware Prompt — Version 3

## Objective
Generate SQL using the actual Classic Models
database schema.

## Database Schema

customers:
- customerNumber
- customerName

orders:
- orderNumber
- customerNumber
- orderDate

orderdetails:
- orderNumber
- quantityOrdered
- priceEach

## Prompt
Write a SQLite query to identify the top 5
customers by total spending during the six-month
period ending on the latest order date.

Requirements:

1. Join customers and orders using customerNumber.
2. Join orders and orderdetails using orderNumber.
3. Calculate spending using:
   SUM(quantityOrdered * priceEach)
4. Count orders using COUNT(DISTINCT orderNumber).
5. Use MAX(orderDate) to determine the latest date.
6. Use SQLite-compatible date functions.
7. Include customers with at least 3 orders.
8. Sort by total spending in descending order.
9. Limit the results to 5 customers.

Return:
- customerNumber
- customerName
- total_spending
- order_count

## Evaluation
Pending execution and verification against data.sqlite.
