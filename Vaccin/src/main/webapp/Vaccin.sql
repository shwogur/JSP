create table tbl_jumin_201808(
	jumin char(14) primary key,
	pname varchar2(16),
	tel varchar2(13),
	address varchar2(10)
);

create table tbl_hosp_202108(
	hospcode char(4) primary key,
	hospname varchar2(10),
	hosptel varchar2(10),
	hospaddr varchar2(10)
);

create table tbl_vaccresv_202108(
	resvno char(8) primary key,
	jumin char(14),
	vcode char(4),
	hospcode char(4),
	resvdate char(8),
	resvtime char(4)
);

insert all
into tbl_jumin_201808 values('700101-1000001', '김주민', '010-1234-0001', '서울')
into tbl_jumin_201808 values('700101-1000002', '이주민', '010-1234-0002', '서울')
into tbl_jumin_201808 values('700101-1000003', '박주민', '010-1234-0003', '서울')
into tbl_jumin_201808 values('700101-1000004', '조주민', '010-1234-0004', '대전')
into tbl_jumin_201808 values('700101-1000005', '홍주민', '010-1234-0005', '대전')
into tbl_jumin_201808 values('700101-1000006', '나주민', '010-1234-0006', '대구')
into tbl_jumin_201808 values('700101-1000007', '황주민', '010-1234-0007', '대구')
into tbl_jumin_201808 values('700101-1000008', '용주민', '010-1234-0008', '광주')
into tbl_jumin_201808 values('700101-1000009', '백주민', '010-1234-0009', '광주')
into tbl_jumin_201808 values('700101-1000010', '송주민', '010-1234-0010', '광주')

into tbl_hosp_202108 values('H001', '가-병원', '1588-0001', '서울')
into tbl_hosp_202108 values('H002', '나-병원', '1588-0002', '대전')
into tbl_hosp_202108 values('H003', '다-병원', '1588-0003', '대구')
into tbl_hosp_202108 values('H004', '라-병원', '1588-0004', '광주')

into tbl_vaccresv_202108 values('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920')
into tbl_vaccresv_202108 values('20210002', '700101-1000002', 'V001', 'H002', '20210901', '1030')
into tbl_vaccresv_202108 values('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130')
into tbl_vaccresv_202108 values('20210004', '700101-1000004', 'V002', 'H001', '20210902', '1230')
into tbl_vaccresv_202108 values('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330')
into tbl_vaccresv_202108 values('20210006', '700101-1000006', 'V003', 'H003', '20210903', '1430')
into tbl_vaccresv_202108 values('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530')
into tbl_vaccresv_202108 values('20210008', '700101-1000008', 'V003', 'H002', '20210903', '1630')
into tbl_vaccresv_202108 values('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730')
into tbl_vaccresv_202108 values('20210010', '700101-1000010', 'V003', 'H001', '20210904', '1830')

select * from dual;

delete from tbl_jumin_201808;
delete from tbl_hosp_202108;
delete from tbl_vaccresv_202108;

select
from tbl_jumin_201808 j, tbl_hosp_202108 h, tbl_vaccresv_202108 v


select h.hospcode, h.hospname, count(v.hospcode), (select count(*) from tbl_vaccresv_202108)
from tbl_hosp_202108 h, tbl_vaccresv_202108 v
where h.hospcode = v.hospcode
group by h.hospcode, h.hospname
order by 1 asc;

select j.pname, v.resvno, j.jumin, decode(substr(j.jumin, 8, 1), 1, '남', 2, '여'), j.tel, 
to_char(to_date(v.resvdate, 'yyyymmdd'), 'yyyy\"년\"mm\"월\"dd\"일"'), substr(v.resvtime, 1, 2) || ':' || substr(v.resvtime, 3, 2), h.hospname, 
h.hosptel, h.hospaddr, decode(v.vcode, 'V001', 'A백신', 'V002', 'B백신', 'V003', 'C백신')
from tbl_vaccresv_202108 v, tbl_jumin_201808 j, tbl_hosp_202108 h
where v.jumin = j.jumin
and v.hospcode = h.hospcode;

select j.pname, v.resvno, j.jumin, decode(substr(j.jumin, 8, 1), 1, '남', 2, '여'), j.tel, to_char(to_date(v.resvdate, 'yyyymmdd'), 'yyyy\"년\"mm\"월\"dd\"일"'), substr(v.resvtime, 1, 2) || ':' || substr(v.resvtime, 3, 2), h.hospname, h.hosptel, h.hospaddr, decode(v.vcode, 'V001', 'A백신', 'V002', 'B백신', 'V003', 'C백신') from tbl_vaccresv_202108 v, tbl_jumin_201808 j, tbl_hosp_202108 h where v.jumin = j.jumin and v.hospcode = h.hospcode;