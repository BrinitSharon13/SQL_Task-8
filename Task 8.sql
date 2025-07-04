use employee;
DELIMITER //
CREATE PROCEDURE IncreaseSalary(IN emp_id INT, IN percent DECIMAL(5,2))
BEGIN
    UPDATE Emp
    SET Salary = Sal + (Sal * percent / 100)
    WHERE EmpID = emp_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END;
//
DELIMITER ;

-- Call procedure
CALL IncreaseSalary(1, 10);  

-- Use function
SELECT GetAnnualSalary(50000);
