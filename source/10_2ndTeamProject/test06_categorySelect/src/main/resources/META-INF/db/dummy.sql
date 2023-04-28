sdrop table clike cascade constraints;
drop table member cascade constraints;
drop table category cascade constraints;

-- 멤버
CREATE TABLE MEMBER(
    mID VARCHAR2(50) PRIMARY KEY,
    mPW VARCHAR2(50) NOT NULL,
    mNAME VARCHAR2(50) NOT NULL
);
insert into member values ('a','1','홍');
insert into member values ('b','1','홍');
-- 카테고리
create table category(
    cno number(3) primary key,
    main varchar2(30) not null,
    sub varchar2(30) not null
);
drop sequence category_sq;
create sequence category_SQ;
insert into category values (category_sq.nextval, '개발','독서');
insert into category values (category_sq.nextval, '개발','재테크');
insert into category values (category_sq.nextval, '개발','IT');
insert into category values (category_sq.nextval, '일상','요가');
insert into category values (category_sq.nextval, '일상','요리');
select cno||',' cno, main, sub from category order by cno;
-- 좋아요
create table clike(
    clno number(8) primary key,
    mID VARCHAR2(50),
    cno number(3),
    FOREIGN KEY(mID) REFERENCES MEMBER(mID),
    FOREIGN KEY(cno) references category(cno)
);
drop sequence clike_sq;
create sequence clike_SQ;
insert into clike values (clike_sq.nextval, 'a',(select cno from category where sub='독서'));
INSERT INTO CLIKE VALUES (CLIKE_SQ.NEXTVAL, 'a', (select cno from category where sub='요리'));
select * from clike where mid='a';
select * from clike;
delete from clike where mid='a' and cno=(select cno from category where sub='요리');
commit;