-- [ III ] join : 2개 이상의 테이블을 연결하여 데이터를 검색하는 방법
SELECT * FROM EMP WHERE ENAME='SCOTT'; -- 1행
SELECT * FROM DEPT; -- 4행
-- CROSS JOIN (FROM 절에 테이블을 2개이상)
SELECT * FROM EMP, DEPT WHERE ENAME='SCOTT'; -- 1(EMP테이블의 갯수)*4(DEPT테이블갯수)

-- ★ 1. EQUI JOIN(공통필드인 DEPTNO값이 일치되는 조건만 JOIN)
SELECT * FROM EMP, DEPT WHERE ENAME='SCOTT' AND EMP.DEPTNO=DEPT.DEPTNO;
    -- ex. 모든 사원의 사번, 이름, job, 상사사번, 부서번호, 부서이름, 근무지
SELECT EMPNO "N O", ENAME, JOB, MGR, EMP.DEPTNO, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
    -- ex. 급여가 2000이상인 직원만 이름, 직책, 급여, 부서명, 근무지 출력
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>2000;
    -- ex. 20번 부서의 직원만 이름, 부서번호, 근무지 출력
SELECT ENAME, D.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=20;
    -- ex. LOC이 CHICAGO인 사람의 이름, 업무, 급여, 부서명, 근무지를 출력
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
    -- ex. 부서번호가 10이거나 20번인 사원의 이름, 업무, 근무지를 출력(급여순)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO IN (10, 20);
    -- ex. JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉((SAL+COMM)*12),
        -- 부서명, 근무지를 출력(연봉이 큰 순으로 정렬)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM, 0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER')
    ORDER BY ANNUALSAL DESC;
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM, 0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND (JOB='SALESMAN' OR JOB='MANAGER')
    ORDER BY ANNUALSAL DESC;
    -- ex. COMM이 NULL이고 SAL이 1200이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명
        -- (부서명 순, 급여 큰 순 정렬)
SELECT ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;
    
    -- 탄탄EX. NEW YORK에서 근무하는 사원의 이름과 급여를 출력하시오

    -- 탄탄EX. ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오

    -- 탄탄EX. 직급이 MANAGER인 사원의 이름, 부서명을 출력하시오

    -- 탄탄EX. Comm이 null이 아닌 사원의 이름, 급여, 부서코드, 근무지를 출력하시오.










