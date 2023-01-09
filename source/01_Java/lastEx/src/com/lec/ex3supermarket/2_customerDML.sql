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

-- 3. 물품구입 (cid, price 입력받아 cpoint, camout, levelno update)
    -- public int buy(int cid, int price)
    
-- 3번 후 바뀐 고객 정보를 출력 (cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public CustomerDto getCustomer(int cid)
    
-- 4번 전 고객등급명들 추출
    -- public ArrayList<String> 

-- 4. 고객 등급별 출력 
    -- (levelname을 입력받아 cid, ctel, cname, cpoint, camount, levelname, forLevelUp출력)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)

-- 5. 고객 전체 출력
    -- (cid, ctel, cname, cpoint, camount, levelname, forLevelUp출력)
    -- public ArrayList<CustomerDto> getCustomers()
  
-- 6.  회원탈퇴 (ctel을 입력받아 delete)
    -- public int deleteCustomer(String ctel)
    
    
    
    
    
    
    
    
    
    
    