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

-- 2. ���ڰ����Լ� 
-- �� ��ҹ��� ����
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL; -- ù���ڸ� �빮��
SELECT INITCAP('welcome to oracle') FROM DUAL;
SELECT UPPER('ABCabc') FROM DUAL; -- �빮�ڷ�
SELECT LOWER('ABCabc') FROM DUAL; -- �ҹ��ڷ�
    -- ex. �̸��� SCOTT �� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER(ENAME)='SCOTT';
SELECT * FROM EMP WHERE INITCAP(ENAME)='Scott';
    -- ex. job�� MANAGER �� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT * FROM EMP WHERE INITCAP(JOB) = 'Manager';
SELECT * FROM EMP WHERE LOWER(JOB) = 'manager';

-- �� ���ڿ���(concat�Լ�, ||������)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT(CONCAT('AB','CD'), CONCAT('EF','GH')) FROM DUAL;
    -- ex. SMITH�� manager��
SELECT CONCAT(CONCAT(ENAME, '�� '), CONCAT(JOB, '��')) FROM EMP;
SELECT ENAME || '�� ' || JOB || '��' FROM EMP;

-- �� SUBSTR(STR, ������ġ, ���ڰ���) : STR�� ������ġ���� ���ڰ�����ŭ ���� ����
                    -- (������ġ�� 1����, ������ġ�� �����̸� ������ �ڸ����� ���ϴ�)
  -- SUBSTRB(STR, ���۹���Ʈ��ġ, ���ڹ���Ʈ��)
SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL; -- 3��° ���ں��� 2���� ����
SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL;-- 3��° ����Ʈ���� 2����Ʈ ����
SELECT SUBSTR('�����ͺ��̽�', 4, 3) FROM DUAL; -- 4��° ���ں��� 3���� ����(���̽�)
SELECT SUBSTRB('�����ͺ��̽�', 4, 3) FROM DUAL;-- 4��° ����Ʈ���� 3����Ʈ ����(��)
    -- O R A C L E
    -- 1 2 3 4 5 6(��ġ)
    ---6-5-4-3-2-1(��ġ)
SELECT SUBSTR('WELCOME TO ORACLE', -1, 1) FROM DUAL; -- -1��° ���ں��� �ѱ��� ����
SELECT SUBSTR('ORACLE', -2, 2) FROM DUAL; -- ������ ���� 2���� ����
SELECT SUBSTR(123, 2, 1) FROM DUAL; -- ���ڵ� ����(���ڸ� ���ڷ� �ٲ� 2��° ���� 1���� ����)
    -- ex. 9���� �Ի��� ����� ��� �ʵ� 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4, 2)='09'; -- DATE���� ����
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), 4, 2)='09';
    -- ex. 9�Ͽ� �Ի��� ����� ��� �ʵ� 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2) = '09';
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), -2, 2) = '09';

-- �� LENGTH(STR) : STR�� ���ڼ�
   -- LENGTHB(STR) : STR�� ����Ʈ ��
SELECT LENGTH('ABCD') FROM DUAL; -- ���ڼ�
SELECT LENGTHB('ABCD') FROM DUAL; -- ����Ʈ��
SELECT LENGTH('����Ŭ') FROM DUAL; -- ��� : 3
SELECT LENGTHB('����Ŭ') FROM DUAL; -- ��� : 9

-- �� INSTR(STR, ã������) : STR���� ù��° ���ں��� ã�����ڰ� ������ ��ġ(������ 0)
  --  INSTR(STR, ã������, ������ġ) : STR���� ������ġ ���ں��� ã�����ڰ� ������ ��ġ
SELECT INSTR('ABCABC', 'B') FROM DUAL; -- ó������ ã�Ƽ� ó�������� B�� ��ġ : 2
SELECT INSTR('ABCABC', 'B', 3) FROM DUAL; --3��°���ں��� ã�Ƽ� ó�� ������ B�� ��ġ : 5
SELECT INSTR('ABCABC', 'B', -3) FROM DUAL;--��3��°���� �ڷ� ã�� ó�� ������ B�� ��ġ : 2
SELECT INSTR('ABCABCABC', 'B', -3) FROM DUAL; -- ��3��°���� �ڷ� ã�� ó�� ������ B��ġ : 5
    -- 9���� �Ի��� ���(INSTR�̿�) 'RR/MM/DD'
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 4)=4;
SELECT * FROM EMP WHERE INSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), '09', 4)=4;
    -- 9�Ͽ� �Ի��� ����� ��� �ʵ�(INSTR�̿�)
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 7) = 7;
    -- 9�� �ƴ� �ٸ� ���� �Ի��� ����� ��� �ʵ�(INSTR�̿�)
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09' ,7) = 0;

