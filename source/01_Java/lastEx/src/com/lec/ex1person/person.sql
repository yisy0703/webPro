-- ���̺� �� ������ ����
DROP TABLE PERSON;
DROP TABLE JOB;
DROP SEQUENCE PERSON_PNO_SQ;
-- ���̺� �� ������ ����
CREATE TABLE JOB(
    JNO NUMBER(2) PRIMARY KEY,
    JNAME VARCHAR2(30)
);
CREATE TABLE PERSON(
    PNO NUMBER(5) PRIMARY KEY,
    PNAME VARCHAR2(30) NOT NULL,
    JNO NUMBER(2) REFERENCES JOB(JNO) NOT NULL,
    KOR NUMBER(3) CHECK(KOR>=0),
    ENG NUMBER(3) CHECK(ENG>=0),
    MAT NUMBER(3) CHECK(MAT>=0)
);
CREATE SEQUENCE PERSON_PNO_SQ MAXVALUE 99999 NOCACHE NOCYCLE;
-- ���̵����� insert (���켺 ~ ������)
INSERT INTO JOB VALUES (10,'���');
INSERT INTO JOB VALUES (20,'����');
INSERT INTO JOB VALUES (30,'����');
SELECT * FROM JOB;
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '���켺', 10, 90, 80, 81);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '�ڼ���', 10, 80, 90, 80);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '�����', 20, 20, 90, 90);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '����',   20, 95, 95, 95);
INSERT INTO PERSON VALUES (PERSON_PNO_SQ.NEXTVAL, '������', 10,100,100,100);
SELECT * FROM PERSON;
COMMIT;
-- ��ɺ� query �ۼ� (1, 2, 3)
-- 1�� : PNAME, JNAME, KOR, ENG, MAT�� �Է¹޾� INSERT
INSERT INTO PERSON 
    VALUES (PERSON_NO_SQ.NEXTVAL, 'ȫ�浿', (SELECT JNO FROM JOB WHERE JNAME='����'), 
            81,83,85);
ROLLBACK;
-- 2�� : �������� �Է¹޾� ���,�̸�(pNO),������,����(kor),����(eng),����(mat),������ ���(������������ �������� ����)


-- 3�� : ��� ���� ���, �̸�(pNO),������,����(kor),����(eng),����(mat),������ ���(������������ �������� ����)

            
-- 1���� 2�� ��ɿ��� ���� ������ ������ list
SELECT JNAME FROM JOB;








