-- [ II ] SELECT �� - ��ȸ
-- 1. SELECT ���� �ۼ���
    -- ���� ����(���� : CTRL+ENTER)
SHOW USER;
SELECT * FROM TAB; -- �� ������ ������ �ִ� ���̺� ����
SELECT * FROM EMP; -- EMP���̺��� ��� ��(�ʵ�), ��� ��
SELECT * FROM DEPT; -- DEPT ���̺��� ��� ��(�ʵ�), ��� ��
SELECT * FROM SALGRADE;

-- 2. Ư�� ���� ���
DESC EMP; -- EMP���̺��� ����
SELECT EMPNO, ENAME, SAL, JOB FROM EMP; -- EMPNO, ENAME, SAL, JOB�ʵ� ��� �� �˻�
SELECT EMPNO, ENAME, SAL, JOB, MGR, SAL, COMM FROM EMP;
SELECT EMPNO AS "�� ��", ENAME AS "�̸�", SAL AS "�޿�", JOB AS "��å" FROM EMP;
SELECT EMPNO "�� ��", ENAME "�̸�", SAL "�޿�", JOB  "��å" FROM EMP;
SELECT EMPNO "�� ��", ENAME �̸�, SAL �޿�, JOB  ��å FROM EMP;
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB FROM EMP; -- �ʵ忡 ��Ī�� �δ� ���

-- 3. Ư�� �� ��� : WHERE ��(������) -- �񱳿����� : ����(=), �ٸ���(!=, ^=, <>), >, >=, <, <=
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" FROM EMP WHERE SAL = 3000; -- ����
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL != 3000; -- �ٸ���
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL ^= 3000; -- �ٸ���
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL <> 3000; -- �ٸ���
    -- �� �����ڴ� ����, ����, ��¥�� ��� ����
    -- ex1. ����̸�(ENAME)�� 'A','B','C'�� �����ϴ� ����� ��� �ʵ�
    -- A < AA < AAA < AAAA < AAAAA < AAAAAA < AAAAAAA < AA..A < A...AB ..
SELECT * FROM EMP WHERE ENAME < 'D';
    -- ex2. 81�⵵ ������ �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
    -- ex3. �μ���ȣ(DEPTNO)�� 10�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO=10;
    -- ex4. �̸�(ENAME)�� FORD�� ������ EMPNO, ENAME, MGR(����� ���)�� ���
    -- SQL�� ��ҹ��� ��������. ������ ��ҹ��� ����
select empno, ename, mgr from emp where ename='FORD';
    
-- 4. �������� �������� : AND OR NOT
    -- ex1. �޿�(SAL)�� 2000�̻� 3000������ ������ ��� �ʵ�
SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;
    -- ex2. 82�⵵�� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE>='82/01/01' AND HIREDATE<='82/12/31';
-- ��¥ ǥ��� ���� (���� : YY/MM/DD �Ǵ� RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
SELECT * FROM EMP WHERE HIREDATE>='01-01-1982' AND HIREDATE<='12-31-1982';
SELECT * FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD')>='82/01/01' 
        AND TO_CHAR(HIREDATE, 'RR/MM/DD')<='82/12/31';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    -- ex3. ������ 2400�̻��� ���� ENAME, SAL, ����(SAL*12)�� ���
SELECT ENAME, SAL, SAL*12 ANNUALSAL 
    FROM EMP                     -- (1)
    WHERE ANNUALSAL >= 2400;     -- (2) WHERE������ �ʵ� ��Ī ��� �Ұ�
SELECT ENAME, SAL, SAL*12 ANNUALSAL -- (3)��°
    FROM EMP                      -- (1)��°
    WHERE SAL*12 > 2400;          -- (2)��°
    -- ex4. ������ 10,000 �̻��� ������ ENAME, SAL, ����(����������)
SELECT ENAME, SAL, SAL*12 "����" -- (3)
    FROM EMP           -- (1)
    WHERE SAL*12>2400  -- (2)
    ORDER BY ����;      -- (4)
    -- ex5. 10�� �μ�(DEPTNO)�̰ų� JOB�� MANAGER�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO=10 OR JOB='MANAGER';
    -- ex6. �μ���ȣ�� 10�� �μ��� �ƴ� ������ ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO != 10;
SELECT * FROM EMP WHERE NOT DEPTNO = 10;











