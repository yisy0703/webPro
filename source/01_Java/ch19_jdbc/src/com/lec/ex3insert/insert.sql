-- ex1
INSERT INTO DEPT VALUES (60, 'IT', 'SEOUL');
SELECT * FROM DEPT WHERE DEPTNO>40;
COMMIT;
-- ex2.
SELECT COUNT(*) CNT FROM DEPT WHERE DEPTNO=99;



