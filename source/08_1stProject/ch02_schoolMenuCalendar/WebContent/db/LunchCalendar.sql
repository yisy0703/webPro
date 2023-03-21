DROP TABLE LUNCH;
CREATE TABLE LUNCH(
    NO      NUMBER(4)    PRIMARY KEY,
    LDATE   DATE         NOT NULL,
    AMPM    VARCHAR2(10) NOT NULL,
    menu    VARCHAR2(1000) NOT NULL,
    CALORIE NUMBER(5,1)   NOT NULL,
    PHOTO   VARCHAR2(1000),
    day     NUMBER(2)    NOT NULL
);
DROP SEQUENCE LUNCH_SEQ;
CREATE SEQUENCE LUNCH_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
-- 0. 더미데이터
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2023-03-27','중식','찹쌀밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,NULL,
    to_char(to_date('2023-03-27'),'dd'));
    INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2023-03-27','석식','보리밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,NULL,
    to_char(to_date('2023-03-27'),'dd'));
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2023-04-01','중식','찹쌀밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,NULL,
    to_char(to_date('2023-04-01'),'dd'));
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2023-04-01','중식','보리밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,NULL,
    to_char(to_date('2023-04-01'),'dd'));
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2022-04-04','중식','흑미밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,NULL,
    to_char(to_date('2023-04-04'),'dd'));
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2023-04-04','석식','저녁밥,미역국,돼지갈비찜,견과류멸치볶음',862.9,'7.jfif',
    to_char(to_date('2023-04-04'),'dd'));
SELECT * FROM LUNCH ORDER BY LDATE, AMPM DESC;
-- 1. 메뉴 등록
INSERT INTO LUNCH (NO, LDATE, AMPM, MENU, CALORIE, PHOTO, day) 
    VALUES (LUNCH_SEQ.NEXTVAL, '2022-06-28','중식','밥,콩나물국,돼지갈비찜,견과류멸치볶음',860,'7.jfif',
    to_char(to_date('2022-06-28'),'dd'));
-- 2. 출력
SELECT * FROM LUNCH WHERE TO_CHAR(LDATE, 'YYYY-MM') = '2022'||'-'||'06' ORDER BY DAY, AMPM DESC;
-- 3. 해당일 메뉴
SELECT * FROM LUNCH WHERE TO_CHAR(LDATE, 'YYYY-MM-DD') = '2022'|| '-' || '07'||'-'||'04' AND AMPM='석식'; 
COMMIT;