-- -- [XI] �ε��� : ���� ������ �ϴ� �ε���
SELECT * FROM USER_INDEXES;
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP; -- EMP���̺�� ���� ������  EMP01;
SELECT * FROM EMP01; -- 14��
INSERT INTO EMP01 SELECT * FROM EMP01; -- �ڵ����ͻ�Ƣ�� 1��(28) 2��(56��)




