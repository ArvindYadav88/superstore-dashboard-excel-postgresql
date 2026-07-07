# Superstore Sales & Profit Dashboard - Excel + PostgreSQL

An interactive business intelligence dashboard built using **Excel** for visualization and **PostgreSQL** for data analysis. This project analyzes the Superstore dataset to track Sales, Profit, Orders, and Customer behavior.

# 📊 Dashboard Preview
[Superstore Dashboard](C:\Users\yadav\OneDrive\Desktop\Excel_dashboard\screenshorts)

*Interactive Excel Dashboard with KPI Cards, Charts, Slicers and Monthly Trend Analysis*

---

#  1. Project Overview
This project demonstrates an end-to-end data analytics workflow:
1.  **Data Source**: Superstore Sales Dataset loaded in PostgreSQL
2.  **Analysis Layer**: 10+ Advanced SQL queries for KPIs, Trends, Segmentation
3.  **Visualization Layer**: Excel Dashboard with Pivot, Charts, Slicers

**Key Business Questions Answered:**
* Which Categories and States drive the most sales?
* How is monthly sales trending year-over-year?
* Which products and customers are most profitable?
* How does discount impact profit margin?

---

# 2. Tech Stack
| Layer | Tool |
| --- | --- |
| **Database** | PostgreSQL 15 |
| **Visualization** | Microsoft Excel 365 - PivotTable, Slicers, Charts |
| **Language** | SQL, Excel Formulas |
| **Version Control** | Git + GitHub |

---

# 3. Database Schema
Table Name: `train`

| Column | Type | Description |
| --- | --- | --- |
| order_id | VARCHAR | Unique Order ID |
| order_date | DATE | Date of Order |
| customer_id | VARCHAR | Unique Customer ID |
| customer_name | VARCHAR | Customer Name |
| region | VARCHAR | Region |
| state | VARCHAR | State |
| category | VARCHAR | Product Category |
| sub_category | VARCHAR | Sub Category |
| product_name | VARCHAR | Product Name |
| sales | NUMERIC | Sales Amount |
| profit | NUMERIC | Profit Amount |
| discount | NUMERIC | Discount % |


## 4. PostgreSQL Analysis Queries
All queries are in `database/queries.sql`

