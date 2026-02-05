create table tbl_member_01(
	cust_no char(5) primary key,
	cust_name varchar2(20),
	phone varchar2(13),
	address varchar2(50),
	join_date date
);

create table tbl_menu_01(
	p_code char(4) primary key,
	p_name varchar2(30),
	p_price number(8),
	p_type varchar2(20)
);

create table tbl_order_01(
	sale_no char(6) primary key,
	cust_no char(5) references tbl_member_01(cust_no) not null,
	p_code char(4) references tbl_menu_01(p_code) not null,
	amount number(3),
	sale_date date
);

drop table tbl_member_01;
drop table tbl_menu_01;
drop table tbl_order_01;

insert all
into tbl_member_01 values('20001', '홍길동', '010-1234-5678', '서울시 동대문구', '2023-01-01')
into tbl_member_01 values('20002', '이순신', '010-9876-5432', '서울시 서대문구', '2023-02-15')
into tbl_member_01 values('20003', '강감찬', '010-1111-2222', '경기도 안양시', '2023-03-20')
into tbl_member_01 values('20004', '유관순', '010-3333-4444', '충청남도 천안시', '2023-04-10')
into tbl_member_01 values('20005', '장보고', '010-5555-6666', '전라남도 완도군', '2023-05-05')

into tbl_menu_01 values('G001', '티타늄 안경테', '120000', '안경테')
into tbl_menu_01 values('G002', '뿔테 안경', '50000', '안경테')
into tbl_menu_01 values('L001', '블루라이트 렌즈', '40000', '렌즈')
into tbl_menu_01 values('L002', '압축 렌즈', '30000', '렌즈')
into tbl_menu_01 values('S001', '스포츠 선글라스', '150000', '선글라스')

into tbl_order_01 values('202401', '20001', 'G001', 1, '2024-03-01')
into tbl_order_01 values('202402', '20001', 'L001', 1, '2024-03-01')
into tbl_order_01 values('202403', '20002', 'G002', 2, '2024-03-02')
into tbl_order_01 values('202404', '20003', 'S001', 1, '2024-03-03')
into tbl_order_01 values('202405', '20004', 'L002', 2, '2024-03-04')
into tbl_order_01 values('202406', '20005', 'G001', 1, '2024-03-05')
select * from dual;

select o.sale_no, mem.cust_name, men.p_name, men.p_price, o.amount, to_char(men.p_price *  o.amount, 'fm999,999,999'), to_char(o.sale_date, 'yyyy-mm-dd')
from tbl_member_01 mem
join tbl_order_01 o
on mem.cust_no = o.cust_no
join tbl_menu_01 men
on men.p_code = o.p_code;

select sale_no, cust_no, p_code, amount, to_char(sale_date, 'yyyymmdd') from tbl_order_01;

select rank() over (order by to_char(men.p_price *  o.amount, 'fm999,999,999') asc), men.p_code, men.p_name, o.amount, to_char(men.p_price *  o.amount, 'fm999,999,999')
from tbl_menu_01 men
join tbl_order_01 o
on men.p_code = o.p_code;
