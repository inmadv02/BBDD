SET SCHEMA 'hr';

SELECT first_name, last_name, job_title
FROM employees e JOIN jobs j USING (job_id)
     JOIN departments d USING (department_id)
WHERE department_name = 'Administration';