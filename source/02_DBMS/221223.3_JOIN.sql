-- [ III ] join : 2�� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���
SELECT * FROM EMP WHERE ENAME='SCOTT'; -- 1��
SELECT * FROM DEPT; -- 4��
-- CROSS JOIN (FROM ���� ���̺��� 2���̻�)
SELECT * FROM EMP, DEPT WHERE ENAME='SCOTT'; -- 1(EMP���̺��� ����)*4(DEPT���̺���)

-- �� 1. EQUI JOIN(�����ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * FROM EMP, DEPT WHERE ENAME='SCOTT' AND EMP.DEPTNO=DEPT.DEPTNO;
    -- ex. ��� ����� ���, �̸�, job, �����, �μ���ȣ, �μ��̸�, �ٹ���
SELECT EMPNO "N O", ENAME, JOB, MGR, EMP.DEPTNO, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
    -- ex. �޿��� 2000�̻��� ������ �̸�, ��å, �޿�, �μ���, �ٹ��� ���
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>2000;
    -- ex. 20�� �μ��� ������ �̸�, �μ���ȣ, �ٹ��� ���
SELECT ENAME, D.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=20;
    -- ex. LOC�� CHICAGO�� ����� �̸�, ����, �޿�, �μ���, �ٹ����� ���
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
    -- ex. �μ���ȣ�� 10�̰ų� 20���� ����� �̸�, ����, �ٹ����� ���(�޿���)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO IN (10, 20);
    -- ex. JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����((SAL+COMM)*12),
        -- �μ���, �ٹ����� ���(������ ū ������ ����)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM, 0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER')
    ORDER BY ANNUALSAL DESC;
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM, 0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND (JOB='SALESMAN' OR JOB='MANAGER')
    ORDER BY ANNUALSAL DESC;
    -- ex. COMM�� NULL�̰� SAL�� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ���
        -- (�μ��� ��, �޿� ū �� ����)
SELECT ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;
    
    -- źźEX. NEW YORK���� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�

    -- źźEX. ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�

    -- źźEX. ������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�

    -- źźEX. Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.










