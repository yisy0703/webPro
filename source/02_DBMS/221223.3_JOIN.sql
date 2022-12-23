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
    
    -- źźex1. NEW YORK���� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
    -- źźex2. ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND DNAME='ACCOUNTING';
    -- źźex3. ������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER';
    -- źźex4. Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND NOT COMM IS NULL;
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;

-- �� 2. NON-EQUI JOIN
SELECT * FROM EMP WHERE ENAME='SCOTT'; -- ���� ����
SELECT * FROM SALGRADE; -- �޿� ��� ����
SELECT * FROM EMP, SALGRADE WHERE ENAME='SCOTT'; -- CROSS JOIN
SELECT * FROM EMP, SALGRADE WHERE SAL >= LOSAL AND SAL <= HISAL AND ENAME='SCOTT';-- NONEQUI
SELECT * FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME='SCOTT'; -- NONEQUI
    --ex. ������� ���, �̸�, ��å, �����, �޿�, �޿����(1���, 2���, ..)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'���' GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

  --źźex1 Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND NOT COMM IS NULL;
  --źźex2 �̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE, GRADE 
    FROM EMP, SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL;
  --źźex3 �̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
  --źźex4 �̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND COMM IS NOT NULL;
  --źźex5 �̸�, �޿�, �޿����, ����, �μ���, �μ��� ����, �μ��� ������ ������. 
        -- ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 "ANNUAL_SAL", DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, ANNUAL_SAL;
  --źźex6 �̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. 
        -- �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;
  --źźex7 �̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND TO_CHAR(HIREDATE, 'RR') = '81'
    ORDER BY GRADE DESC;

-- �� 3. SELF-JOIN
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME='SMITH';
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO=7902;
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME='SMITH' AND WORKER.MGR=MANAGER.EMPNO;
    -- ex. ��� ����� ���, �̸�, ����� ���, ����� �̸�
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO; -- 13�� (KING�� MGR�� NULL�̶�. EMPNO�� NULL�Ұ�)
DESC EMP;
    -- ex. 'SMITH�� ���� FORD��' �������� ���
SELECT W.ENAME || '�� ���� ' || M.ENAME || '��' MESSAGE
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
  -- źźex1. �Ŵ����� KING�� ������� �̸��� ������ ����Ͻÿ�.
SELECT W.ENAME, W.JOB
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO AND M.ENAME='KING';
  -- źźex2. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�
--hint
SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.ENAME='SCOTT' AND E1.DEPTNO=E2.DEPTNO;
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME='SCOTT' AND E1.DEPTNO=E2.DEPTNO AND E2.ENAME <> 'SCOTT';
  
  -- źźex3. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�(2�� ��ȭ)
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';
SELECT ENAME FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS' AND ENAME <> 'SCOTT';
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP VALUES (9999,'ȫ', NULL, NULL, NULL, 6000,NULL, 50);

-- hint:
SELECT E1.ENAME, D1.LOC, E2.ENAME, D2.LOC
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO AND E2.DEPTNO=D2.DEPTNO
        AND E1.ENAME='SCOTT' AND D1.LOC=D2.LOC;
SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO AND E2.DEPTNO=D2.DEPTNO
        AND E1.ENAME='SCOTT' AND D1.LOC=D2.LOC AND E2.ENAME <> 'SCOTT';
-- ȫ������ 50������ ������ ���󺹱�(����)
ROLLBACK;

-- �� 3. OUTER JOIN ; EQUI JOIN & SELF JOIN�� ���ǿ� �������� �ʴ� ����� ��Ÿ����
-- (1) SELF JOIN������ OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    -- ex. "SMITH�� ���� FORD" ... "KING�� ���� ����"
SELECT W.ENAME || '�� ���� ' || NVL(M.ENAME, '����')
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    -- ex. ���ܻ��
SELECT M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
-- (2) EQUI JOIN������ OUTER JOIN
SELECT * FROM EMP ; -- 14��
SELECT * FROM DEPT; -- 4�� (10,20,30,40 �μ�)
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO; -- 40�� �μ� ��� �ȵ�
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO(+)=D.DEPTNO; -- 40�� �μ� ����

-- �� �������� PART 1
--1. �̸�, ���ӻ���

--2. �̸�, �޿�, ����, ���ӻ���

--3. �̸�, �޿�, ����, ���ӻ��� . (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)

--4. �̸�, �޿�, �μ���, ���ӻ���

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)

--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���

--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)

--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����

--  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ���

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������

--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.

--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)

--10. �����, ����, ����� ������ �˻��Ͻÿ�

--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�






