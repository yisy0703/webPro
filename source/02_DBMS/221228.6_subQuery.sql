-- [ VI ] Sub Query : ���� QUERY(SQL��) �ȿ� QUERY(SQL��)�� ����

-- �� 1. ���� ���� ����
-- ���������� �ʿ��� ex. �޿��� ���� ���� �޴� ����� �̸��� �޿�
    SELECT ENAME, MAX(SAL) FROM EMP; -- ����
    SELECT ENAME, MAX(SAL) FROM EMP GROUP BY ENAME; -- �� ����
    SELECT MAX(SAL) FROM EMP; -- ��������
    SELECT ENAME, SAL FROM EMP
        WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- ���� ����
        
-- �������� ����(1) ������ ��������(���������� �������� ������) : = > >= < <= != 
    -- ex. scott�� �ٹ��ϴ� �μ��̸� ���
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ��������
SELECT DNAME FROM DEPT 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- ���� ����

SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';-- JOIN�̿�

-- �������� ����(2)������ ��������(�������� �������� 2���̻�) : IN, > ALL, ANY(SOME), EXISTS
    -- ex. job�� MANAGER�� ����� �μ��̸�
    SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- �������� ����� 3��
    SELECT DNAME FROM DEPT 
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); -- ��������

-- �� 2. �����༭������
    -- ex. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� �޿�
    SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ��������
    SELECT ENAME, SAL FROM EMP 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME <> 'SCOTT'; -- ��������
    -- ex. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� �޿�
        -- ������ �߰� (DALLAS 50�� �μ�, 50�� �μ��� HONG ���)
        SELECT * FROM DEPT WHERE LOC='DALLAS';
        INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (9999, 'HONG', 50);
        SELECT * FROM EMP;
    SELECT LOC FROM DEPT D, EMP E
        WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT'; -- ��������
    SELECT ENAME, SAL
        FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO AND LOC=(SELECT LOC FROM DEPT D, EMP E
                    WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT')
            AND ENAME != 'SCOTT'; -- ��������
        ROLLBACK; -- DML(�߰�, ����, ����, �˻�) ��ɾ� ���
    -- ex. �����Ի��ϰ� �����Ի��ڸ� ���
    SELECT MIN(HIREDATE) FROM EMP; -- ������ ��������
    SELECT HIREDATE, ENAME FROM EMP
        WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- ��������
    -- ex. �ֱ��Ի��ϰ� �ֱ��Ի��ڸ� ���
    SELECT MAX(HIREDATE) FROM EMP; -- ��������
    SELECT HIREDATE, ENAME FROM EMP
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- ��������
    -- ex. �����Ի���, �����Ի��� �̸�, �ֱ��Ի���, �ֱ��Ի��� �̸�
    SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME
        FROM EMP E1, EMP E2
        WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
            AND E2.HIREDATE=(SELECT MAX(HIREDATE) FROM EMP); -- ��������
    SELECT 
        (SELECT MIN(HIREDATE) FROM EMP) FIRSTDAY,
        (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN,
        (SELECT MAX(HIREDATE) FROM EMP) LASTDAY,
        (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP)) LASTMAN
    FROM DUAL;
    
    -- ex. SCOTT �� ���� �μ��� �ٹ��ϴ� ������� �޿���
    SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ��������
    SELECT SUM(SAL) FROM EMP 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- ��������
    -- ex. soctt�� ������ job�� ���� ����� ��� �ʵ�
    SELECT JOB FROM EMP WHERE ENAME='SCOTT'; -- �������� 
    SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SCOTT'); -- ��������
    -- ex. DALLAS���� �ٹ��ϴ� ����� �̸��� �μ���ȣ
    SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'; -- ��������
    SELECT ENAME, DEPTNO FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'); -- ��������
    -- ex. 'KING'�� ���ӻ���� ����� �̸��� �޿�
    SELECT EMPNO FROM EMP WHERE ENAME='KING'; -- ��������
    SELECT ENAME, SAL FROM EMP
        WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING'); -- ��������
    
    SELECT W.ENAME, W.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO AND M.ENAME='KING'; -- SELF JOIN�̿�
    -- ex1. ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿��� ���
    SELECT AVG(SAL) FROM EMP; -- ��������
    SELECT ENAME, SAL FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP); -- ��������
    -- ex2. ��ձ޿� ���Ϸ� �޴� ����� �̸���  �޿�, ��ձ޿��� ���
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) "AVG_SAL"
        FROM EMP
        WHERE SAL < (SELECT AVG(SAL) FROM EMP); -- ��������
    
    -- ex3. ��ձ޿� ���Ϸ� �޴� ����� �̸���  �޿�, ��ձ޿����� ���̸� ���
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP))-SAL "DIFF"
        FROM EMP
        WHERE SAL < (SELECT AVG(SAL) FROM EMP);
    
