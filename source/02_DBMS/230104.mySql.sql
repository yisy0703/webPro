-- DCL(계정생성, 권한부여, 권한박탈, 계정삭제)
-- DDL (제약조건, 시퀀스없음)
-- DML (outer join, and;&&, or;||, 일부단일행함수)
-- Java에서 쓸 데이터 넣고 연습해보기

show databases; -- database들의 리스
-- ★ ★ ★ DCL
create user user01 identified by 'password'; -- 계정 생성
grant all on *.* to user01; -- 권한 부여
grant all privileges on *.* to user01;
flush privileges; -- 
revoke all on *.* from user01; -- 권한박탈
drop user user01; -- 계정 삭제
-- 데이터베이스로 들어감
show databases;
create database kimdb; -- 새로운 데이터 베이스 생성 (kimdb)
use kimdb; -- kimdb 데이터 베이스로 들어감
select database(); -- 현재 들어와 있는 데이터 베이스
use world;
select database();
use kimdb;
show databases;
show tables; -- 현재 들어와 있는 데이터베이스 내의 테이블
-- ★ ★ ★ DDL
CREATE TABLE emp(
	empno    numeric(4) primary key,
    ename    varchar(20) not null, 
    nickname varchar(20) unique,
    sal      numeric(7,2) check(sal>0),
    comm     numeric(7,2) default 0
);
desc emp;
drop table if exists emp;
CREATE TABLE emp(
	empno    numeric(4),
    ename    varchar(20) not null, 
    nickname varchar(20) ,
    sal      numeric(7,2) ,
    comm     numeric(7,2) default 0,
    primary key(empno),
    unique(nickname),
    check(sal>0)
);
select * from emp;
insert into emp values (1111, '홍','천사',900,null);
select * from emp;
drop table if exists emp;

-- MAJOR (mCode;시퀀스pk학과번호, mName학과이름, mOffice학과사무실)
-- STUDENT (sNo학번, sName이름, mCode학과번호)
create table major(
	mCode int primary key auto_increment, -- auto_increment 필드의 경우 int
    mName varchar(30),
    mOffice varchar(30)
);
create table student(
	sNo numeric(4) primary key,
    sName varchar(30),
    mCode int references major(mCode)
);
select * from student;
select * from major;
insert into major (mName, mOffice) values ('컴공','203호');   -- 컴공번호 1
insert into major (mName, mOffice) values ('빅데이터','303호'); -- 2
insert into major (mName, mOffice) values ('디자인','403호');   -- 3
select * from major;
insert into student values (1111, '홍길동', 1);
insert into student values (1112, '신길동', 3);
insert into student values (1113, '김길동', 4);
select * from student;






