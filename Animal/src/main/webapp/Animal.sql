create table tbl_shelter_001(
	shelter_no varchar2(5) primary key,
	shelter_name varchar2(20) not null,
	phone varchar2(13)
);

create table tbl_animal_001(
	animal_no varchar2(6) primary key,
	animal_name varchar2(10) not null,
	rescue_dt varchar2(8),
	kind varchar2(10),
	protect_yn char(1),
	shelter_no varchar2(5)
);

insert all
into tbl_shelter_001 values('S001', '서울보호소', '02-123-4567')
into tbl_shelter_001 values('S002', '경기보호소', '031-987-6543')

into tbl_animal_001 values('A00001', '초코', '20240201', '개', '1', 'S001')
into tbl_animal_001 values('A00002', '나비', '20240120', '고양이', '0', 'S002')
into tbl_animal_001 values('A00003', '콩이', '20240310', '개', '1', 'S001')
select * from dual;

select 'A'||to_char(max(substr(a.animal_no,2,5)+1), 'fm00000'), a.shelter_no, s.shelter_name
from tbl_shelter_001 s
join tbl_animal_001 a
on s.shelter_no = a.shelter_no
group by a.shelter_no, s.shelter_name;


select distinct a.shelter_no, s.shelter_name 
 from tbl_shelter_001 s 
 join tbl_animal_001 a 
 on s.shelter_no = a.shelter_no;
 
select a.animal_no, a.animal_name, to_char(to_date(a.rescue_dt), 'yyyy-mm-dd'), to_date(sysdate) - to_date(a.rescue_dt), s.shelter_name, decode(a.protect_yn,'1','입양완료','0','보호중')
from tbl_shelter_001 s
join tbl_animal_001 a
on s.shelter_no = a.shelter_no;

select a.animal_no, a.animal_name, s.shelter_name, decode(a.protect_yn,'1','입양완료','0','보호중')
from tbl_shelter_001 s
join tbl_animal_001 a
on s.shelter_no = a.shelter_no;
