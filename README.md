### The important distinction: If you only complete the assignment, present it as a prompt engineering case study. If you build the application, you can present it as an AI-powered software engineering project.


## SQL Validation Results

The final SQL query was executed successfully against the Classic Models SQLite database.

### Reporting Period
- Latest order date: May 31, 2005
- Reporting window: Six months ending on the latest order date

### Results
- 3 customers met the minimum requirement of 3 orders.
- Euro+ Shopping Channel ranked first with $406,226.92 in total spending across 12 orders.
- Mini Gifts Distributors Ltd. ranked second with $233,157.99 across 8 orders.
- Down Under Souveniers, Inc. ranked third with $114,460.72 across 3 orders.

### Verification

An independent SQL query confirmed that exactly 3 customers met the minimum order-count requirement.

Although the business requested the top 5 customers, the query correctly returned only the 3 eligible customers.

### Key Takeaways

- LLM-generated SQL requires verification before execution.
- Accurate database schemas are essential for reliable SQL generation.
- Prompt refinement helped identify and correct syntax and date-filtering errors.
- Database execution and independent validation confirmed the final results.

## Development Process and AI Assistance

This project explores iterative prompt engineering for SQL generation using Ollama (Llama 3.2).

I used Ollama to generate SQL queries from natural-language business requirements and refined the prompts across multiple iterations.

I also used ChatGPT as a development assistant to help identify SQL errors, improve prompts, and construct a corrected reference query.

I inspected the actual SQLite database schema, executed the corrected query, and independently checked the number of qualifying customers.

The final validated SQL query was developed with AI assistance rather than generated successfully by Ollama alone.

## Key Learning

This project demonstrated the importance of verifying AI-generated code. Even with detailed prompts, Ollama repeatedly produced incorrect SQLite date expressions. Using additional verification and testing helped identify those issues and produce a working query.