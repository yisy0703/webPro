-- [ V ] �׷��Լ� : SUM, AVG, MIN, MAX, COUNT, STDDEV(ǥ������), VARIANCE(�л�)
SELECT MAX(SAL) FROM EMP;
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- �μ���
SELECT MAX(SAL) FROM EMP; -- �ִ� �޿��� �޴� ����� �̸��� �ִ�޿� -> VI. ��������
SELECT ENAME, SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- ��  1. �׷��Լ��� �ǽ�
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT SUM(COMM) FROM EMP; -- ��� : 2200/14(157.14) OR 2200/4(550)
SELECT SUM(COMM), COUNT(COMM), AVG(COMM) FROM EMP; -- ��� �׷��Լ��� null���� ����
SELECT COUNT(*) FROM EMP; -- ���̺� ���

--sal�� ���, ��, �ּҰ�, �ִ밪, �л�, ǥ������, ����(���, �л�, ǥ������ �Ҽ��� ���ڸ����� �ݿø�)
SELECT ROUND(AVG(SAL),1), SUM(SAL), MIN(SAL), MAX(SAL), 
        ROUND(VARIANCE(SAL),1), ROUND(STDDEV(SAL),1)
    FROM EMP;
-- �׷��Լ� MIN, MAX, COUNT�� ������, ������, ��¥�� ��� ����

SELECT AVG(SAL)-2*STDDEV(SAL), AVG(SAL)+2*STDDEV(SAL) FROM EMP; -- 95.44%�� SAL
-- źźex1. �Ի����� ���� ������ ����� �Ի��ϰ� ���� �ֱٿ� �Ի��� ����� �Ի����� ���. 
SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
-- źźex2. (���) 80/12/17:14620��° 83/01/12:13864��°
SELECT MIN(HIREDATE)||':'||TRUNC(SYSDATE-MIN(HIREDATE))||'��°' FIRST,
        MAX(HIREDATE)||':'||TRUNC(SYSDATE-MAX(HIREDATE))||'��°' LAST
    FROM EMP;

-- źźex3.  (���) 80��12��17�� �����Ի�:14,620��° 83��01��12�� �ֱ��Ի� :13,864��°
SELECT TO_CHAR(MIN(HIREDATE), 'RR"��"MM"��"DD"�� �����Ի�:"') ||
        TRIM(TO_CHAR(TRUNC(SYSDATE-MIN(HIREDATE)), '99,999'))|| '��°' FIRST,
       TO_CHAR(MAX(HIREDATE), 'RR"��"MM"��"DD"�� �ֱ��Ի�:"') ||
        TRIM(TO_CHAR(TRUNC(SYSDATE-MAX(HIREDATE)), '99,999')) || '��°' LAST
    FROM EMP; -- TO_CHAR�� ���Ῥ���ڸ� ������ ' ' �ڵ� �߰�
-- źźex4. 10�� �μ� �Ҽ��� ��� �߿��� COMM�� �޴� ����� ���� ���� ���ÿ�.
SELECT COUNT(COMM) FROM EMP WHERE DEPTNO=10 AND COMM>0;
--       3              1         2

-- �� 2. GROUP BY ��
-- �μ���ȣ�� �ִ� �޿�, ��� �޿� (�μ���ȣ �� ����)
SELECT DEPTNO, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;
    -- GROUP BY �������� �÷��� ��Ī�� ����� �� ����(ORDER BY�������� �÷���Ī ��밡��)
SELECT DEPTNO �μ�, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY �μ�;
--              3                          1             2            4

-- �μ��̸��� �ִ�޿�, ��� �޿� (��ձ޿��� ����)
SELECT DNAME, MAX(SAL), AVG(SAL) AVG_SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME
    ORDER BY AVG_SAL;

    -- ex. SAL�� 5000�̸��� ����� ���ؼ��� �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
            -- (�μ���ȣ �� ����)
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL)
    FROM EMP
    WHERE SAL<5000
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

-- �� 3. HAVING �� : �׷��Լ��� ��� ����
    -- �μ���ȣ�� ��� �޿�(��ձ޿��� 2000�̻��� �μ��� ���)
SELECT DEPTNO, AVG(SAL) AVG_SAL   
    FROM EMP              
    GROUP BY DEPTNO       
    HAVING AVG(SAL) > 2000 -- HAVING ������ �ʵ��� ��Ī ��� �Ұ�
    ORDER BY DEPTNO;  -- �ʵ��� ��Ī�� ORDER BY������ ��� ����







