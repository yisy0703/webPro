-- [ IV ] �������Լ�
-- �Լ� = �������Լ� + �׷��Լ�(�����Լ�)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP; -- ������ ������ ����
SELECT ENAME, INITCAP(ENAME) FROM EMP; -- �������Լ�(INPUT 1�� -> OUTPUT 1��)
SELECT SUM(SAL), AVG(SAL) FROM EMP; -- �׷��Լ�(INPUT n�� -> OUTPUT 1��)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;-- �׷��Լ�(INPUT n�� -> OUTPUT 1��)

-- �� �������Լ��� ���� : ���ڰ����Լ�, ���ڰ����Լ�, ��¥�����Լ�, ����ȯ�Լ�, NVL(), ETC...
-- 1. ���ڰ����Լ� 
    -- DUAL���̺� : ����Ŭ���� ������ 1��1��¥�� DUMMY TABLE
SELECT * FROM DUAL;
DESC DUAL;
SELECT * FROM DUMMY;
DESC DUMMY;
SELECT ABS(-1) FROM DUMMY; -- ���밪
SELECT FLOOR(34.5678) FROM DUAL; -- �Ҽ������� ����(����)
SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� ����(����)
SELECT TRUNC(34.5678, 2) FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� ����(����)
SELECT TRUNC(34.5678) FROM DUAL;    -- �Ҽ������� ����(����)
SELECT TRUNC(34.5678, -1) FROM DUAL; -- ���� �ڸ����� ����(����)
    -- ex. EMP���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; -- �Ҽ������� �ø�

SELECT ROUND(34.5678) FROM DUAL; -- �Ҽ������� �ݿø�
SELECT ROUND(34.5678, 2) FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� �������� �ݿø�
SELECT ROUND(34.5678, -1) FROM DUAL;   -- ���� �ڸ����� �ݿø�

SELECT MOD(9,2) FROM DUAL; -- ������ ������ (9%2)
    -- ex. Ȧ���⵵�� �Ի��� ����� ��� ���� ���
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'RR'), 2) = 1;




