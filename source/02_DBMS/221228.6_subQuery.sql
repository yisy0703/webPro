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





