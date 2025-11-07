create table tbl_bakery(
	pk_bakery varchar2(5) primary key,
	name varchar2(20) not null,
	address varchar2(255),
	etc varchar2(255)
);

create table tbl_bread(
	pk_bread varchar2(5) primary key,
	name varchar2(20) not null,
	price varchar2(10) not null
);

create table tbl_sale(
	pk_sale varchar2(5) primary key,
	deal_date date not null,
	deal_count number(10) not null,
	fk_bakery varchar2(5) not null references tbl_bakery(pk_bakery),
	fk_bread varchar2(5) not null references tbl_bread(pk_bread)
);

insert all
into tbl_bakery values('A0001', '정심당', '대전', '정성을 다한 마음으로 빵을 만드는 빵집')
into tbl_bakery values('A0002', '셋주류', '천안', '전설의 레전드 원조 빵집')
into tbl_bakery values('A0003', '오송빵집', '대구', '고구마 맛을 극한으로 올린 빵집')
into tbl_bakery values('A0004', '코끼리제과', '안동', '코끼리 없는 코끼리 빵집')

into tbl_bread values('B0001', '대보름빵', '1000')
into tbl_bread values('B0002', '자라빵', '1500')
into tbl_bread values('B0003', '코끼리빵', '2000')
into tbl_bread values('B0004', '찹쌀도너츠', '2500')
into tbl_bread values('B0005', '고구마빵', '3000')
into tbl_bread values('B0006', '치즈빵', '3500')
into tbl_bread values('B0007', '햄빵', '4000')

into tbl_sale values('00001', '20250401', 10, 'A0001', 'B0001')
into tbl_sale values('00002', '20250402', 15, 'A0001', 'B0004')
into tbl_sale values('00003', '20250403', 10, 'A0001', 'B0005')
into tbl_sale values('00004', '20250404', 15, 'A0001', 'B0003')
into tbl_sale values('00005', '20250405', 10, 'A0002', 'B0002')
into tbl_sale values('00006', '20250406', 15, 'A0002', 'B0004')
into tbl_sale values('00007', '20250407', 10, 'A0002', 'B0003')
into tbl_sale values('00008', '20250408', 15, 'A0002', 'B0004')
into tbl_sale values('00009', '20250409', 10, 'A0003', 'B0002')
into tbl_sale values('00010', '20250410', 15, 'A0003', 'B0004')
into tbl_sale values('00011', '20250411', 10, 'A0003', 'B0002')
into tbl_sale values('00012', '20250412', 15, 'A0004', 'B0001')
into tbl_sale values('00013', '20250413', 15, 'A0004', 'B0002')
into tbl_sale values('00014', '20250414', 10, 'A0004', 'B0003')
into tbl_sale values('00015', '20250415', 15, 'A0004', 'B0005')
select * from dual;

select pk_bakery, name from tbl_bakery

select pk_bread, name from tbl_bread

select pk_bread, name, '￦'||to_char(price, 'fm999,999,999') from tbl_bread order by 1;

select s.pk_sale, substr(s.deal_date,1,2)||'-'||substr(s.deal_date,4,2)||'-'||substr(s.deal_date,7,2), deal_count||'개', name
from tbl_sale s, tbl_bread b
where pk_bread = fk_bread;
order by 1;

select ba.name, ba.address, ba.etc, sum(s.deal_count)||'개', '￦'||to_char(sum(to_number(br.price) * s.deal_count), 'fm999,999,999')
from tbl_bakery ba, tbl_bread br, tbl_sale s
where ba.pk_bakery = s.fk_bakery
and br.pk_bread = s.fk_bread
group by  ba.name, ba.address, ba.etc;

select max(pk_sale) +1 from tbl_sale;

select to_char(sysdate, 'yyyymmdd') from tbl_sale;
