select EMPLOYEE.FirstName, EMPLOYEE.LastName,ASSIGNMENT.HoursWorked from EMPLOYEE inner join
ASSIGNMENT on EMPLOYEE.EmployeeNumber= ASSIGNMENT.EmployeeNumber where ASSIGNMENT.ProjectID = 1200 and
ASSIGNMENT.HoursWorked < (select avg(HoursWorked) from ASSIGNMENT where ProjectID = 1200)
