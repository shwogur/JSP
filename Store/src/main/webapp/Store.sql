create table tbl_product(
	product_id varchar2(10) primary key,
	product_name varchar2(50),
	category varchar2(30),
	price number,
	stock_qty number
);

create table tbl_worker(
	worker_id varchar2(10) primary key,
	worker_name varchar2(30),
	position varchar2(20),
	hourly_wage number
);

create table tbl_sales(
	sale_id varchar2(10) primary key,
	product_id varchar2(10) references tbl_product(product_id),
	worker_id varchar2(10) references tbl_worker(worker_id),
	sales_date date,
	sale_qty number
);

drop table tbl_product;
drop table tbl_worker;
drop table tbl_sales;

insert all
into tbl_product values('P001', '삼각김밥', '식품', 1500, 100)
into tbl_product values('P002', '컵라면', '식품', 1200, 80)
into tbl_product values('P003', '콜라', '음료', 1800, 60)

into tbl_worker values('W001', '김철수', '캐셔', 10000)
into tbl_worker values('W002', '이영희', '진열', 9800)

into tbl_sales values('S001', 'P001', 'W001', '2023-06-01', 5)
into tbl_sales values('S002', 'P002', 'W002', '2023-06-01', 3)
into tbl_sales values('S003', 'P003', 'W001', '2023-06-02', 4)
select * from dual;

select product_name, category, stock_qty||'개' from tbl_product;

select to_char(s.sales_date, 'YYYY"년 "MM"월 "DD"일'), p.product_name, s.sale_qty||'개', to_char(p.price, 'fm999,999,999')||'원', to_char(s.sale_qty*p.price, 'fm999,999,999')||'원' from tbl_product p, tbl_sales s where p.product_id = s.product_id order by 1 asc;

select w.worker_name, sum(s.sale_qty)||'개', to_char(sum(s.sale_qty*p.price), 'fm999,999,999')||'원'
from tbl_product p, tbl_worker w, tbl_sales s
where p.product_id = s.product_id
and w.worker_id = s.worker_id
group by w.worker_name
order by 3 asc;
