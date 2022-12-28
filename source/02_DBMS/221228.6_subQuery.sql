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

-- �������� ����(2)������ ��������(�������� �������� 2���̻�) : IN, > ALL, ANY, EXISTS
    -- ex. job�� MANAGER�� ����� �μ��̸�
    SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- �������� ����� 3��
    SELECT DNAME FROM DEPT 
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); -- ��������







