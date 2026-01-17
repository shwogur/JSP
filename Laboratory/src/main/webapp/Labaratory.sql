create table tbl_lab_001(
	lab_no varchar2(5) primary key,
	lab_name varchar2(20) not null
);

create table tbl_lab_equip_001(
	equip_no varchar2(6) primary key,
	equip_name varchar2(30) not null,
	lab_no varchar2(5),
	use_yn char(1)
);

drop table tbl_lab_001;
drop table tbl_lab_equip_001;

delete from tbl_lab_001;
delete from tbl_lab_equip_001;

insert all
into tbl_lab_001 values('L001', '생물실험실')
into tbl_lab_001 values('L002', '화학실험실')
into tbl_lab_001 values('L003', '물리실험실')

into tbl_lab_equip_001 values('E00001', '현미경', 'L001', '1')
into tbl_lab_equip_001 values('E00002', '배양기', 'L001', '1')
into tbl_lab_equip_001 values('E00003', '원심분리기', 'L001', '0')
into tbl_lab_equip_001 values('E00004', '비커', 'L002', '1')
into tbl_lab_equip_001 values('E00005', '플라스크', 'L002', '1')
into tbl_lab_equip_001 values('E00006', '가열기', 'L002', '1')
into tbl_lab_equip_001 values('E00007', '레이저', 'L003', '0')
into tbl_lab_equip_001 values('E00008', '전원공급기', 'L003', '0')
into tbl_lab_equip_001 values('E00009', '센서', 'L003', '1')
select * from dual;

select 'E'||to_char(max(substr(equip_no,2,5)+1), 'fm00000') from tbl_lab_equip_001;

select lab_name from tbl_lab_001;

select b.equip_no, b.equip_name, a.lab_name, case when b.use_yn = '1' then '사용중' when b.use_yn = '0' then '미사용' end from tbl_lab_001 a, tbl_lab_equip_001 b where a.lab_no = b.lab_no;

select a.lab_name, count(b.equip_name), count(case when b.use_yn = '1' then 1 end), round((count(case when b.use_yn = '1' then 1 end) *100 / count(b.equip_name)),1)
from tbl_lab_001 a, tbl_lab_equip_001 b
where a.lab_no = b.lab_no
group by a.lab_name
order by 4 desc;
