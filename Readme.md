HR Attrition Analytics: End-to-End Data Project
This project provides a deep dive into Employee Attrition using SQL for data exploration and Power BI for advanced visualization. The goal is to identify why employees leave and provide data-driven recommendations to HR.

 Tech Stack
Database: MySQL (Exploratory Data Analysis)

Visualization: Power BI Desktop

Skills: SQL Queries, DAX Measures, Data Modeling, UI/UX Dashboard Design

 SQL Insights (Exploratory Data Analysis)
Before building the dashboard, I performed SQL analysis to find the "Red Flags." Key findings include:

Total Employee Count: Verified the dataset size (1,470 employees).

The Overtime Killer: Employees doing Overtime have a 30.5% attrition rate, compared to only 10.4% for those who don't.

Salary Impact: Average monthly income for those who left was significantly lower than those who stayed.

Departmental Trends: Calculated attrition percentage by department using CASE and ROUND to find the highest churn areas.

Salary Banding: Categorized income into Low, Mid, and High bands to see where the maximum "flight risk" exists.

Key Query Example:

SQL
SELECT OverTime, COUNT(*) AS total, 
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM employee GROUP BY OverTime;
 Power BI Dashboard Features
The dashboard is divided into two main views to cater to different HR needs:

1. Executive Overview (Page 1)
High-Level KPIs: Total Employees, Attrition Rate (16.12%), and Total Leavers (237).

Trend Analysis: Line chart showing attrition spikes in the first 2 years of joining.

Salary & Overtime: Visualizing the direct correlation between work-life balance and retention.

2. Retention Drivers (Page 2)
Satisfaction Heatmap: A Matrix visual correlating Job Satisfaction and Environment Satisfaction.

Job Level Crisis: A Donut chart highlighting that 60% of leavers are from Job Level 1.

Role-wise Analysis: Identifying specific roles (like Sales Reps) with the highest attrition rates.

 Top Recommendations for HR
Entry-Level Support: Focus on Job Level 1 retention as it accounts for the majority of the churn.

Overtime Policy: Review the workload for roles requiring excessive overtime to prevent burnout.

Environment Check: Investigate departments with low "Environment Satisfaction" ratings (1-2) as they show the highest attrition risk.

Dashboard Preview
### 1. Executive Overview
Focuses on high-level KPIs, attrition trends over time, and work-life balance (Overtime).
![Executive Overview](Images/up1.png)

---

### 2. Retention Drivers
Deep dive into satisfaction levels, job roles, and employee job levels to identify churn root causes.
![Retention Drivers](Images/up2.png)
