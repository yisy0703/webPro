-- Emp.xml id=empList
SELECT * FROM EMP ORDER BY EMPNO; -- 출력순서 : empno순으로
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM (SELECT * FROM EMP ORDER BY EMPNO) A)
  WHERE RN BETWEEN 6 AND 10;
-- Emp.xml id=empDeptList
SELECT * FROM
    (SELECT ROWNUM RN, A.* 
      FROM (SELECT E.*, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO)A)
  WHERE RN BETWEEN 6 AND 10;
-- Emp.xml id=totCnt
SELECT COUNT(*) FROM EMP;
-- Emp.xml id=detail
SELECT * FROM EMP WHERE EMPNO=7782;
-- Emp.xml id=managerList
SELECT * FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- Emp.xml id=insert
INSERT INTO EMP VALUES (9000, '홍');
-- Emp.xml id=update

-- Emp.xml id=delete

-- Dept.xml id=deptList