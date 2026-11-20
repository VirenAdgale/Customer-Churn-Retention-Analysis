# Customer Churn & Retention Analysis

An end-to-end data analytics project that explores customer churn behavior, identifies retention patterns, and uncovers factors associated with customer attrition in the telecommunications industry.

The project uses **MySQL, Power BI, Power Query, and DAX** to transform raw customer data into meaningful business insights.

## Project Overview

Customer retention plays a vital role in the growth and profitability of subscription-based businesses. Understanding why customers leave helps businesses identify high-risk customer segments and develop effective retention strategies.

This project analyzes telecom customer data to evaluate churn trends across customer demographics, subscription services, contract types, payment methods, and billing patterns.

## Business Objectives

- Measure overall customer churn and retention rates.
- Identify customer segments with higher churn rates.
- Analyze the relationship between contract types and customer churn.
- Evaluate how payment methods and internet services relate to churn.
- Understand churn patterns across customer tenure and monthly charges.
- Provide data-driven recommendations to improve customer retention.

## Dataset

**IBM Telco Customer Churn Dataset**

- Total Records: 7,043
- Total Columns: 21
- Domain: Telecommunications
- Data includes customer demographics, subscribed services, account information, tenure, billing details, and churn status.

**Dataset Source:** [IBM Telco Customer Churn](https://github.com/IBM/telco-customer-churn-on-icp4d/blob/master/data/Telco-Customer-Churn.csv)

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Data exploration and SQL-based analysis |
| Power BI | Interactive dashboards and data visualization |
| Power Query | Data cleaning and transformation |
| DAX | KPI calculations and analytical measures |
| Excel | Initial data inspection |

## Project Workflow

1. **Data Understanding:** Explored the dataset, examined its structure, and understood the available customer attributes.
2. **Data Cleaning:** Handled missing values, checked duplicate customer records, and validated column data types using Power Query.
3. **SQL Analysis:** Used SQL queries, aggregations, conditional logic, CTEs, and window functions to investigate customer churn patterns.
4. **KPI Development:** Created DAX measures to calculate customer count, churn rate, retention rate, and billing metrics.
5. **Dashboard Development:** Built interactive Power BI reports to present customer overview metrics and detailed churn analysis.
6. **Business Insights:** Interpreted analytical findings and developed recommendations based on observed churn patterns.

## Key Performance Indicators

- Total Customers
- Churned Customers
- Retained Customers
- Customer Churn Rate
- Customer Retention Rate
- Average Monthly Charges
- Total Charges Associated with Churned Customers

## Key Analysis Areas

- **Contract Analysis:** Compare churn across month-to-month, one-year, and two-year contracts.
- **Payment Analysis:** Examine churn patterns across different payment methods.
- **Service Analysis:** Understand churn across internet service categories.
- **Tenure Analysis:** Explore how customer subscription duration relates to churn.
- **Billing Analysis:** Investigate churn across monthly charge ranges.
- **Demographic Analysis:** Compare churn patterns across customer demographics.

## Power BI Dashboard

The dashboard is organized into two report pages:

### 1. Customer Overview
Provides a high-level view of customer metrics, churn, retention, and customer segmentation.

### 2. Churn Analysis
Explores churn patterns across contract types, payment methods, internet services, tenure, and monthly charge ranges.

## Business Recommendations

The analysis is intended to help businesses:

- Prioritize retention efforts for customer segments with higher churn.
- Encourage longer-term subscriptions through suitable contract incentives.
- Review service and billing experiences associated with higher churn.
- Develop targeted retention strategies based on customer behavior and subscription patterns.

## Repository Structure

```text
Customer-Churn-Retention-Analysis/
│
├── README.md
├── SQL/
│   └── churn_analysis.sql
│
├── PowerBI/
│   └── Customer_Churn_Dashboard.pbix
│
└── Dashboard/
    ├── customer_overview.png
    └── churn_analysis.png
```

## Conclusion

This project demonstrates an end-to-end data analytics workflow, combining data preparation, SQL analysis, business intelligence, and data visualization to investigate customer churn and support data-driven retention decisions.
