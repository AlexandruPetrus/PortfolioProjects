select *
from hrd;

select Position, count(position) as post
from hrd
group by Position
order by post desc;

#How is the gender distribution across different departments?#
SELECT Department, Sex, COUNT(*) AS Number_of_Employees
FROM hrd
GROUP BY Department, Sex
order by Number_Of_Employees desc;

#What is the average salary by department and position?#
SELECT Department, Position, AVG(Salary) AS Average_Salary
FROM hrd
GROUP BY Department, Position;

#What is the turnover rate per department?#
SELECT Department, COUNT(CASE WHEN Termd = 1 THEN 1 END) AS Terminations,
       COUNT(*) AS Total_Employees,
       (COUNT(CASE WHEN Termd = 1 THEN 1 END) / COUNT(*)) * 100 AS Turnover_Percentage
FROM hrd
group by Department;

#How does performance score vary across different departments?#
SELECT Department, PerformanceScore, COUNT(*) AS Number_of_Employees
FROM hrd
GROUP BY Department, PerformanceScore
order by Number_of_Employees desc;

#What is the ethnic diversity in the company?#
SELECT RaceDesc, COUNT(*) AS Number_of_Employees
FROM hrd
GROUP BY RaceDesc;

#Which recruitment sources are bringing in the most employees?#
SELECT RecruitmentSource, COUNT(*) AS Number_of_Employees
FROM hrd
GROUP BY RecruitmentSource
ORDER BY Number_of_Employees DESC;

#What are the common reasons for employee terminations?#
SELECT TermReason, COUNT(*) AS Number_of_Terminations
FROM hrd
WHERE Termd = 1
GROUP BY TermReason
ORDER BY Number_of_Terminations DESC;

#Is there a correlation between engagement scores and employee satisfaction?#
SELECT EngagementSurvey, EmpSatisfaction, COUNT(*) AS Number_of_Employees
FROM hrd
GROUP BY EngagementSurvey, EmpSatisfaction;

#Count of Employees by Marital Status
SELECT MaritalStatusID, COUNT(*) AS Number_of_Employees 
FROM hrd
GROUP BY MaritalStatusID;

#Salary Analysis Based on Gender
SELECT GenderID, AVG(Salary) AS Average_Salary 
FROM hrd
GROUP BY GenderID;

#Correlation between Salary and Performance:
SELECT PerformanceScore, AVG(Salary) AS Average_Salary
FROM hrd
GROUP BY PerformanceScore
ORDER BY AVG(Salary) DESC;

#Analysis of Absenteeism:
SELECT Employee_Name, Absences, PerformanceScore
FROM hrd
WHERE Absences > (SELECT AVG(Absences) FROM hrd)
ORDER BY Absences DESC;

#Employee Satisfaction and Absence Correlation:
SELECT EmpSatisfaction, AVG(Absences) AS Average_Absences
FROM hrd
GROUP BY EmpSatisfaction;