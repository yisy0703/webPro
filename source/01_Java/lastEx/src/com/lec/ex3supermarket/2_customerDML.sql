-- 프로그램에 필요한 QUERY
-- 1. 회원가입 (ctel, cname 입력받아 insert)
    -- public int insertCustomer(String ctel, String cname)
    -- public int insertCustomer(CustomerDto dto)
INSERT INTO CUSTOMER (CID, CTEL, CNAME)
  VALUES (CUSTOMER_CID_SEQ.NEXTVAL, '010-6666-6666', '유길동');
COMMIT; -- COMMIT이나 ROLLBACK 중 하나는 실행

-- 2. 폰뒤4자리(풀번호) 검색 
    -- (ctel 입력받아 cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
      HIGH+1-CAMOUNT forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO; -- 최고 레벨 경우에 잘못 나와
  
SELECT CNAME, CAMOUNT, HIGH+1-CAMOUNT,
    (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO; -- 이용할 서브쿼리 만들기

SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||'9999'; -- DAO에 들어갈 QUERY
  
-- 3. 물품구입 (cid, price 입력받아 cpoint, camout, levelno update)
    -- public int buy(int cid, int price)
    -- 1단계 : CPOINT, CAMOUNT 수정
    UPDATE CUSTOMER 
      SET CPOINT = CPOINT + (1000000*0.05),
          CAMOUNT = CAMOUNT + 1000000
      WHERE CID = 1;
    -- 2단계 : 수정된 CAMOUNT에 따라 LEVELNO 조정
    SELECT CNAME, CAMOUNT, C.LEVELNO 현레벨, L.LEVELNO 바뀔레벨, LOW, HIGH
      FROM CUSTOMER C, CUS_LEVEL L
      WHERE CAMOUNT BETWEEN LOW AND HIGH;
    SELECT L.LEVELNO
      FROM CUSTOMER, CUS_LEVEL L
      WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1; -- CID가 1인 데이터의 바뀔레벨
    UPDATE CUSTOMER 
      SET LEVELNO = (SELECT L.LEVELNO
                      FROM CUSTOMER, CUS_LEVEL L
                      WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1)
      WHERE CID=1; -- LEVELNO수정
    
    -- DAO에 들어갈 QUERY 완성 (1단계 + 2단계)
    UPDATE CUSTOMER 
      SET CPOINT = CPOINT + (1000000*0.05),
          CAMOUNT = CAMOUNT + 1000000,
          LEVELNO = (SELECT L.LEVELNO
                      FROM CUSTOMER, CUS_LEVEL L
                      WHERE CAMOUNT+1000000 BETWEEN LOW AND HIGH 
                            AND CID=1)
      WHERE CID = 1;
    SELECT * FROM CUSTOMER WHERE CID=1;
    
-- 3번 후 바뀐 고객 정보를 출력 (cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public CustomerDto getCustomer(int cid)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND CID=1;
  
-- 4번 전 고객등급명들 추출
    -- public ArrayList<String> getLevelNames()
SELECT LEVELNAME FROM CUS_LEVEL;
  
-- 4. 고객 등급별 출력 
    -- (levelname을 입력받아 cid, ctel, cname, cpoint, camount, levelname, forLevelUp출력)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME='NORMAL'
  ORDER BY CAMOUNT DESC;
  
-- 5. 고객 전체 출력
    -- (cid, ctel, cname, cpoint, camount, levelname, forLevelUp출력)
    -- public ArrayList<CustomerDto> getCustomers()
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO 
  ORDER BY CAMOUNT DESC;
  
-- 6.  회원탈퇴 (ctel을 입력받아 delete)
    -- public int deleteCustomer(String ctel)
DELETE FROM CUSTOMER WHERE CTEL='010-6666-6666';
ROLLBACK;
    
    
    
    
    
    
    
    
    
    