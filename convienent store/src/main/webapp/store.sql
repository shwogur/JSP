drop table goods_tbl_003
drop table store_tbl_003
drop table sale_tbl_003

create table goods_tbl_003(
	goods_cd varchar2(6) primary key,
	goods_nm varchar2(30),
	goods_price number(8),
	cost number(8),
	in_date date
);

create table store_tbl_003(
	store_cd varchar2(5) primary key,
	store_nm varchar2(20),
	store_fg varchar2(1) check (store_fg in ('0', '1'))
);

create table sale_tbl_003(
	sale_no varchar2(4) primary key,
	sale_ymd date not null,
	sale_fg varchar2(1) not null,
	store_cd varchar2(5) references store_tbl_003 (store_cd),
	goods_cd varchar2(6) references goods_tbl_003 (goods_cd),
	sale_cnt number(3),
	pay_type varchar2(2) check (pay_type in ('01', '02'))
);

insert into goods_tbl_003
values('110001', '라면', 1050, 750, '20190302');
insert into goods_tbl_003
values('110002', '빵', 1300, 800, '20190302');
insert into goods_tbl_003
values('110003', '과자', 2000, 1700, '20190302');
insert into goods_tbl_003
values('110004', '탄산음료', 900, 750, '20190302');
insert into goods_tbl_003
values('110005', '삼각김밥', 750, 300, '20190302');
insert into goods_tbl_003
values('110006', '초콜릿', 1500, 1300, '20190302');
insert into goods_tbl_003
values('110007', '우유', 850, 600, '20190302');

insert into store_tbl_003
values('A001', '이태원점', '0');
insert into store_tbl_003
values('A002', '한남점', '0');
insert into store_tbl_003
values('A003', '도원점', '0');
insert into store_tbl_003
values('B001', '혜화점', '1');
insert into store_tbl_003
values('C001', '방배점', '1');
insert into store_tbl_003
values('D001', '사당점', '0');
insert into store_tbl_003
values('D002', '흑석점', '1');
insert into store_tbl_003
values('E001', '금호점', '0');

insert into sale_tbl_003
values('0001', '20190325', '1', 'A001', '110001', 2, '02');
insert into sale_tbl_003
values('0002', '20190325', '1', 'B001', '110003', 2, '02');
insert into sale_tbl_003
values('0003', '20190325', '1', 'D001', '110003', 1, '01');
insert into sale_tbl_003
values('0004', '20190325', '1', 'A001', '110006', 5, '02');
insert into sale_tbl_003
values('0005', '20190325', '1', 'C001', '110003', 2, '02');
insert into sale_tbl_003
values('0006', '20190325', '2', 'C001', '110003', 2, '02');
insert into sale_tbl_003
values('0007', '20190325', '1', 'A002', '110005', 4, '02');
insert into sale_tbl_003
values('0008', '20190325', '1', 'A003', '110004', 4, '02');
insert into sale_tbl_003
values('0009', '20190325', '1', 'B001', '110001', 2, '01');
insert into sale_tbl_003
values('0010', '20190325', '1', 'A002', '110006', 1, '02');

select * from dual;

create sequence sale_sq 
start with 11;

create sequence goods_sq
start with 110008;

