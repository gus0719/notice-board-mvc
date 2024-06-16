drop table boardV01;

purge recyclebin;

create table boardV01(
	BOD_NO number(23),
	BOD_WRITER varchar2(30),
	BOD_EMAIL varchar2(30),
	BOD_SUBJECT varchar2(100),
	BOD_PWD varchar2(30) not null,
	BOD_LOGTIME date default sysdate,
	BOD_CONTENT varchar2(4000),
	BOD_READCNT number(23) default 0,
	BOD_CONNIP varchar2(20)
);