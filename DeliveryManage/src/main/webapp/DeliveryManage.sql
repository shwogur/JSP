create table tbl_rider_001(
	rider_id number primary key,
	rider_name varchar2(20) not null,
	phone varchar2(20)
);

create table tbl_store_001(
	store_id number primary key,
	store_name varchar2(30) not null,
	area varchar2(30)
);

create table tbl_delivery_001(
	delivery_id number primary key,
	rider_id number references tbl_rider_001(rider_id) not null,
	store_id number references tbl_store_001(store_id) not null,
	base_fee number,
	single_yn char(1) default 'N',
	delivery_date date
);

delete from tbl_rider_001;
delete from tbl_store_001;
delete from tbl_delivery_001;

insert all
into tbl_rider_001 values(1, '김재원', '010-1111-1111')
into tbl_rider_001 values(2, '이민수', '010-2222-2222')
into tbl_rider_001 values(3, '박서연', '010-3333-3333')
into tbl_rider_001 values(4, '정하늘', '010-4444-4444')

into tbl_store_001 values(10, '강남점', '강남')
into tbl_store_001 values(11, '홍대점', '마포')
into tbl_store_001 values(12, '신촌점', '서대문')
into tbl_store_001 values(13, '잠실점', '송파')

into tbl_delivery_001 values(1, 1, 10, 3000, 'N', '2023-08-01')
into tbl_delivery_001 values(2, 1, 11, 3000, 'Y', '2023-08-01')
into tbl_delivery_001 values(3, 1, 12, 3500, 'Y', '2023-08-02')
into tbl_delivery_001 values(4, 2, 13, 3000, 'N', '2023-08-01')
into tbl_delivery_001 values(5, 2, 10, 3000, 'N', '2023-08-02')
into tbl_delivery_001 values(6, 2, 11, 3000, 'N', '2023-08-01')
into tbl_delivery_001 values(7, 3, 11, 3000, 'N', '2023-08-02')
into tbl_delivery_001 values(8, 3, 12, 3000, 'N', '2023-08-02')
into tbl_delivery_001 values(9, 4, 10, 3000, 'Y', '2023-08-02')
into tbl_delivery_001 values(10, 4, 11, 3000, 'Y', '2023-08-03')
select * from dual;

select rider_id, rider_name from tbl_rider_001;

select store_id, store_name from tbl_store_001;

select max(delivery_id)+1 from tbl_delivery_001;

select delivery_id, rider_name, store_name, to_char(base_fee, 'fm999,999,999'), single_yn, case when single_yn = 'Y' then to_char(base_fee + 2000, 'fm999,999,999') else to_char(base_fee, 'fm999,999,999') end
from tbl_rider_001 r join tbl_delivery_001 d on r.rider_id = d.rider_id join tbl_store_001 s on s.store_id = d.store_id order by 1;

select delivery_id, base_fee, single_yn from tbl_delivery_001;

select rider_name, to_char(sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end), 'fm999,999,999')
from tbl_rider_001 r join tbl_delivery_001 d on r.rider_id = d.rider_id group by rider_name
having sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end) > (select sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end) / 4 from tbl_delivery_001); 

