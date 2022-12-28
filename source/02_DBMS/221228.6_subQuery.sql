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








