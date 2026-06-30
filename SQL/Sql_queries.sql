-- ==========================================================
-- Project Name : HR Employee Attrition Analysis
-- Tools Used   : MySQL
-- Dataset      : IBM HR Employee Attrition
-- ==========================================================


-- ==========================================================
-- DATABASE
-- ==========================================================

CREATE DATABASE hr_attrition;
USE hr_attrition;


-- ==========================================================
-- TABLE
-- ==========================================================

SELECT *
FROM employees;


-- ==========================================================
-- BASIC ANALYSIS
-- ==========================================================

-- Total Employees

SELECT COUNT(*) AS total_employees
FROM employees;

-- Total Employees Left

SELECT COUNT(*) AS employees_left
FROM employees
WHERE Attrition = 'Yes';

-- Total Employees Stayed

SELECT COUNT(*) AS employees_stayed
FROM employees
WHERE Attrition = 'No';

-- Overall Attrition Rate

SELECT ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
*100.0/
COUNT(*),
2
) AS attrition_rate
FROM employees;


-- ==========================================================
-- DEPARTMENT ANALYSIS
-- ==========================================================

-- Employee Distribution by Department

SELECT Department, COUNT(*) AS total_employees
FROM employees
GROUP BY Department
ORDER BY total_employees DESC;

-- Attrition Count by Department

SELECT Department, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY attrition_count DESC;

-- Attrition Rate by Department

SELECT Department, COUNT(*) AS total_employees,
SUM(
CASE
WHEN Attrition='Yes' THEN 1
ELSE 0
END
) AS attrition_count,
ROUND(
SUM(
CASE
WHEN Attrition='Yes' THEN 1
ELSE 0
END
)*100.0/COUNT(*),
2
) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Average Monthly Income by Department

SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS avg_monthly_income
FROM employees
GROUP BY Department
ORDER BY avg_monthly_income DESC;


-- ==========================================================
-- GENDER ANALYSIS
-- ==========================================================

-- Employee Distribution by Gender

SELECT Gender, COUNT(*) AS total_employees
FROM employees
GROUP BY Gender
ORDER BY total_employees DESC;

-- Attrition Count by Gender

SELECT Gender, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Gender
ORDER BY attrition_count DESC;

-- Attrition Rate by Gender

SELECT Gender, COUNT(*) AS total_employees,
SUM(
CASE
WHEN Attrition='Yes' THEN 1
ELSE 0
END
) AS attrition_count,
ROUND(
SUM(
CASE
WHEN Attrition='Yes' THEN 1
ELSE 0
END
)*100.0/
COUNT(*),
2) AS attrition_rate
FROM employees
GROUP BY Gender
ORDER BY attrition_rate DESC;


-- ==========================================================
-- AGE ANALYSIS
-- ==========================================================

-- Employee Distribution by Age Group

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_employees
FROM employees
GROUP BY age_group
ORDER BY total_employees DESC;


-- Attrition Count by Age Group

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY age_group
ORDER BY attrition_count DESC;


-- Attrition Rate by Age Group

SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition='Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition='Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- ==========================================================
-- OVERTIME ANALYSIS
-- ==========================================================

-- Employee Distribution by Overtime

SELECT OverTime, COUNT(*) AS total_employees
FROM employees
GROUP BY OverTime
ORDER BY total_employees DESC;


-- Attrition Count by Overtime

SELECT OverTime, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY OverTime
ORDER BY attrition_count DESC;


-- Attrition Rate by Overtime

SELECT OverTime,COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition='Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition='Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;


-- ==========================================================
-- BUSINESS TRAVEL ANALYSIS
-- ==========================================================

-- Employee Distribution by Business Travel

SELECT BusinessTravel, COUNT(*) AS total_employees
FROM employees
GROUP BY BusinessTravel
ORDER BY total_employees DESC;


-- Attrition Count by Business Travel

SELECT BusinessTravel, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY BusinessTravel
ORDER BY attrition_count DESC;


-- Attrition Rate by Business Travel

SELECT BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition='Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition='Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;


-- ==========================================================
-- JOB ROLE ANALYSIS
-- ==========================================================

-- Employee Distribution by Job Role

SELECT JobRole, COUNT(*) AS total_employees
FROM employees
GROUP BY JobRole
ORDER BY total_employees DESC;


-- Attrition Count by Job Role

SELECT JobRole, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;


-- Attrition Rate by Job Role

SELECT JobRole, COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;


-- Average Monthly Income by Job Role

SELECT JobRole,
ROUND(AVG(MonthlyIncome),2) AS avg_monthly_income
FROM employees
GROUP BY JobRole
ORDER BY avg_monthly_income DESC;


-- ==========================================================
-- MARITAL STATUS ANALYSIS
-- ==========================================================

-- Employee Distribution by Marital Status

SELECT MaritalStatus,
COUNT(*) AS total_employees
FROM employees
GROUP BY MaritalStatus
ORDER BY total_employees DESC;


-- Attrition Count by Marital Status

SELECT MaritalStatus, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes'
GROUP BY MaritalStatus
ORDER BY attrition_count DESC;

