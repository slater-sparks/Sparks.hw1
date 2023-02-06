use employees;
# Q1: Write SQL Code to count the number of employees – 1 pts
select count(first_name) from employees;

#Q2: Write SQL Code to output the current name of all of the departments - 2 pts
select * from departments;

#Q3: How many employees are in Finance? - 2 pts
select count(emp_no), dept_no from dept_emp where dept_no = "d002";

#Q4: How many women work in development? – 3 pts
select count(employees.emp_no) from employees, dept_emp
where employees.emp_no = dept_emp.emp_no
and dept_no = "d005"
and employees.gender = "F";

#Q5: What is the top salary in the company? 3 pts
Select salary from salaries
order by salary DESC
limit 1;

#Q6: What is the average salary for Marketing? 4 pts
select avg(salary) from salaries, dept_emp
where dept_emp.emp_no = salaries.emp_no
and dept_no = "d001";

#Q7: What is the lowest salary in the company, who is it and what is their title and department? 5 pts
select salary, title, first_name as 'First Name', last_name as 'Last Name', dept_no as 'Department Number' from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join salaries on employees.emp_no = salaries.emp_no
join titles on employees.emp_no = titles.emp_no
order by salary ASC
limit 1;

#Q8: Who is the oldest person at the company and what is their age? 5 pts
select first_name as 'First Name', last_name as 'Last Name', birth_date as 'Birthday', date_format(from_days(datediff(now(), birth_date)), '%Y') + 0 AS Age from employees
order by birth_date ASC
limit 1;
