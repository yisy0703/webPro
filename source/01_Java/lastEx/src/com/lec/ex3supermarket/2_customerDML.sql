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

-- 3. ��ǰ���� (cid, price �Է¹޾� cpoint, camout, levelno update)
    -- public int buy(int cid, int price)
    
-- 3�� �� �ٲ� �� ������ ��� (cid, ctel, cname, cpoint, camount, levelname, forLevelUp)
    -- public CustomerDto getCustomer(int cid)
    
-- 4�� �� ����޸�� ����
    -- public ArrayList<String> 

-- 4. �� ��޺� ��� 
    -- (levelname�� �Է¹޾� cid, ctel, cname, cpoint, camount, levelname, forLevelUp���)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)

-- 5. �� ��ü ���
    -- (cid, ctel, cname, cpoint, camount, levelname, forLevelUp���)
    -- public ArrayList<CustomerDto> getCustomers()
  
-- 6.  ȸ��Ż�� (ctel�� �Է¹޾� delete)
    -- public int deleteCustomer(String ctel)
    
    
    
    
    
    
    
    
    
    
    