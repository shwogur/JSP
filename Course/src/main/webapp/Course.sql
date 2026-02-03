create table tbl_course_2026(
	course_code varchar2(10) primary key,
	course_name varchar2(50) not null,
	course_credit number not null,
	professor varchar2(20)
);

create table tbl_student_2026(
	student_id varchar2(10) primary key,
	student_name varchar2(20) not null,
	student_dept varchar2(30),
	phone varchar2(15)
);

create table tbl_class_2026(
	regist_no number primary key,
	regist_date date not null,
	student_id varchar2(10) references tbl_student_2026(student_id) not null,
	course_code varchar2(10) references tbl_course_2026(course_code) not null
);

insert all
into tbl_course_2026 values('C001', '자료구조', 3, '김철수')
into tbl_course_2026 values('C002', '데이터베이스', 3, '이영희')
into tbl_course_2026 values('C003', '알고리즘', 3, '박민수')
into tbl_course_2026 values('C004', '운영체제', 3, '최지훈')
into tbl_course_2026 values('C005', '컴퓨터네트워크', 2, '정수진')

into tbl_student_2026 values('202601', '김지훈', '컴퓨터공학과', '010-1111-2222')
into tbl_student_2026 values('202602', '이서연', '소프트웨어과', '010-3333-4444')
into tbl_student_2026 values('202603', '박현우', '정보보호학과', '010-5555-6666')
into tbl_student_2026 values('202604', '최유진', '컴퓨터공학과', '010-7777-8888')
into tbl_student_2026 values('202605', '정민재', '인공지능학과', '010-9999-0000')

into tbl_class_2026 values(10001, '2026-02-15', '202601', 'C001')
into tbl_class_2026 values(10002, '2026-02-15', '202602', 'C003')
into tbl_class_2026 values(10003, '2026-02-16', '202601', 'C002')
into tbl_class_2026 values(10004, '2026-02-16', '202603', 'C001')
into tbl_class_2026 values(10005, '2026-02-17', '202604', 'C005')
select * from dual;

select max(regist_no) +1
from tbl_class_2026;

select cl.regist_no, cl.student_id, s.student_name, co.course_name, co.professor, co.course_credit, to_char(cl.regist_date, 'yyyy-mm-dd')
from tbl_course_2026 co, tbl_student_2026 s, tbl_class_2026 cl
where co.course_code = cl.course_code
and s.student_id = cl.student_id;

select cl.regist_no, to_char(cl.regist_date, 'yyyy-mm-dd'), cl.student_id, s.student_name, cl.course_code
from tbl_student_2026 s, tbl_class_2026 cl
where s.student_id = cl.student_id;

select rank() over (order by count(cl.regist_no) desc), co.course_code, co.course_name, co.professor, count(cl.regist_no)
from tbl_course_2026 co
left join tbl_class_2026 cl
on co.course_code = cl.course_code
group by co.course_code, co.course_name, co.professor
order by count(cl.regist_no) desc;
