-- Ex1. 부서번호받고 부서정보출력하기
SELECT * FROM DEPT WHERE DEPTNO=40;

-- Ex2. 부서번호받고 부서정보와 사원정보출력(사번, 이름, 급여, 상사명)
SELECT * FROM DEPT WHERE DEPTNO=20;
SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER
  FROM EMP W, EMP M
  WHERE W.MGR=M.EMPNO AND W.DEPTNO=20;
-- Ex3

-- Ex4