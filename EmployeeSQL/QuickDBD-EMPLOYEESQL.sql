-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a7j15G
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- CRITERIA FOR SETTING UP THE KEYS
-- 1. EVERY DEPARTMENT HAS A UNIQUE NUMBER THAT RELATES TO TO THE DEPARTMENT NAME
-- 2. EVERY EMPLOYEE HAS A UNIQUE NUMBER WITH ALL THEIR DETAILS THAT RELATES TO THEIR SALARY, TITLE DEPARTMENT.
-- 3. EVERY TITLE HAS A UNIQUE ID
CREATE TABLE [Departments] (
    [dept_no] VARCHAR(30)  NOT NULL ,
    [dept_name] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Department_Employee] (
    [dept_no] VARCHAR(30)  NOT NULL ,
    [emp_no] INTEGER  NOT NULL 
)

CREATE TABLE [Employees] (
    [emp_no] INTEGER  NOT NULL ,
    [emp_title_id] VARCHAR(30)  NOT NULL ,
    [birth_date] VARCHAR(30)  NOT NULL ,
    [first_name] VARCHAR(30)  NOT NULL ,
    [last_name] VARCHAR(30)  NOT NULL ,
    [sex] VARCHAR(2)  NOT NULL ,
    [hire_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INTEGER  NOT NULL ,
    [salary] INTEGER  NOT NULL 
)

CREATE TABLE [Department_Manager] (
    [dept_no] VARCHAR(50)  NOT NULL ,
    [emp_no] INTEGER  NOT NULL 
)

CREATE TABLE [Title] (
    [title_id] VARCHAR(30)  NOT NULL ,
    [title] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [Department_Employee] WITH CHECK ADD CONSTRAINT [FK_Department_Employee_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Department_Employee] CHECK CONSTRAINT [FK_Department_Employee_dept_no]

ALTER TABLE [Department_Employee] WITH CHECK ADD CONSTRAINT [FK_Department_Employee_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Department_Employee] CHECK CONSTRAINT [FK_Department_Employee_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [Title] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_title_id]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Department_Manager] WITH CHECK ADD CONSTRAINT [FK_Department_Manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_dept_no]

ALTER TABLE [Department_Manager] WITH CHECK ADD CONSTRAINT [FK_Department_Manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_emp_no]

CREATE INDEX [idx_Department_Employee_dept_no]
ON [Department_Employee] ([dept_no])

CREATE INDEX [idx_Department_Manager_emp_no]
ON [Department_Manager] ([emp_no])

COMMIT TRANSACTION QUICKDBD