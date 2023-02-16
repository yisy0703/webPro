SELECT * FROM EMP; -- 실행하고자 하는 SQL문을 블럭잡고 alt+x로 실행 ex2_oracle.jsp
-- ex3
SELECT * FROM DEPT;
SELECT * FROM EMP WHERE DEPTNO LIKE '%'||'10';
-- example.jsp
SELECT E.*, DNAME FROM EMP E, DEPT D 
  WHERE D.DEPTNO=E.DEPTNO and ENAME LIKE '%'||trim(UPPER('   s'))||'%';

