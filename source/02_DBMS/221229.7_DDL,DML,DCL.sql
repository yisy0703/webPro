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
-- ����
    --(1) USER_XXX : �� ������ �����ϰ� �ִ� ��ü(���̺�, ��������, ��, �ε���)
       -- USER_TABLES, USER_CONSTRAINTS, USER_INDEXES, USER_VIEWS
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_VIEWS;
    --(2) ALL_XXX : �� �������� ���� ������ ��ü(���̺�, ��������, ��, �ε���)
       -- ALL_TABLES, ALL_CONSTRAINTS, ALL_INDEXES, ALL_VIEWS
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_VIEWS;
    --(3) DBA_XXX ; DBA���ѿ����� ���ٰ���. DBMS�� ��� ��ü
       -- DBA_TABLES, DBA_CONSTRAINTS, DBA_INDEXES, DBA_VIEWS
SELECT * FROM DBA_TABLES;
        
-- �� �� �� DML �� �� ��
-- 1. INSERT INTO ���̺�� VALUES (��1, ��2, ...);
   -- INSERT INTO ���̺�� (�ʵ��1, �ʵ��2,..) VALUES (��1, ��2, ..);
SELECT * FROM DEPT01;
ROLLBACK;
INSERT INTO DEPT01 VALUES (50, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT01 VALUES (60, 'SALES', NULL); -- ��������� NULL�߰�
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (70, 'RESEARCH', '���빮');
INSERT INTO DEPT01 (LOC, DEPTNO, DNAME) VALUES ('����', 80, 'IT');
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (90, 'OPERATION'); -- ���������� NULL �߰�
SELECT * FROM DEPT01;
-- ���������� �̿��� INSERT
    -- ex. dept���̺��� 10~30�� �μ��� dept01���̺�� 
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
SELECT * FROM DEPT01;
-- EX. BOOK (BID�� 11, BNAME�� '����������', ���ǻ�� '�Ѽ�����', �������� ����, ������ 90000)
DESC BOOK;
INSERT INTO BOOK VALUES (11, '����������', '�Ѽ�����', SYSDATE, 90000);

-- Ʈ������ ��ɾ� (DML��ɾ���� ����)
    -- Ʈ�������� ������ ó���� �� ����. DML ��ɾ���� ����ʰ� ���ÿ� Ʈ������� ����.
COMMIT; -- �� Ʈ�������� �۾��� DB�� �ݿ�
INSERT INTO BOOK VALUES (12, '����������', '�Ѽ�����', SYSDATE, 90000);
SELECT * FROM BOOK;
ROLLBACK;-- �� Ʈ�������� �۾��� ���

-- �� �������� (1������) ��
DROP TABLE SAM01;
CREATE TABLE SAM01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    SAL   NUMBER(7,2)
);
SELECT * FROM SAM01;
INSERT INTO SAM01 (EMPNO, ENAME, JOB, SAL) 
    VALUES (1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES (1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES (1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES (1030,'VERY',25000);
INSERT INTO SAM01 VALUES (1040,'CAT',NULL, 2000);
INSERT INTO SAM01 
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;
COMMIT;

-- 2. UPDATE ���̺�� SET �ʵ��1=��1 [, �ʵ��2=��2, �ʵ��N=��N...] [WHERE ����];
SELECT * FROM EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
    -- ex. �μ���ȣ�� 30���� ����
UPDATE EMP01 SET DEPTNO=30;
SELECT * FROM EMP01;
ROLLBACK;
SELECT * FROM EMP01;
    -- ex. ��� ����(EMP01)�� �޿�(SAL)�� 10%�λ�
UPDATE EMP01 SET SAL=SAL*1.1 ;
SELECT * FROM EMP01;
    -- ex. emp01���̺� : 10�� �μ� ������ �Ի����� ���÷�, �μ���ȣ�� 30������ �����Ͻÿ�
UPDATE EMP01 SET HIREDATE=SYSDATE, DEPTNO=30 WHERE DEPTNO=10;
SELECT * FROM EMP01;
    -- ex. sal�� 3000�̻��� ����� �޿��� 10%�λ��Ű�ÿ�
UPDATE EMP01 SET SAL=SAL*1.1 WHERE SAL>=3000;
    -- ex. DALLAS�� �ٹ��ϴ� ������ �޿��� 1000$�λ�
UPDATE EMP01 SET SAL=SAL+1000 
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
SELECT * FROM EMP01;
    -- ex. SCOTT�� �μ���ȣ 20����, JOB�� MANAGER��, SAL�� COMM�� 500$�� �λ�, 
        -- ���� KING���� ����
UPDATE EMP01 SET DEPTNO=20,
                 JOB = 'MANAGER',
                 SAL = SAL + 500,
                 COMM = NVL(COMM,0) + 500,
                 MGR = (SELECT EMPNO FROM EMP WHERE ENAME='KING')
        WHERE ENAME='SCOTT';
SELECT * FROM EMP01 WHERE ENAME='SCOTT';
    -- ex. dept01���� 60�� �μ��� �������� 20�� �μ��� �������� ����
SELECT * FROM DEPT01;
UPDATE DEPT01 SET LOC=(SELECT LOC FROM DEPT01 WHERE DEPTNO=20)
    WHERE DEPTNO=60;
SELECT * FROM DEPT01;
    -- EMP01���� ��� ����� �޿��� �Ի����� 'KING'�� �޿��� �Ի��Ϸ� ����
    SELECT SAL FROM EMP WHERE ENAME='KING'; -- UPDATE�� �� ��������
    SELECT HIREDATE FROM EMP WHERE ENAME='KING';-- UPDATE�� �� ��������
UPDATE EMP01 SET SAL = (SELECT SAL FROM EMP WHERE ENAME='KING'),
                HIREDATE = (SELECT HIREDATE FROM EMP WHERE ENAME='KING');
UPDATE EMP01 SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE FROM EMP WHERE ENAME='KING');

-- 3. DELETE FROM ���̺�� [WHERE ����];
SELECT * FROM EMP01;
DELETE FROM EMP01 ;
ROLLBACK; -- DML ��� ����
SELECT * FROM EMP01;
    -- ex. emp01���� 30�μ� ������ ����
    DELETE FROM EMP01 WHERE DEPTNO=30;
    SELECT * FROM EMP01;
    -- ex. 'FORD'��� ���
    DELETE FROM EMP01 WHERE ENAME='FORD';






