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
drop table if exists major;
drop table if exists student;
create table major(
	mCode int primary key auto_increment, -- auto_increment 필드의 경우 int
    mName varchar(30),
    mOffice varchar(30)
);
create table student(
	sNo numeric(4) ,
    sName varchar(30),
    mCode int,
    primary key(sNo),
    foreign key(mCode) references major(mCode) -- 외래키 제약조건은 아래만
);
insert into major (mName, mOffice) values ('컴공','203호');   -- 컴공번호 1
insert into major (mName, mOffice) values ('빅데이터','303호'); -- 2
insert into major (mName, mOffice) values ('디자인','403호');   -- 3
insert into student values (1111, '홍길동', 1);
insert into student values (1112, '신길동', 3);
insert into student values (1113, '김길동', 4); -- 에러
select * from student;
-- 학번, 이름, 학과번호, 학과명, 학과사무실
select sNo, sName, s.mCode, mName, mOffice
	from student s, major m
    where s.mCode=m.mCode;
-- 학번, 이름, 학과번호, 학과명, 학과사무실(학생이 없는 학과도 출력)    
select sNo, sName, s.mCode, mName, mOffice
	from student s right outer join major m
    on s.mCode=m.mCode;
select sNo, sName, length(sName) from student;

-- ★ ★ ★ ★ ★ 자바(JDBC) 수업시간에 쓸 테이블 ★ ★ ★ ★ ★
drop table if exists personal;
drop table if exists division;
create table division(
	dno int,           -- 부서번호
    dname varchar(20), -- 부서이름
    phone varchar(20), -- 부서전화
    position varchar(20), -- 부서위치
    primary key(dno)
);
create table personal(
	pno int, -- 사번
    pname varchar(20) not null, -- 사원명
    job   varchar(20) not null, -- 직책
    manager int,                -- 상사의 사번
    startdate date,             -- 입사일
    pay     int, -- 급여
    bonus   int, -- 상여금
    dno     int, -- 부서번호
    primary key(pno),
    foreign key(dno) references division(dno)
);
insert into division values (10, 'finance', '02-393-4321','서대문');
insert into division values (20, 'research', '02-555-4321','강남');
insert into division values (30, 'sales', '02-717-4321','마포');
insert into division values (40, 'cs', '031-4444-4321','안양');
select * from division;
commit;
insert into personal values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);
insert into personal values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);
insert into personal values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);
insert into personal values (1114,'james','manager',1001,'1990-04-12',3975,null,20);
insert into personal values (1001,'bill','president',null,'1989-01-10',7000,null,10);
insert into personal values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);
insert into personal values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);
insert into personal values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);
insert into personal values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);
insert into personal values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);
select pno, pname, pay, pay*12+ifnull(bonus,0) from personal;
select pno, pname, bonus, if(bonus is null, 0, bonus) from personal;
commit;
-- ★ ★ ★ DML ★ ★ ★

-- 단일행함수

-- top-n (limit)