-- Attrition Rate by Marital Status

SELECT MaritalStatus, COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY MaritalStatus
ORDER BY attrition_rate DESC;


-- ==========================================================
-- EDUCATION ANALYSIS
-- ==========================================================

-- Employee Distribution by Education Level

SELECT Education, COUNT(*) AS total_employees
FROM employees
GROUP BY Education
ORDER BY Education;

-- Attrition Count by Education Level

SELECT Education, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes'
GROUP BY Education
ORDER BY Education;

-- Attrition Rate by Education Level

SELECT Education, COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Education
ORDER BY attrition_rate DESC;

-- Average Monthly Income by Education Level

SELECT
    CASE
        WHEN Education = 1 THEN 'Below College'
        WHEN Education = 2 THEN 'College'
        WHEN Education = 3 THEN 'Bachelor'
        WHEN Education = 4 THEN 'Master'
        WHEN Education = 5 THEN 'Doctor'
    END AS education_level,
    ROUND(AVG(MonthlyIncome),2) AS avg_monthly_income
FROM employees
GROUP BY Education
ORDER BY avg_monthly_income DESC;


-- ==========================================================
-- JOB SATISFACTION ANALYSIS
-- ==========================================================

SELECT JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- ==========================================================
-- ENVIRONMENT SATISFACTION ANALYSIS
-- ==========================================================

SELECT EnvironmentSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;


-- ==========================================================
-- WORK LIFE BALANCE ANALYSIS
-- ==========================================================

SELECT WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


-- ==========================================================
-- RELATIONSHIP SATISFACTION ANALYSIS
-- ==========================================================

SELECT RelationshipSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;


-- ==========================================================
-- SALARY CATEGORY ANALYSIS
-- ==========================================================

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_slab,
    COUNT(*) AS total_employees
FROM employees
GROUP BY salary_slab
ORDER BY total_employees DESC;


-- ==========================================================
-- YEARS AT COMPANY ANALYSIS
-- ==========================================================

SELECT YearsAtCompany,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
    AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;


-- ==========================================================
-- YEARS SINCE LAST PROMOTION
-- ==========================================================

SELECT YearsSinceLastPromotion,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
    AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;


-- ==========================================================
-- YEARS WITH CURRENT MANAGER
-- ==========================================================

SELECT YearsWithCurrManager,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
    AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY YearsWithCurrManager
ORDER BY YearsWithCurrManager;


-- ==========================================================
-- SUBQUERY
-- Employees earning above average salary
-- ==========================================================

SELECT EmployeeNumber, JobRole, MonthlyIncome
FROM employees
WHERE MonthlyIncome > (
SELECT AVG(MonthlyIncome)
FROM employees
)
ORDER BY MonthlyIncome DESC;


-- ==========================================================
-- COMMON TABLE EXPRESSION (CTE)
-- Department Average Salary
-- ==========================================================

WITH department_salary AS
(
SELECT Department,
ROUND(
AVG(MonthlyIncome),2
) AS avg_salary
FROM employees
GROUP BY Department
)
SELECT *
FROM department_salary
ORDER BY avg_salary DESC;


-- ==========================================================
-- WINDOW FUNCTION
-- RANK()
-- Highest Salary by Department
-- ==========================================================

SELECT EmployeeNumber, Department, MonthlyIncome,
RANK()
OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS salary_rank
FROM employees;


-- ==========================================================
-- WINDOW FUNCTION
-- DENSE_RANK()
-- ==========================================================

SELECT EmployeeNumber, Department, MonthlyIncome,
DENSE_RANK()
OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS dense_salary_rank
FROM employees;


-- ==========================================================
-- WINDOW FUNCTION
-- ROW_NUMBER()
-- ==========================================================

SELECT EmployeeNumber, Department, MonthlyIncome,
ROW_NUMBER()
OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS row_num
FROM employees;


-- ==========================================================
-- WINDOW FUNCTION
-- LAG()
-- Previous Employee Salary
-- ==========================================================

SELECT EmployeeNumber, MonthlyIncome,
LAG(MonthlyIncome)
OVER(
ORDER BY MonthlyIncome
) AS previous_salary
FROM employees;


-- ==========================================================
-- LAG()
-- Salary Difference
-- ==========================================================

SELECT EmployeeNumber, MonthlyIncome,
LAG(MonthlyIncome)
OVER(
ORDER BY MonthlyIncome
) AS previous_salary,
MonthlyIncome - LAG(MonthlyIncome)
OVER( ORDER BY MonthlyIncome
) AS salary_difference
FROM employees;


-- ==========================================================
-- LAG()
-- Department-wise Previous Salary
-- ==========================================================

SELECT EmployeeNumber, Department, MonthlyIncome,
LAG(MonthlyIncome)
OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS previous_salary
FROM employees;



-- ==========================================================
-- DUPLICATE MONTHLY INCOME VALUES
-- ==========================================================

SELECT MonthlyIncome,
COUNT(*) AS frequency
FROM employees
GROUP BY MonthlyIncome
HAVING COUNT(*) > 1
ORDER BY frequency DESC;