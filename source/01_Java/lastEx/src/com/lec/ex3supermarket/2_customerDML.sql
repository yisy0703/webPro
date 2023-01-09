-- ���α׷��� �ʿ��� QUERY
-- 1. ȸ������ (ctel, cname �Է¹޾� insert)
    -- public int insertCustomer(String ctel, String cname)
    -- public int insertCustomer(CustomerDto dto)
INSERT INTO CUSTOMER (CID, CTEL, CNAME)
  VALUES (CUSTOMER_CID_SEQ.NEXTVAL, '010-6666-6666', '���浿');
COMMIT; -- COMMIT�̳� ROLLBACK �� �ϳ��� ����

-- 2. ����4�ڸ�(Ǯ��ȣ) �˻� 
    -- (ctel �Է¹޾� cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
      HIGH+1-CAMOUNT forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO; -- �ְ� ���� ��쿡 �߸� ����
  
SELECT CNAME, CAMOUNT, HIGH+1-CAMOUNT,
    (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO; -- �̿��� �������� �����

SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||'9999'; -- DAO�� �� QUERY
  
-- 3. ��ǰ���� (cid, price �Է¹޾� cpoint, camout, levelno update)
    -- public int buy(int cid, int price)
    -- 1�ܰ� : CPOINT, CAMOUNT ����
    UPDATE CUSTOMER 
      SET CPOINT = CPOINT + (1000000*0.05),
          CAMOUNT = CAMOUNT + 1000000
      WHERE CID = 1;
    -- 2�ܰ� : ������ CAMOUNT�� ���� LEVELNO ����
    SELECT CNAME, CAMOUNT, C.LEVELNO ������, L.LEVELNO �ٲ𷹺�, LOW, HIGH
      FROM CUSTOMER C, CUS_LEVEL L
      WHERE CAMOUNT BETWEEN LOW AND HIGH;
    SELECT L.LEVELNO
      FROM CUSTOMER, CUS_LEVEL L
      WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1; -- CID�� 1�� �������� �ٲ𷹺�
    UPDATE CUSTOMER 
      SET LEVELNO = (SELECT L.LEVELNO
                      FROM CUSTOMER, CUS_LEVEL L
                      WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1)
      WHERE CID=1; -- LEVELNO����
    
    -- DAO�� �� QUERY �ϼ� (1�ܰ� + 2�ܰ�)
    UPDATE CUSTOMER 
      SET CPOINT = CPOINT + (1000000*0.05),
          CAMOUNT = CAMOUNT + 1000000,
          LEVELNO = (SELECT L.LEVELNO
                      FROM CUSTOMER, CUS_LEVEL L
                      WHERE CAMOUNT+1000000 BETWEEN LOW AND HIGH 
                            AND CID=1)
      WHERE CID = 1;
    SELECT * FROM CUSTOMER WHERE CID=1;
    
-- 3�� �� �ٲ� �� ������ ��� (cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public CustomerDto getCustomer(int cid)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND CID=1;
  
-- 4�� �� ����޸�� ����
    -- public ArrayList<String> getLevelNames()
SELECT LEVELNAME FROM CUS_LEVEL;
  
-- 4. �� ��޺� ��� 
    -- (levelname�� �Է¹޾� cid, ctel, cname, cpoint, camount, levelname, forLevelUp���)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME='NORMAL'
  ORDER BY CAMOUNT DESC;
  
-- 5. �� ��ü ���
    -- (cid, ctel, cname, cpoint, camount, levelname, forLevelUp���)
    -- public ArrayList<CustomerDto> getCustomers()
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 
     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp
  FROM CUSTOMER C, CUS_LEVEL L
  WHERE C.LEVELNO=L.LEVELNO 
  ORDER BY CAMOUNT DESC;
  
-- 6.  ȸ��Ż�� (ctel�� �Է¹޾� delete)
    -- public int deleteCustomer(String ctel)
DELETE FROM CUSTOMER WHERE CTEL='010-6666-6666';
ROLLBACK;
    
    
    
    
    
    
    
    
    
    