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

-- 3. Ư�� �� ��� : WHERE ��(������) -- �񱳿����� : ����(=), �ٸ���(!=, ^=, <>)










