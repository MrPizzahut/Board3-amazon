drop table board;

create table board(
	num number not null primary key,
	username varchar2(20),
	password varchar2(20),
	title varchar2(50),
	content varchar2(4000),
	reg_date date default sysdate,
	hit number default 0,
	ref number,
	re_level number,
	re_step number
);

create sequence seq_num increment by 1 start with 1;