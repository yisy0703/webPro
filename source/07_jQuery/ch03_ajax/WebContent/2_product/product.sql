DROP TABLE PRODUCT CASCADE CONSTRAINTS;
CREATE TABLE PRODUCT (
  PNO NUMBER(3) PRIMARY KEY,
  PNAME VARCHAR2(100) NOT NULL,
  PSTOCK NUMBER(3) NOT NULL
);
INSERT INTO PRODUCT VALUES (1, '공책', 10);
INSERT INTO PRODUCT VALUES (2, '볼펜', 20);
INSERT INTO PRODUCT VALUES (3, '지우개', 0);
COMMIT;
SELECT PSTOCK FROM PRODUCT WHERE PNAME='지우개';
SELECT PSTOCK FROM PRODUCT WHERE PNAME='공';