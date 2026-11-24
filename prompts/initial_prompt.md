
# Initial Prompt — Version 1

## Task

Write a SQLite query to identify the top 5 customers
by total spending in the last 6 months, excluding
customers with fewer than 3 orders.

## Schema

- Use the customers, orders, and reporting_context tables.
- Join customers.customerNumber to orders.customerNumber.
- Use orders.orderDate for the 6-month filter.
- Use reporting_context.recent_6_month_start for the
  6-month date boundary.
- Use orders.totalAmount to calculate total spending.
- Use orders.orderNumber to count each customer's orders.

## Constraints

- Only include orders from the last 6 months using
  SQLite-compatible date filtering.
- Group results by customerNumber and customerName.
- Only include customers whose order count is 3 or greater.
- Sort the final results by total spending in descending order.
- Limit the final result to 5 rows.

## Output

Return:
- customerNumber
- customerName
- total_spending
- order_count

Use clear aliases for calculated columns.
