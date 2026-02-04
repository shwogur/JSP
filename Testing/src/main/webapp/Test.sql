create table tbl_patient_202004(
	p_no char(4) primary key,
	p_name varchar2(20),
	p_birth char(8),
	p_gender char(1),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4),
	p_city char(2)
);

create table tbl_lab_test_202004(
	t_code char(4) primary key,
	t_name varchar2(20)
);

create table tbl_result_202004(
	p_no char(4) not null,
	t_code char(4),
	t_sdate date,
	t_status char(1),
	t_ldate date,
	t_result char(1),
	constraint result primary key(p_no, t_code, t_sdate)
);

insert all
into tbl_patient_202004 values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10')
into tbl_patient_202004 values('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20')
into tbl_patient_202004 values('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30')
into tbl_patient_202004 values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10')
into tbl_patient_202004 values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40')
into tbl_patient_202004 values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40')
into tbl_patient_202004 values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10')

into tbl_lab_test_202004 values('T001', '결핵')
into tbl_lab_test_202004 values('T002', '잠티푸스')
into tbl_lab_test_202004 values('T003', '수두')
into tbl_lab_test_202004 values('T004', '홍역')
into tbl_lab_test_202004 values('T005', '콜레라')

into tbl_result_202004 values('1001', 'T001', '2020-01-01', '1', '2020-01-02', 'X')
into tbl_result_202004 values('1002', 'T002', '2020-01-01', '2', '2020-01-02', 'P')
into tbl_result_202004 values('1003', 'T003', '2020-01-01', '2', '2020-01-02', 'N')
into tbl_result_202004 values('1004', 'T004', '2020-01-01', '2', '2020-01-02', 'P')
into tbl_result_202004 values('1005', 'T005', '2020-01-01', '2', '2020-01-02', 'P')
into tbl_result_202004 values('1006', 'T001', '2020-01-01', '2', '2020-01-02', 'N')
into tbl_result_202004 values('1007', 'T002', '2020-01-01', '2', '2020-01-02', 'P')
into tbl_result_202004 values('1005', 'T003', '2020-01-01', '2', '2020-01-02', 'P')
into tbl_result_202004 values('1006', 'T004', '2020-01-01', '2', '2020-01-02', 'N')
into tbl_result_202004 values('1007', 'T005', '2020-01-01', '2', '2020-01-02', 'N')
select * from dual;

select p_no, p_name, substr(p_birth,1,4)||'년'||substr(p_birth,5,2)||'월'||substr(p_birth,7,2)||'일', decode(p_gender,'M','남','F','여'),p_tel1||'-'||p_tel2||'-'||p_tel3, decode(p_city,'10','서울','20','경기','30','강원','40','대구') from tbl_patient_202004;

select p.p_no, p.p_name, l.t_name, to_char(r.t_sdate, 'yyyy-mm-dd'), decode(r.t_status,'1','검사중','2','검사완료'), to_char(r.t_ldate, 'yyyy-mm-dd'), decode(r.t_result,'X','미입력','P','양성','N','음성')
from tbl_patient_202004 p, tbl_lab_test_202004 l, tbl_result_202004 r
where p.p_no = r.p_no
and l.t_code = r.t_code
order by 1 asc;

select distinct p.p_city, decode(p_city,'10','서울','20','경기','30','강원','40','대구'), count(p.p_city)
from tbl_patient_202004 p, tbl_result_202004 r
where p.p_no = r.p_no
group by p_city
order by 1 asc;

select t_code, t_name from tbl_lab_test_202004;

select *
from tbl_result_202004
where p_no = '1008';
