create table tbl_card_001(
	card_no number primary key,
	user_nm varchar2(10) not null,
	issue_dt date,
	dept varchar2(15),
	enter_yn char(1)
);

insert all
into tbl_card_001 values('100001', '홍길동', '20240101', '개발팀', '1')
into tbl_card_001 values('100002', '김영희', '20240201', '인사팀', '0')
into tbl_card_001 values('100003', '이철수', '20240305', '총무팀', '1')

select * from dual;

select max(card_no) +1 from TBL_CARD_001;

select card_no, user_nm, to_char(issue_dt, 'yyyy-mm-dd'), dept, case when enter_yn = '1' then '출입중' when enter_yn = '0' then '출입불가' else '2' end from tbl_card_001;

select card_no, user_nm, enter_yn where card_no = ? from tbl_card_001;

update tbl_card_001 set enter_yn = ? where card_no = ?;
