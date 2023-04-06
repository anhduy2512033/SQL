-- create the database
CREATE DATABASE EmployeeDB;
GO
-- use the database
USE EmployeeDB;
GO
-- create the department table
CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);
GO
-- create the employee table
CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
    Salary MONEY,
    CONSTRAINT fk_Department FOREIGN KEY (DepartID) REFERENCES Department(DepartId)
);
GO
-- cau 1
-- insert into department table
INSERT INTO Department (DepartId, DepartName, Description)
VALUES 
    (101, 'Sales', 'Ban san pham va dich vu'),
    (102, 'Marketing', 'Quang ba cac san pham'),
    (103, 'Engineering', 'Thiet ke va xay dung san pham');
GO

-- insert into employee table
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES
    ('E10101', 'Duy', 'Anh', '2000-01-01', 1, 'Ha Noi', 101, 50000),
    ('E10102', 'Van', 'Cuong', '1999-05-12', 0, 'Bac Ninh', 101, 55000),
    ('E10201', 'Thanh', 'Tam', '1985-07-23', 1, 'Ninh Binh', 102, 60000),
    ('E10202', 'Hai', 'Linh', '1990-10-15', 0, 'Hai Phong', 102, 65000),
    ('E10301', 'Quang', 'Trung', '1979-03-07', 1, 'Da Nang', 103, 70000),
    ('E10302', 'Nguyen', 'Hue', '2003-11-28', 0, 'TP HCM', 103, 75000);
GO
--cau 2
UPDATE Employee
SET Salary = Salary * 1.1;
--cau3
ALTER TABLE Employee
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);
--cau 4

--cau 5
CREATE UNIQUE NONCLUSTERED INDEX IX_DepartmentName
ON Department (DepartName);
--cau 6
CREATE VIEW EmployeeDepartmentView
AS
SELECT e.EmpCode, CONCAT(e.FirstName, ' ', e.LastName) AS FullName, d.DepartName AS DepartmentName
FROM Employee e
INNER JOIN Department d ON e.DepartID = d.DepartId;
SELECT * FROM EmployeeDepartmentView;