-- ������ ���߿� ��������
    -- ex. SCOTT�� JOB�� �μ���ȣ�� ���� ������ ��� �ʵ� ���.
    SELECT JOB, DEPTNO  FROM EMP WHERE ENAME='SCOTT'; -- ������ ���߿� ��������
    SELECT * FROM EMP
        WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO  FROM EMP WHERE ENAME='SCOTT')
            AND ENAME <> 'SCOTT';

-- �� 3. ������ �������� : IN, ALL, ANY=SOME, EXISTS
-- (1) IN : �������� ��� �� �ϳ��� ��ġ�ϸ� ��
    -- ex. �μ��� �Ի����� ���� ���� ����� �̸�, �Ի���, �μ���ȣ
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- ������ ���߿� ��������
    SELECT ENAME, HIREDATE, DEPTNO FROM EMP
        WHERE (DEPTNO, HIREDATE) IN
                    (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- ��������
    -- ex. �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������� ��� �ʵ�
    SELECT DEPTNO FROM EMP WHERE SAL >= 3000; -- ������ ���Ͽ� ��������
    SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);--��������

-- (2) ALL ; �������� ����� ��� �����ϸ� ��
    -- ex. 30�� �μ����� ����� �޿����� ū ������ ��� �ʵ�
    SELECT SAL FROM EMP WHERE DEPTNO=30; -- 950, 1250, 1500, 1600, 2850 ��������
    SELECT * FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30); -- �����༭������ �̿�
    
    SELECT * FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- �����༭������ �̿�
-- (3) ANY=SOME ; �������� ����� �ϳ��� �����ϸ� ��
    -- ex. 30�� �μ����� �ϳ����̶� �޿��� ū ������ ��� �ʵ�
    SELECT SAL FROM EMP WHERE DEPTNO=30; -- ������ ���Ͽ� ��������
    SELECT * FROM EMP
        WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�
    SELECT * FROM EMP
        WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�

-- (4) EXISTS : �������� ����� �����ϸ� ��
    -- ���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
    SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
        WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); -- �������� �̿�
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO; -- SELF JOIN �̿�
    -- ���Ӻ��ϰ� ���� �������� ���, �̸�, �޿�
    SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
        WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);--�������� �̿�
    SELECT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- SELF JOIN �̿�




-- �� �� ��������
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL <= (SELECT AVG(SAL) FROM EMP);
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND
        HIREDATE <(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT');
--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND
        HIREDATE <(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')
    ORDER BY SAL DESC;
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL 
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� 
    -- ���, �̸�, �޿�
SELECT DEPTNO FROM EMP WHERE ENAME='CLARK'; -- ��������(CLARK�� �μ���ȣ)
SELECT SAL FROM EMP WHERE EMPNO=7698;  -- ��������(7698��� ������ �޿�)
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='CLARK') AND
        SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698);

--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� 
    -- ���, �̸�, �޿�
SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK';--��������1(�μ���)
SELECT SAL FROM EMP WHERE EMPNO=7698;  -- ��������(7698��� ������ �޿�)
SELECT EMPNO, ENAME, SAL 
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND
        DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698);
--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE 
    FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP) 
    ORDER BY SAL DESC;






