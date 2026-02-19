create table tbl_cafe_001(
	cafe_id number primary key,
	cafe_name varchar2(30) not null,
	manager varchar2(20)
);

create table tbl_drink_001(
	drink_id number primary key,
	drink_name varchar2(30) not null,
	price number
);

create table tbl_sale_001(
	sale number primary key,
	cafe_id number references tbl_cafe_001(cafe_id) not null,
	drink_id number references tbl_drink_001(drink_id) not null,
	sale_date date,
	quantity number
);

insert all
into tbl_cafe_001 values(1, '강남카페', '김재원')
into tbl_cafe_001 values(2, '신촌카페', '이민수')

into tbl_drink_001 values(101, '아메리카노', 4500)
into tbl_drink_001 values(102, '카페라떼', 5000)
into tbl_drink_001 values(103, '바닐라라떼', 5500)

into tbl_sale_001 values(1, 1, 101, '2023-08-01', 10)
into tbl_sale_001 values(2, 1, 102, '2023-08-01', 5)
into tbl_sale_001 values(3, 2, 101, '2023-08-02', 7)
into tbl_sale_001 values(4, 2, 103, '2023-08-02', 4)
select * from dual;

select max(sale) +1 from tbl_sale_001;

select cafe_id, cafe_name from tbl_cafe_001;

select drink_id, drink_name from tbl_drink_001;

select s.sale, c.cafe_name, d.drink_name, d.price, s.quantity, sum(d.price * s.quantity)
from tbl_cafe_001 c
join tbl_sale_001 s
on c.cafe_id = s.cafe_id
join tbl_drink_001 d
on d.drink_id = s.drink_id
group by s.sale, c.cafe_name, d.drink_name, d.price, s.quantity;

select c.cafe_name, d.drink_name, s.quantity from tbl_cafe_001 c join tbl_sale_001 s on c.cafe_id = s.cafe_id join tbl_drink_001 d on d.drink_id = s.drink_id;

select d.drink_name, sum(d.price * s.quantity)
from tbl_cafe_001 c
join tbl_sale_001 s
on c.cafe_id = s.cafe_id
join tbl_drink_001 d
on d.drink_id = s.drink_id
group by d.drink_name
having sum(d.price * s.quantity) > avg(d.price * s.quantity);

