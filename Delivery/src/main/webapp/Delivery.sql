create table tbl_delivery_001(
	ship_no varchar2(6) primary key,
	recv_nm varchar2(10) not null,
	ship_dt varchar2(10),
	address varchar2(40),
	ship_st char(1) default '0'
);

drop table tbl_delivery_001;

delete from TBL_DELIVERY_001;

insert all
into tbl_delivery_001 values('D00001', '이철수', '20240301', '서울시 강남구', '0')
into tbl_delivery_001 values('D00002', '박민지', '20240302', '서울시 노원구', '1')
into tbl_delivery_001 values('D00003', '김민수', '20240303', '서울시 도봉구', '0')
select * from dual;

select 'D'||to_char(max(substr(ship_no, 2,5)+1), 'fm00000') from tbl_delivery_001;

select ship_no, recv_nm, substr(ship_dt,1,4)||'-'||substr(ship_dt,5,2)||'-'||substr(ship_dt,7,2), address, case when ship_st = '1' then '배송완료' when ship_st = '0' then '배송중' else '2' end from tbl_delivery_001;

select ship_no, recv_nm, ship_st from tbl_delivery_001 where ship_no = ?
