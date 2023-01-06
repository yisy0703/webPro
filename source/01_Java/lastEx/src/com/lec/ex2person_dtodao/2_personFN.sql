-- ���α׷� �䱸���׿� �ʿ��� DML
-- �� ��ɺ� query �ۼ� (1, 2, 3)
-- 1�� : PNAME, JNAME, KOR, ENG, MAT�� �Է¹޾� INSERT
INSERT INTO PERSON 
    VALUES (PERSON_PNO_SQ.NEXTVAL, 'ȫ�浿', (SELECT JNO FROM JOB WHERE JNAME='����'), 
            81,83,85);
ROLLBACK;
-- 2�� : �������� �Է¹޾� ���,�̸�(pNO),������,����(kor),����(eng),����(mat),������ ���(������������ �������� ����)
SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
  FROM PERSON P, JOB J
  WHERE P.JNO=J.JNO AND JNAME='���'
  ORDER BY SUM DESC; -- inline view�� �� ����
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
            FROM PERSON P, JOB J
            WHERE P.JNO=J.JNO AND JNAME='���'
            ORDER BY SUM DESC) A; -- 2�� ��ɿ� �� QUERY

-- 3�� : ��� ���� ���, �̸�(pNO),������,����(kor),����(eng),����(mat),������ ���(������������ �������� ����)
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
            FROM PERSON P, JOB J
            WHERE P.JNO=J.JNO
            ORDER BY SUM DESC) A; 
            
-- 1���� 2�� ��ɿ��� ���� ������ ������ list
SELECT JNAME FROM JOB;