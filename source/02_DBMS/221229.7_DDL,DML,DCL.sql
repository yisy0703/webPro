--[ VII ] DDL, DCL, DML
--SQL = DDL(���̺� ����, ���̺����, ���̺�������, ���̺� ��� ������ ����) + 
--      DML(SELECT, INSERT, UPDATE, DELETE) + 
--      DCL(����ڰ��� ����, ����ڿ��Ա��Ѻο�, ���ѹ�Ż, ����ڰ�������, Ʈ������ ��ɾ�)

-- �� �� �� DDL �� �� ��
-- 1. ���̺� ����(CREATE TABLE ���̺��...) : ���̺� ������ �����ϱ�
CREATE TABLE BOOK (
    BOOKID NUMBER(4), -- BOOKID �ʵ��� Ÿ���� ���� 4�ڸ�
    BOOKNAME VARCHAR2(20), -- BOOKNAME�ʵ��� Ÿ���� ���� 20BYTE
    PUBLISHER VARCHAR2(20), -- PUBLISHER �ʵ��� Ÿ���� ���� 20BYTE
    RDATE     DATE,         -- RDATE �ʵ��� Ÿ���� DATE��
    PRICE     NUMBER(8, 2),  -- PRICE�ʵ��� Ÿ���� ���� ��ü 8�ڸ�, �Ҽ��� 2, �Ҽ����� 6. �Ҽ����� �ڸ��� ���Ե��� ����
    PRIMARY KEY(BOOKID) -- �������� : BOOKID�ʵ尡 ��Ű(PRIMARY KEY : NOT NULL, UNIQUE)
);
SELECT * FROM BOOK;
DESC BOOK;

DROP TABLE BOOK; -- ���̺� ����
CREATE TABLE BOOK(
    BID       NUMBER(4) PRIMARY KEY,
    BNAME     VARCHAR2(20),
    PUBLISHER VARCHAR2(20),
    RDATE     DATE,
    PRICE     NUMBER(8));
SELECT * FROM BOOK;
DESC BOOK;

    -- ex. EMP�� ������ EMP01 ���̺� : EMPNO(����4), ENAME(����10), SAL(����7,2)
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    SAL   NUMBER(7,2)
);
SELECT * FROM EMP01;
    -- ex. DEPT01 ���̺� : DEPTNO(����2:PK), DNAME(����14), LOC(����13)
CREATE TABLE DEPT01 ( 
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
);
SELECT * FROM DEPT01;
-- ���������� �̿��� ���̺� ����
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- �������� ����� EMP02 ���̺� ���� �� �����͵� ��(�������� ������)
SELECT * FROM EMP02;
DESC EMP02;
    -- EMP03 : EMP ���̺��� EMPNO, ENAME, DEPTNO�� ������ ������
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;
    -- EMP04 : EMP���̺��� 10�� �μ��� ������ ������
CREATE TABLE EMP04 AS SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;
    -- EMP05 : EMP���̺� ������ ����(�����͸� �������� ����)
CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 0=1;
SELECT * FROM EMP05;

DESC EMP;
SELECT * FROM EMP;
SELECT ROWNUM, EMPNO, ENAME, JOB FROM EMP; -- ���̺��� ���� ���� ����(�о���� ����)

-- 2. ���̺� ���� ���� (ALTER TABLE ���̺�� ADD || MODIFY || DROP ~)
-- (1) �ʵ� �߰�(ADD)
SELECT * FROM EMP03; -- EMPNO(��4), ENAME(��10), DEPTNO(��2)
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2) );
SELECT * FROM EMP03; -- �ʵ� �߰��� ������ NULL��
ALTER TABLE EMP03 ADD (COMM NUMBER(7,2));
--(2) �ʵ� ����(MODIFY)
SELECT * FROM EMP03; -- EMPNO(��4), ENAME(��10), DEPTNO(��2), JOB, SAL, COMM�� NULL
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(5)); -- ���ڵ����Ͱ� ����־ ���ڷθ� ����.
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5)); 
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(4)); -- ���� �����ʹ� ���̴°� �� ��
ALTER TABLE EMP03 MODIFY (SAL VARCHAR2(10)); -- NULL �ʵ�� ������� ���� ����
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(20)); -- ���ڵ����� �ø��ų� ���̰ų� ����
DESC EMP03;
SELECT * FROM EMP03;
SELECT MAX(LENGTH(ENAME)) FROM EMP03;
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- ����
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(5)); -- �Ұ���
-- (3)�ʵ� ����(DROP)
ALTER TABLE EMP03 DROP COLUMN JOB; -- NULL�� �ʵ� ����(NULL�� �ƴ� �ʵ�� �����ͱ��� ����)
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN DEPTNO;
-- �������� Ư�� �ʵ带 ���� ���ϵ���(��)
ALTER TABLE EMP03 SET UNUSED (COMM);
SELECT * FROM EMP03;
--�������� ���� �Ұ��ߴ� �ʵ� ���������� ����(����)
ALTER TABLE EMP03 DROP UNUSED COLUMNS;

-- 3. ���̺� ����(DROP TABLE ���̺��)
DROP TABLE EMP01;
SELECT * FROM EMP01;
DROP TABLE DEPT; -- EMP���̺��� DEPT���̺��� �����ϴ� ��� EMP���̺��� ������ �� DEPT ���̺� ����

-- 4. ���̺��� ��� ���� ����(TRUNCATE TABLE ���̺��)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03; -- ROLLBACK �� ��
SELECT * FROM EMP03;

-- 5. ���̺�� ����(RENAME ���̺�� TO �ٲ����̺��)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT * FROM EMP2;

-- 6. ������ ��ųʸ�(���ٺҰ�) VS. �����͵�ųʸ� ��(���ٿ�)






