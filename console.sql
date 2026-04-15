use hr_analytics
Select COUNT(*)From employee

#checked attrition value and count,group by yes no ko divide krne ke liye
SELECT employee.Attrition,COUNT(*)AS total
FROM employee
GROUP BY Attrition;

#order by for alaphabetically and group by for
SELECT employee.Department,employee.Attrition,count(*)AS total
FROM employee
group by Department,Attrition
order by Department;

#attrition percentage check kr ra dept wise round sum use kra taki ek decimal limit tk rhe percentage 20.6666 aisa na aaye
Select
    employee.Department,
Count(*)as Total_employees,
SUM(CASE when employee.Attrition='Yes' THEN 1 ELSE 0 END)AS left_company,
ROUND(SUM(CASE WHEN employee.Attrition='Yes'THEN 1 ELSE 0 END)*100.0/COUNT(*),1)AS attrition_rate
FROM employee
Group By Department
ORDER BY attrition_rate DESC ;

Select employee.Attrition,
Round(AVG(employee.MonthlyIncome),0)AS avg_salary
From employee
group by Attrition;
#means daily rate doesn't matter much but monthly income matter kr ri

#now check kr ra ki overtime and attrion ke beech koi and kya connection hai
SELECT
  OverTime,
  COUNT(*) AS total,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_company,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM employee
GROUP BY OverTime;
#I found that people who are doing overtime have the attrition rate of 30.5% no overtime walon ka 10.4% hai

#cast use kiya kyunki sql int ko str smjh ra tha and glt value de ra tha,and no type kra unsigned kyunki
#unsigned value can never be negative,and salary kaise negative hogi
SELECT
  MIN(CAST(MonthlyIncome AS UNSIGNED)),
  MAX(CAST(MonthlyIncome AS UNSIGNED)),
  ROUND(AVG(CAST(MonthlyIncome AS UNSIGNED)), 0) AS avg_income
FROM employee;


#case is used to start a block and end is used to close a block
SELECT
  CASE
    WHEN CAST( MonthlyIncome AS UNSIGNED ) < 3000 THEN 'Low'
    WHEN CAST(MonthlyIncome AS UNSIGNED ) BETWEEN 3000 AND 7000 THEN 'Mid'
    ELSE 'High'
  END AS salary_band,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM employee
GROUP BY salary_band
ORDER BY attrition_rate DESC;
