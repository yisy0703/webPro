-- TABLE drop & create
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
  cID VARCHAR2(50) PRIMARY KEY,
  cPW VARCHAR2(50) NOT NULL,
  cNAME VARCHAR2(50) NOT NULL,
  cTEL VARCHAR2(50),
  cEMAIL VARCHAR2(50),
  cADDRESS VARCHAR2(50),
  cBIRTH   DATE,
  cGENDER  VARCHAR2(1) CHECK(cGENDER='m' OR cGENDER='f'),
  cRDATE   DATE DEFAULT SYSDATE NOT NULL
);
-- 1. 회원가입시 id 중복체크 : public int confirmId(String cid)
SELECT COUNT(*) FROM CUSTOMER WHERE CID='aaa';
-- SELECT * FROM CUSTOMER WHERE CID='aaa';
 
-- 2. 회원가입 : public int joinCustmer(CustomerDto dto)
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CBIRTH, CGENDER)
  VALUES ('aaa', '111', '홍', '010-9999-9999', 'h@h.com', '서울', 
        '1995-12-12', 'm');
        
-- 3. 로그인 : public int loginCheck(String cid, String cpw)
SELECT * FROM CUSTOMER WHERE CID='aaa' AND CPW='111';

-- 4. cid로 DTO 가져오기 : public CustomerDto getCustomer(String cid)
SELECT * FROM CUSTOMER WHERE CID='aaa';

-- 5. 정보수정 : public int modifyCustomer(CustomerDto dto)
UPDATE CUSTOMER SET CPW = '111',
                CNAME='홍길동',
                CTEL = '02-111-1111',
                CEMAIL='GIL@H.COM',
                CADDRESS='제주도',
                CBIRTH = '1990-12-12',
                CGENDER = 'f'
          WHERE CID='aaa';
SELECT * FROM CUSTOMER;
COMMIT;