--[ VII ] DDL, DCL, DML
--SQL = DDL(���̺� ����, ���̺����, ���̺�������, ���̺� ��� ������ ����) + 
--      DML(SELECT, INSERT, UPDATE, DELETE) + 
--      DCL(����ڰ��� ����, ����ڿ��Ա��Ѻο�, ���ѹ�Ż, ����ڰ�������, Ʈ������ ��ɾ�)

-- �� �� �� DDL �� �� ��
-- 1. ���̺� ����(CREATE TABLE ���̺��...) : ���̺� ������ �����ϱ�
CREATE TABLE BOOK (
    BOOKID NUMBER(4), -- BOOKID �ʵ��� Ÿ���� ���� 4�ڸ�
    BOOKNAME VARCHAR2(20), -- BOOKNAME�ʵ��� Ÿ���� ���� 20BYTE
    PUBLISHER VARCHAR2(20), -- PUBLISHER �ʵ��� Ÿ���� ���� 20BYTE
    RDATE     DATE,         -- RDATE �ʵ��� Ÿ���� DATE��
    PRICE     NUMBER(8, 2)  -- PRICE�ʵ��� Ÿ���� ���� ��ü 8�ڸ�, �Ҽ��� 2, �Ҽ����� 6. �Ҽ����� �ڸ��� ���Ե��� ����
);












