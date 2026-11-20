CREATE DATABASE customer_churn_analysis;

USE customer_churn_analysis;

SELECT *
FROM customer_churn
LIMIT 10;
SELECT COUNT(*) AS total_customers
FROM customer_churn;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE
        WHEN TotalCharges IS NULL OR TRIM(TotalCharges) = ''
        THEN 1 ELSE 0
    END) AS missing_total_charges
FROM customer_churn;

DESCRIBE customer_churn;


SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    SUM(CASE
        WHEN Churn = 'No' THEN 1
        ELSE 0
    END) AS retained_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate,

    ROUND(
        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS retention_rate

FROM customer_churn;


SELECT
    Contract,
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT
    InternetService,
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        WHEN tenure <= 60 THEN '49-60 Months'
        ELSE '61-72 Months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY tenure_group
ORDER BY MIN(tenure);

SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customer_churn
GROUP BY Churn;

SELECT
    CASE
        WHEN MonthlyCharges <= 30 THEN 'Low'
        WHEN MonthlyCharges <= 60 THEN 'Medium'
        WHEN MonthlyCharges <= 90 THEN 'High'
        ELSE 'Very High'
    END AS charge_range,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY charge_range
ORDER BY
    CASE charge_range
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END;
    

SELECT
    gender,
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn
GROUP BY gender
ORDER BY churn_rate DESC;


SELECT
    COUNT(*) AS zero_tenure_customers,
    SUM(CASE
        WHEN TotalCharges IS NULL OR TRIM(TotalCharges) = ''
        THEN 1 ELSE 0
    END) AS missing_total_charges
FROM customer_churn
WHERE tenure = 0;

WITH churn_segments AS (
    SELECT
        Contract,
        InternetService,
        COUNT(*) AS total_customers,

        SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS churn_rate

    FROM customer_churn
    GROUP BY Contract, InternetService
)

SELECT
    *,
    RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM churn_segments
ORDER BY churn_rank;


WITH tenure_analysis AS (
    SELECT
        CASE
            WHEN tenure <= 12 THEN '0-12 Months'
            WHEN tenure <= 24 THEN '13-24 Months'
            WHEN tenure <= 48 THEN '25-48 Months'
            WHEN tenure <= 60 THEN '49-60 Months'
            ELSE '61-72 Months'
        END AS tenure_group,

        COUNT(*) AS total_customers,

        SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS churn_rate

    FROM customer_churn
    GROUP BY tenure_group
)

SELECT
    *,
    DENSE_RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM tenure_analysis
ORDER BY churn_rank;

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE WHEN PhoneService = 'Yes' THEN 1 ELSE 0 END) AS phone_service_customers,
    SUM(CASE WHEN MultipleLines = 'Yes' THEN 1 ELSE 0 END) AS multiple_lines_customers,
    SUM(CASE WHEN OnlineSecurity = 'Yes' THEN 1 ELSE 0 END) AS online_security_customers,
    SUM(CASE WHEN OnlineBackup = 'Yes' THEN 1 ELSE 0 END) AS online_backup_customers,
    SUM(CASE WHEN TechSupport = 'Yes' THEN 1 ELSE 0 END) AS tech_support_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS total_churned,

    SUM(CASE WHEN Churn = 'Yes' AND PhoneService = 'Yes' THEN 1 ELSE 0 END) AS phone_service_churned,
    SUM(CASE WHEN Churn = 'Yes' AND OnlineSecurity = 'Yes' THEN 1 ELSE 0 END) AS online_security_churned,
    SUM(CASE WHEN Churn = 'Yes' AND TechSupport = 'Yes' THEN 1 ELSE 0 END) AS tech_support_churned

FROM customer_churn;


SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(SUM(TotalCharges), 2) AS total_charges,
    ROUND(AVG(TotalCharges), 2) AS average_total_charges,
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_charges,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customer_churn
GROUP BY Churn;
SHOW TABLES;
