create table tbl_university(
	university_code char(4) primary key,
	university_name varchar2(15),
	phone_num varchar2(13)
);

create table tbl_major(
	major_code char(4) primary key,
	dept_name varchar2(15),
	major_name varchar2(20),
	quota number
);

create table tbl_apply(
	regist_num char(13) primary key,
	university_code char(4),
	major_code char(4),
	name varchar2(15),
	s_score number,
	n_score number,
	total_score number
);

insert all
into tbl_university values('U001', '서울대학교', '01015880001')
into tbl_university values('U002', '경기대학교', '01015880002')

into tbl_major values('M001', '인문계열', '법학과', 20)
into tbl_major values('M002', '자연계열', '컴퓨터공학과', 30)

into tbl_apply values('0201013000001', 'U001', 'M001', '김철수', 100, 100, 200)
into tbl_apply values('0202023000002', 'U001', 'M002', '이철수', 90, 85, 175)
into tbl_apply values('0203033000003', 'U001', 'M001', '박철수', 80, 75, 155)
into tbl_apply values('0204043000004', 'U002', 'M001', '저철수', 70, 95, 165)
into tbl_apply values('0205053000005', 'U002', 'M002', '권철수', 60, 65, 125)
into tbl_apply values('0206064000006', 'U001', 'M002', '김영희', 65, 100, 165)
into tbl_apply values('0207074000007', 'U002', 'M001', '이영희', 75, 70, 145)
into tbl_apply values('0208084000008', 'U002', 'M001', '박영희', 85, 60, 145)
into tbl_apply values('0209094000009', 'U001', 'M001', '조영희', 95, 80, 175)
into tbl_apply values('0210104000010', 'U001', 'M002', '권영희', 100, 90, 190)

select * from dual;

select university_code, university_name, substr(phone_num,1,3)||'-'||substr(phone_num,4,4)||'-'||substr(phone_num,8,4) from tbl_university;

select university_code, '['||university_code||']', university_name from tbl_university;

select major_code, '['||major_code||']', major_name from tbl_major;

select name, substr(regist_num,1,6)||'-'||substr(regist_num,7,7), university_name, major_name, s_score, n_score, total_score, row_number() over (order by total_score desc)
from tbl_university u, tbl_major m, tbl_apply a
where u.university_code = a.university_code
and m.major_code = a.major_code;

select u.university_code, u.university_name, count(u.university_name),  to_char(round(avg(a.total_score), 1), '999.0')
from tbl_university u, tbl_apply a
where u.university_code = a.university_code
group by u.university_code, u.university_name
order by 1;