-- �� LPAD(STR, �ڸ���, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ä�﹮�ڷ� ���
  --  LPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ' '�� ���
  --  RPAD(STR, �ڸ���, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ä�﹮�ڷ� ���
  --  RPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ' '�� ���
SELECT LPAD('ORACLE', 10, '#') FROM DUAL;
SELECT RPAD('ORACLE', 10, '*') FROM DUAL;
SELECT ENAME, SAL FROM EMP;
DESC EMP; -- �̸��� 10���ڱ��� SAL�� 5�ڸ����� �Է� ����
SELECT RPAD(ENAME, 11, '-'), LPAD(SAL, 6, '*') FROM EMP;
     -- ex. ���, �̸�(7369 S**** / 7654 M***** / 7521 W*** ..) - SUBSTR, LENGTH, RPAD
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') NAME
    FROM EMP;
    -- ex. ���, �̸�, ��å(9�ڸ�Ȯ��), �Ի��� -- LPAD, SUBSTR, LENGTH, ||, CONCAT, ...
      -- (7369 SMITH ____****K 80/12/**)
      -- (7499 ALLEN __******N 81/02/**)
      -- (7566 JONES ___*****R 81/02/**)
SELECT EMPNO, ENAME, LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB), '*'), 9) JOB,
        SUBSTR(HIREDATE, 1, 6) || '**'
    FROM EMP;
SELECT EMPNO, ENAME, LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB), '*'), 9) JOB,
        RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*')
    FROM EMP;
SELECT EMPNO, ENAME, LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB), '*'), 9) JOB,
        TO_CHAR(HIREDATE, 'RR/MM/') || '**'
    FROM EMP;    
    
    -- ex. �̸��� ����° �ڸ� ���ڰ� R�� ����� ��� �ʵ� ���(LIKE�̿�, INSTR�̿�, SUBSTR�̿�)
SELECT * FROM EMP WHERE ENAME LIKE '__R%';
SELECT * FROM EMP WHERE INSTR(ENAME, 'R', 3) = 3; -- RARA���� ��µǱ� ���� 3��°���ں��� �˻�
SELECT * FROM EMP WHERE SUBSTR(ENAME, 3, 1) = 'R'; -- RARA

-- �� �������� : TRIM(STR), LTRIM(STR), RTRIM(STR)
SELECT '    ORACLE   ' MSG FROM DUAL;
SELECT TRIM('   ORACLE   ') MSG FROM DUAL;
SELECT LTRIM('   ORACLE   ') MSG FROM DUAL;
SELECT RTRIM('   ORACLE   ') MSG FROM DUAL;

-- �� REPLACE(STR, �ٲ���ҹ���, �ٲܹ���) : STR���� �ٲ���ҹ��ڸ� �ٲܹ��ڷ� ��ü
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP;
SELECT REPLACE(SAL, '0', 'X') FROM EMP;
SELECT REPLACE(HIREDATE, '0', 'X') FROM EMP;

-- 3. ��¥�����Լ� �� �����
-- �� SYSDATE : ���� / SYSTIMESTAMP
SELECT SYSDATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- DATE ���� ���� ����
-- �� ��¥ ��� : ����Ŭ Ÿ��(����, ����, ��¥) �� ����, ��¥�� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
SELECT SYSDATE-1 �����̽ð�, SYSDATE, SYSDATE+1 �����̽ð� FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- ���󺹱�
    -- ex. �ݳ������� 
    SELECT SYSDATE+14 FROM DUAL;
    -- ex. �������� ~ ��������� ���� ������?
    SELECT FLOOR(SYSDATE-TO_DATE('22/11/28 09:30', 'RR/MM/DD HH24:MI')) DAY FROM DUAL;
    SELECT TRUNC(SYSDATE-TO_DATE('22/11/28 09:30', 'RR/MM/DD HH24:MI')) DAY FROM DUAL;
    -- ex. ���� ~ �����ϱ��� ���� ���Ҵ���?
    SELECT TRUNC(TO_DATE('230512 12:20', 'RRMMDD HH24:MI')-SYSDATE) DAY FROM DUAL;
    -- ex. emp���� �̸�, �Ի���, �ٹ��ϼ�
    SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) DAY FROM EMP;
    -- ex. �̸�, �Ի���, �ٹ��ϼ�, �ٹ��ּ�, �ٹ����
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) DAY, 
    TRUNC((SYSDATE-HIREDATE)/7) WEEK, TRUNC((SYSDATE-HIREDATE)/365) YEAR
    FROM EMP;
    
-- �� MONTHS_BETWEEN(����1, ����2) : �� �������� ������(����1�� ū ����)
    -- ex. �̸�, �Ի���, �ٹ�����
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) MONTH FROM EMP;
    -- ex. �̸�, �Ի��� ���� ȸ�翡�� ���� ��(SAL�� 1�⿡ 12��, COMM�� 2��)�� ���
SELECT ENAME, SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) +
    NVL(COMM,0)*2*TRUNC((SYSDATE-HIREDATE)/365) MONTH
    FROM EMP;

-- �� ADD_MONTHS(Ư�� ����, ������) ; Ư���������� �����
    -- ex. �̸�, �Ի���, �����������(�����ð� 6����)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;
    -- �Ի����� 81/08/30�̸� ���� ������� 81/02/28
INSERT INTO EMP VALUES (9999, 'HONG', 'MANAGER', NULL, '81/08/30', NULL, NULL, 40);
ROLLBACK;

-- �� NEXT_DAY(Ư������, '��') : Ư���������� ó�� �����ϴ� ������
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;

-- �� LAST_DAY(Ư������) : Ư�������� ����(28,29,30,31)
SELECT LAST_DAY(SYSDATE) FROM DUAL;







