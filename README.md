# E-Commerce Customer & Revenue Analytics

## Project Overview
This project analyzes e-commerce transaction data to understand customer behavior, product performance, geographic sales distribution, and revenue trends.

The objective was to extract actionable business insights using a combination of Python data analysis, SQL-based querying, and interactive Power BI dashboards.

The project simulates a real-world data analytics workflow:
- Data cleaning and feature engineering using Python
- Business analysis using SQL
- Dashboard visualization using Power BI

---

## Dataset Information
- Total Records: ~541,000 raw transactions
- Cleaned Records Used: ~397,000
- Dataset: Online Retail E-Commerce Transactions
- Features: Invoice details, product information, quantity, price, customer ID, country, and order date.

---

## Data Preparation (Python)
The dataset was cleaned and transformed using Python in Jupyter Notebook.

Key preprocessing steps included:

- Removing missing customer records
- Removing cancelled or returned orders
- Creating new analytical features
- Preparing the dataset for SQL analysis and Power BI visualization

Feature engineering included:

- Revenue = Quantity × UnitPrice
- OrderMonth for time-series analysis
- OrderYear for yearly analysis
- CustomerPurchaseCount to measure repeat purchase behavior
- CustomerLifetimeValue to estimate total customer value

---

## SQL Analysis
SQL was used to perform analytical queries and compute key business metrics.

Key analyses included:

- Total revenue, orders, and customers
- Average order value
- Revenue by country
- Orders by country
- Top products by revenue
- Top products by quantity sold
- Top customers by revenue
- Repeat vs one-time customer analysis
- Monthly revenue trends

Advanced SQL concepts used:
- Window functions
- Ranking queries
- Common table expressions (CTEs)

All SQL queries are available in:
sql/ecommerce_analysis_queries.sql

---

## Dashboard Analysis (Power BI)

A multi-page Power BI dashboard was created to visualize business insights.

### Executive Overview
![Executive Overview](images/executive_overview_dashboard.png)

This page summarizes the overall business performance including:
- Total revenue
- Total orders
- Total customers
- Average order value
- Monthly revenue trends
- Global revenue distribution

---

### Geographic Sales Analysis
![Geographic Sales Analysis](images/geographic_sales_analysis.png)

This page shows how revenue is distributed geographically across countries using a global map visualization.

---

### Product Performance
![Product Performance](images/product_performance_dashboard.png)

This page analyzes product-level sales performance including:
- Top 10 products by revenue
- Top products by quantity sold
- Product revenue vs sales volume analysis

---

### Customer Behavior Analysis
![Customer Behavior Analysis](images/customer_behavior_analysis.png)

This page focuses on customer purchasing behavior including:
- Total customers
- Average purchases per customer
- Repeat vs one-time customer distribution
- Monthly purchasing trends

---

### Revenue Trends & Seasonality
![Revenue Trends](images/revenue_trends_seasonality.png)

This page analyzes time-series revenue trends and monthly sales patterns.

---

## Key Business Insights

- Revenue is concentrated among a small number of high-performing products.
- Repeat customers contribute a significant share of total revenue.
- Sales are geographically concentrated in a limited number of markets.
- Monthly revenue trends suggest potential seasonality in demand.

These insights can help businesses improve marketing strategies, product prioritization, and customer retention efforts.

---

## Tools & Technologies Used

- Python
- Pandas
- Matplotlib
- SQL (SQLite)
- Power BI
- Jupyter Notebook
- Excel

---

## Project Files


- cleaned_ecommerce_data.csv
- ecommerce_revenue_analysis.ipynb
- ecommerce_analysis.db
- ecommerce_analysis_queries.sql
- ecommerce_sales_dashboard.pbix
- dashboard screenshots

---

## Author

Divyansh Sahai  
M.A. Economics — IIFT