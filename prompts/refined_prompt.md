
# Refined Prompt — Version 2

## Task

Review your previously generated SQL query.

I identified two potential problems:

1. The COALESCE expression contains incorrect SQL syntax.
2. SQLite does not support the INTERVAL 6 MONTH expression.

## Requirements

Please regenerate the SQL query with these requirements:

- Use valid SQLite syntax throughout.
- Use COALESCE correctly, with the alias outside the function.
- Use reporting_context.recent_6_month_start as the
  start date and date('now') as the end date.
- Keep all original requirements, including the minimum
  of 3 orders and the top 5 customers by total spending.
- Return customerNumber, customerName, total_spending,
  and order_count.

## Output

Return the corrected SQL query and briefly explain
what you changed.
