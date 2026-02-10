create table tbl_lecture_001(
	lecture_id varchar2(5) primary key,
	lecture_name varchar2(20) not null
);

create table tbl_student_001(
	student_id varchar2(5) primary key,
	student_name varchar2(20) not null,
	lecture_id varchar2(5)
);

create table tbl_study_log(
	log_id varchar2(6) primary key,
	student_id varchar2(5) references tbl_student_001(student_id) not null,
	study_time number,
	focus_score number
);

delete from tbl_lecture_001;
delete from tbl_student_001;
delete from tbl_study_log;

insert all
into tbl_lecture_001 values('L001', 'Java')
into tbl_lecture_001 values('L002', 'Database')

into tbl_student_001 values('S001', '김철수', 'L001')
into tbl_student_001 values('S002', '이영희', 'L001')
into tbl_student_001 values('S003', '박민수', 'L002')

into tbl_study_log values('LG001', 'S001', 40, 80)
into tbl_study_log values('LG002', 'S001', 45, 85)
into tbl_study_log values('LG003', 'S002', 30, 70)
into tbl_study_log values('LG004', 'S003', 50, 90)
select * from dual;

select distinct lo.student_id, s.student_name
from tbl_student_001 s
join tbl_study_log lo
on s.student_id = lo.student_id
order by 1;

select 'LG'||to_char(max(substr(log_id,3,3)+1),'fm000') from tbl_study_log;

select distinct le.lecture_name, count(distinct s.student_name), round(avg(lo.study_time),1), round(avg(lo.focus_score),1) 
from tbl_lecture_001 le
join tbl_student_001 s
on le.lecture_id = s.lecture_id
join tbl_study_log lo
on s.student_id = lo.student_id
group by le.lecture_name
order by 2;

select distinct le.lecture_name
from tbl_lecture_001 le
join tbl_student_001 s
on le.lecture_id = s.lecture_id;

select lo.log_id, lo.study_time, lo.focus_score
from tbl_student_001 s
join tbl_study_log lo
on s.student_id = lo.student_id;
where s.student_name = ?;

select
from tbl_student_001 s
join tbl_study_log lo
on s.student_id = lo.student_id;
where s.student_name = ?;

select s.student_name, lo.log_id, lo.study_time, lo.focus_score
from tbl_student_001 s
join tbl_study_log lo
on s.student_id = lo.student_id;