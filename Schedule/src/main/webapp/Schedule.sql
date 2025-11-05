create table tbl_member1(
	pk_member varchar(5) primary key,
	name varchar(20) not null,
	grade varchar(255)
);
create table tbl_schedule1(
	pk_schedule number(5) primary key,
	do_date date not null,
	do_memo varchar(30) not null,
	fk_member varchar(10) references tbl_member1(pk_member) not null
);

drop table tbl_member1;
drop table tbl_schedule1;

delete from tbl_member1;
delete from tbl_schedule1;

insert all
into tbl_member1 values('M0001', '홍길동', '의적')
into tbl_member1 values('M0002', '심청', '효녀')
into tbl_member1 values('M0003', '세종', '대왕')
into tbl_member1 values('M0004', '이순신', '장군')
into tbl_member1 values('M0005', '장영실', '과학자')

into tbl_schedule1 values(1, '20250101', '탐관오리 찾기', 'M0001')
into tbl_schedule1 values(2, '20250201', '아버지 돌보기', 'M0002')
into tbl_schedule1 values(3, '20250301', '한글 창제', 'M0003')
into tbl_schedule1 values(4, '20250401', '거북선으로 국가 수호', 'M0004')
select * from dual;

select * from tbl_member1 order by 1;

select s.pk_schedule, to_char(s.do_date, 'yyyy-mm-dd'), s.do_memo, s.fk_member, m.name
from tbl_member1 m, tbl_schedule1 s
where m.pk_member = s.fk_member;

select max(pk_schedule) +1
from tbl_schedule1

select *
from tbl_schedule1;
