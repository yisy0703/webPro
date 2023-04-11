SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%';
SELECT * FROM EMP WHERE JOB LIKE '%'||'E'||'%';
SELECT * FROM EMP WHERE DEPTNO=20;
-- Emp.xml의 id=empList
SELECT * FROM EMP ; -- 1.
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%'; -- 2
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'E'||'%'; -- 3
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'E'||'%'
  AND DEPTNO=20; -- 4
-- Dept.xml의 id=deptList
select * from dept;
  
