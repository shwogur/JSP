create table tbl_artist_201905(
	artist_id char(4) primary key,
	artist_name varchar2(20),
	artist_birth char(8),
	artist_gender char(1),
	talent char(1),
	agency varchar2(30)
);

create table tbl_mento_201905(
	mento_id char(4) primary key,
	mento_name varchar2(20)
);

create table tbl_point_201905(
	serial_no varchar2(8) primary key,
	artist_id char(4),
	mento_id char(4),
	point number(3)
);

insert all
into tbl_artist_201905 values('A001', '김스타', '19970101', 'F', '1', 'A엔터테인먼트')
into tbl_artist_201905 values('A002', '조스타', '19980201', 'M', '2', 'B엔터테인먼트')
into tbl_artist_201905 values('A003', '왕스타', '19900301', 'M', '3', 'C엔터테인먼트')
into tbl_artist_201905 values('A004', '정스타', '20000401', 'M', '1', 'D엔터테인먼트')
into tbl_artist_201905 values('A005', '홍스타', '20010501', 'F', '2', 'E엔터테인먼트')

into tbl_mento_201905 values('J001', '황멘토')
into tbl_mento_201905 values('J002', '박멘토')
into tbl_mento_201905 values('J003', '장멘토')

into tbl_point_201905 values('20190001', 'A001', 'J001', 78)
into tbl_point_201905 values('20190002', 'A001', 'J002', 76)
into tbl_point_201905 values('20190003', 'A001', 'J003', 70)
into tbl_point_201905 values('20190004', 'A002', 'J001', 80)
into tbl_point_201905 values('20190005', 'A002', 'J002', 72)
into tbl_point_201905 values('20190006', 'A002', 'J003', 78)
into tbl_point_201905 values('20190007', 'A003', 'J001', 90)
into tbl_point_201905 values('20190008', 'A003', 'J002', 92)
into tbl_point_201905 values('20190009', 'A003', 'J003', 88)
into tbl_point_201905 values('20190010', 'A004', 'J001', 96)
into tbl_point_201905 values('20190011', 'A004', 'J002', 90)
into tbl_point_201905 values('20190012', 'A004', 'J003', 98)
into tbl_point_201905 values('20190013', 'A005', 'J001', 88)
into tbl_point_201905 values('20190014', 'A005', 'J002', 86)
into tbl_point_201905 values('20190015', 'A005', 'J003', 86)

select * from dual;

select artist_gender
from TBL_ARTIST_201905


select artist_id, artist_name, to_char(to_Date(artist_birth), 'yyyy\"년\"mm\"월\"dd\"일\"'), case artist_gender when 'F' then '여' when 'M' then '남' end, case talent when '1' then '보컬' when '2' then '댄스' when '3' then '랩' end, agency
from tbl_artist_201905;

select p.serial_no, a.artist_id, a.artist_name, to_char(to_Date(a.artist_birth), 'yyyy\"년\"mm\"월\"dd\"일\"'), p.point, case when p.point >= 90 then 'A' when p.point >= 80 then 'B' when p.point >= 70 then 'C' else 'D' end as 평점, p.mento_id
from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p
where a.artist_id = p.artist_id
and m.mento_id = p.mento_id
order by 1 asc;

select a.artist_id, a.artist_name, sum(p.point), round(avg(p.point), 2), rank() over(order by sum(p.point) desc) as 총점
from tbl_artist_201905 a, tbl_point_201905 p
where a.artist_id = p.artist_id
group by a.artist_id, a.artist_name
order by 5;

