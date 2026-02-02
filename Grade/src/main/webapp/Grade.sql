create table tbl_student_202409(
	student_id char(8) primary key,
	student_name varchar2(20),
	jumin varchar2(14),
	phone varchar2(13),
	course varchar2(2),
	major varchar2(2)
);

create table tbl_subject_202409(
	subject_code varchar2(4) primary key,
	subject_name varchar2(30),
	professor_name varchar2(20),
	classification varchar2(2)
);

create table tbl_grade_202409(
	student_id char(8) not null,
	student_code varchar2(4) not null,
	mid number(3),
	final number(3),
	attend number(3),
	report number(3),
	etc number(3)
);

insert all
into tbl_student_202409 values('20240001', '홍길동', '0601013333333', '01011112222', '01', '01')
into tbl_student_202409 values('20240002', '김길동', '0602023333333', '01011113333', '01', '01')
into tbl_student_202409 values('20240003', '이길동', '0603033222222', '01011114444', '01', '01')
into tbl_student_202409 values('20240004', '최길동', '0604044444444', '01011115555', '01', '01')

into tbl_subject_202409 values('1001', '운영체제', '김교수', '01')
into tbl_subject_202409 values('1002', '네트워크', '이교수', '01')
into tbl_subject_202409 values('1003', '사고와표현', '최교수', '02')

into tbl_grade_202409 values('20240001', '1001', 90, 80, 90, 80, 80)
into tbl_grade_202409 values('20240002', '1002', 90, 70, 80, 70, 70)
into tbl_grade_202409 values('20240003', '1001', 90, 80, 90, 80, 80)
into tbl_grade_202409 values('20240004', '1001', 90, 70, 80, 70, 70)
select * from dual;

select st.student_id, st.student_name, decode((substr(jumin,7,1)),1,'남자',3,'남자',2,'여자',4,'여자'), su.subject_name, to_char(round(g.mid * 0.3,1),'999.0'), to_char(round(g.final * 0.3,1),'999.0'), to_char(round(g.attend * 0.2,1),'999.0'), to_char(round(g.report * 0.1,1),'999.0'), to_char(round(g.etc * 0.1,1),'999.0'), to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0'), case when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 89 then 'A' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 79 then 'B' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 69 then 'C' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 59 then 'D' else 'F' end
from tbl_student_202409 st, tbl_subject_202409 su, tbl_grade_202409 g
where st.student_id = g.student_id
and g.student_code = su.subject_code;


select case when st.course = '01' then '학사'  when st.course = '02' then '석사'  when st.course = '03' then '박사' end, st.student_id, st.student_name, count(*)||'과목', to_char(round(sum(g.mid*0.3+g.final*0.3+g.attend*0.2+g.report*0.1+g.etc*0.1),1),'999.0'), to_char(to_char(round(sum(g.mid*0.3+g.final*0.3+g.attend*0.2+g.report*0.1+g.etc*0.1),1),'999.0') / count(g.student_code),'999.0') 
from tbl_student_202409 st, tbl_subject_202409 su, tbl_grade_202409 g
where st.student_id = g.student_id
and g.student_code = su.subject_code
group by st.course, st.student_id, st.student_name;

select *
from tbl_grade_202409;
