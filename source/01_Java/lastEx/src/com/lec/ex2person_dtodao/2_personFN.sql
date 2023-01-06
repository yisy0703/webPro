-- 프로그램 요구사항에 필요한 DML
-- ♣ 기능별 query 작성 (1, 2, 3)
-- 1번 : PNAME, JNAME, KOR, ENG, MAT을 입력받아 INSERT
INSERT INTO PERSON 
    VALUES (PERSON_PNO_SQ.NEXTVAL, '홍길동', (SELECT JNO FROM JOB WHERE JNAME='가수'), 
            81,83,85);
ROLLBACK;
-- 2번 : 직업명을 입력받아 등수,이름(pNO),직업명,국어(kor),영어(eng),수학(mat),총점을 출력(총점기준으로 내림차순 정렬)
SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
  FROM PERSON P, JOB J
  WHERE P.JNO=J.JNO AND JNAME='배우'
  ORDER BY SUM DESC; -- inline view에 들어갈 내용
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
            FROM PERSON P, JOB J
            WHERE P.JNO=J.JNO AND JNAME='배우'
            ORDER BY SUM DESC) A; -- 2번 기능에 들어갈 QUERY

-- 3번 : 모든 행의 등수, 이름(pNO),직업명,국어(kor),영어(eng),수학(mat),총점을 출력(총점기준으로 내림차순 정렬)
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
            FROM PERSON P, JOB J
            WHERE P.JNO=J.JNO
            ORDER BY SUM DESC) A; 
            
-- 1번과 2번 기능에서 현재 가능한 직업명 list
SELECT JNAME FROM JOB;