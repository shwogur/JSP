create table subject(
	sno varchar2(1) primary key,
	sname varchar2(50),
	teacher varchar2(50)
);

create table student(
	id varchar2(5) primary key,
	name varchar2(20),
	dno varchar2(1),
	gender varchar2(3)
);

create table score(
	id varchar2(5),
	sno varchar2(1),
	sdate varchar2(4),
	semester varchar2(1),
	stype varchar2(1),
	score number(3),
	primary key(id, sno, sdate, semester, stype),
	foreign key (id) references student (id),
	foreign key (sno) references subject (sno)
);

insert all
into subject values('1', '국어', '김영국')
into subject values('2', '영어', '강은숙')
into subject values('3', '수학', '류주희')
into subject values('4', '공간', '정동엽')

into student values('10301', '권기현', '1', '남')
into student values('10302', '구지우', '1', '여')
into student values('10303', '권태준', '1', '남')
into student values('10304', '금기연', '1', '여')
into student values('10305', '김영진', '1', '남')
into student values('10401', '김주현', '2', '남')
into student values('10402', '김태민', '2', '여')
into student values('10403', '임수민', '2', '여')
into student values('10404', '남상도', '2', '남')
into student values('10405', '조은호', '2', '여')

into score values('10301', '1', '2021', '1', '1', 70)
into score values('10302', '1', '2021', '1', '1', 80)
into score values('10303', '1', '2021', '1', '1', 45)
into score values('10304', '1', '2021', '1', '1', 65)
into score values('10305', '1', '2021', '1', '1', 90)

into score values('10401', '1', '2021', '1', '1', 95)
into score values('10402', '1', '2021', '1', '1', 65)
into score values('10403', '1', '2021', '1', '1', 80)
into score values('10404', '1', '2021', '1', '1', 64)
into score values('10405', '1', '2021', '1', '1', 55)

into score values('10301', '1', '2021', '1', '2', 95)
into score values('10302', '1', '2021', '1', '2', 80)
into score values('10303', '1', '2021', '1', '2', 73)
into score values('10304', '1', '2021', '1', '2', 75)
into score values('10305', '1', '2021', '1', '2', 73)

into score values('10401', '1', '2021', '1', '2', 100)
into score values('10402', '1', '2021', '1', '2', 75)
into score values('10403', '1', '2021', '1', '2', 70)
into score values('10404', '1', '2021', '1', '2', 60)
into score values('10405', '1', '2021', '1', '2', 50)

into score values('10301', '2', '2021', '1', '1', 70)
into score values('10302', '2', '2021', '1', '1', 75)
into score values('10303', '2', '2021', '1', '1', 80)
into score values('10304', '2', '2021', '1', '1', 45)
into score values('10305', '2', '2021', '1', '1', 65)

into score values('10401', '2', '2021', '1', '1', 68)
into score values('10402', '2', '2021', '1', '1', 84)
into score values('10403', '2', '2021', '1', '1', 50)
into score values('10404', '2', '2021', '1', '1', 100)
into score values('10405', '2', '2021', '1', '1', 40)

into score values('10301', '2', '2021', '1', '2', 80)
into score values('10302', '2', '2021', '1', '2', 95)
into score values('10303', '2', '2021', '1', '2', 85)
into score values('10304', '2', '2021', '1', '2', 75)
into score values('10305', '2', '2021', '1', '2', 65)

into score values('10401', '2', '2021', '1', '2', 95)
into score values('10402', '2', '2021', '1', '2', 60)
into score values('10403', '2', '2021', '1', '2', 94)
into score values('10404', '2', '2021', '1', '2', 80)
into score values('10405', '2', '2021', '1', '2', 65)

select * from dual;

select id, name, dno, gender
from student;

select to_char(sysdate, 'yyyy'), case when to_number(to_char(sysdate, 'mm')) between 1 and 7 then '1' else '2' end from dual;

select s.id, st.name, round(avg(s.score))
from score s
join student st on s.id = st.id
where s.sdate = ?
and s.semeter = ?
and s.sno = ?
and (s.stype='1' or s.stype='2')
group by s.id, st.name
order by 1;

select s.id, st.name, s.score
from score s
join student st on s.id = st.id
where s.sdate = ?
and s.semester = ?
and s.sno = ?
and s.stype = ?
order by 1;