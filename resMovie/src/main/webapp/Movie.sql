create table tbl_movie(
	movie_id char(4) primary key,
	movie_name varchar2(50) not null,
	genre varchar2(20),
	price number(8)
);

create table tbl_customer(
	cust_id char(4) primary key,
	cust_name varchar2(20) not null,
	phone varchar2(15),
	join_date date
);

create table tbl_reservation(
	res_id char(8) primary key,
	cust_id char(4) references tbl_customer(cust_id) not null,
	movie_id char(4) references tbl_movie(movie_id) not null,
	res_date date,
	seat_no varchar2(5)
);

insert all
into tbl_movie values('M001', '인사이드 아웃 2', '애니메이션', 15000)
into tbl_movie values('M002', '파묘', '공포', 14000)
into tbl_movie values('M003', '범죄도시 4', '액션', 15000)
into tbl_movie values('M004', '인터스텔라', 'SF', 12000)
into tbl_movie values('M005', '어바웃 타임', '로맨스', 13000)

into tbl_customer values('C001', '홍길동', '010-1111-1111', '2024-01-01')
into tbl_customer values('C002', '김철수', '010-2222-2222', '2024-02-15')
into tbl_customer values('C003', '이영희', '010-3333-3333', '2024-03-10')
into tbl_customer values('C004', '박민수', '010-4444-4444', '2024-04-20')
into tbl_customer values('C005', '최지웅', '010-5555-5555', '2024-05-05')

into tbl_reservation values('20240001', 'C001', 'M001', '2024-06-01', 'A-1')
into tbl_reservation values('20240002', 'C002', 'M001', '2024-06-01', 'A-2')
into tbl_reservation values('20240003', 'C003', 'M002', '2024-06-02', 'B-5')
into tbl_reservation values('20240004', 'C001', 'M003', '2024-06-03', 'C-10')
into tbl_reservation values('20240005', 'C005', 'M004', '2024-06-04', 'D-3')
select * from dual;

select max(res_id) +1 from tbl_reservation;

select cust_id, cust_name from tbl_customer;

select movie_id, movie_name from tbl_movie;

select r.res_id, c.cust_name, m.movie_name, r.res_date, r.seat_no, to_char(m.price, 'fm999,999,999')
from tbl_movie m
join tbl_reservation r
on m.movie_id = r.movie_id
join tbl_customer c
on c.cust_id = r.cust_id;

select m.movie_id, m.movie_name, count(r.movie_id), to_char(sum(m.price), 'fm999,999,999'), round(count(r.movie_id) * 100 / sum(count(r.movie_id)) over (), 2)
from tbl_movie m
join tbl_reservation r
on m.movie_id = r.movie_id
group by m.movie_id, m.movie_name
order by 4 desc;

select r.res_id, c.cust_id, c.cust_name, m.movie_name, to_char(r.res_date, 'yyyy-mm-dd'), r.seat_no
from tbl_movie m
join tbl_reservation r
on m.movie_id = r.movie_id
join tbl_customer c
on c.cust_id = r.cust_id;

select distinct m.movie_id, m.movie_name  from tbl_movie m join tbl_reservation r on m.movie_id = r.movie_id;

