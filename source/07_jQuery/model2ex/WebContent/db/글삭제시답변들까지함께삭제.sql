-- source/06_jsp/model2ex 프로젝트는 글삭제시 해당글만 삭제
-- source/07_jQuery/model2ex 프로젝트는 글삭제시 답변글들까지 삭제
DROP TABLE MEMO;
CREATE TABLE MEMO (
  ID NUMBER(4) PRIMARY KEY,
  TITLE VARCHAR2(100) NOT NULL
);