 create table tbl_pizza_01(
 	pcode char(4) primary key,
 	pname varchar2(30),
 	cost number(7)
 );
 
 create table tbl_shop_01(
 	scode char(4) primary key,
 	sname varchar2(20)
 );
 
 create table tbl_saleList_01(
 	saleno number(7) primary key,
 	scode char(4) references tbl_shop_01(scode) not null,
 	saledate date,
 	pcode char(4) references tbl_pizza_01(pcode) not null,
 	amount number(5)
 );
 
 delete from tbl_pizza_01;
 delete from tbl_shop_01;
 delete from tbl_saleList_01;
 
 insert all
 into tbl_pizza_01 values('AA01', '고르곤졸라피자', 6000)
 into tbl_pizza_01 values('AA02', '치즈피자', 6500)
 into tbl_pizza_01 values('AA03', '페퍼로니피자', 7000)
 into tbl_pizza_01 values('AA04', '콤비네이션피자', 7500)
 into tbl_pizza_01 values('AA05', '고구마피자', 6000)
 into tbl_pizza_01 values('AA06', '포테이토피자', 7000)
 into tbl_pizza_01 values('AA07', '불고기피자', 8000)
 into tbl_pizza_01 values('AA08', '나폴리피자', 8000)
 
 into tbl_shop_01 values('S001', '강남점')
 into tbl_shop_01 values('S002', '강서점')
 into tbl_shop_01 values('S003', '강동점')
 into tbl_shop_01 values('S004', '영동점')
 into tbl_shop_01 values('S005', '시청점')
 into tbl_shop_01 values('S006', '인천점')
 
 into tbl_saleList_01 values(100001, 'S001', '2018-12-02', 'AA01', 50)
 into tbl_saleList_01 values(100002, 'S001', '2018-12-02', 'AA02', 30)
 into tbl_saleList_01 values(100003, 'S001', '2018-12-02', 'AA03', 20)
 into tbl_saleList_01 values(100004, 'S001', '2018-12-02', 'AA04', 50)
 into tbl_saleList_01 values(100005, 'S003', '2018-12-03', 'AA01', 40)
 into tbl_saleList_01 values(100006, 'S003', '2018-12-03', 'AA02', 60)
 into tbl_saleList_01 values(100007, 'S003', '2018-12-03', 'AA04', 60)
 into tbl_saleList_01 values(100008, 'S003', '2018-12-04', 'AA05', 70)
 into tbl_saleList_01 values(100009, 'S005', '2018-12-02', 'AA01', 80)
 into tbl_saleList_01 values(100010, 'S005', '2018-12-02', 'AA03', 30)
 into tbl_saleList_01 values(100011, 'S005', '2018-12-02', 'AA04', 40)
 into tbl_saleList_01 values(100012, 'S005', '2018-12-02', 'AA05', 50)
 into tbl_saleList_01 values(100013, 'S004', '2018-12-04', 'AA01', 30)
 into tbl_saleList_01 values(100014, 'S004', '2018-12-04', 'AA02', 20)
 into tbl_saleList_01 values(100015, 'S004', '2018-12-04', 'AA06', 50)
 select * from dual;
 
select saleno, sa.scode||'-'||sh.sname, saledate, sa.pcode, p.pname, amount, '\'||to_char(sum(p.cost * sa.amount), 'fm999,999,999')
from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode
group by saleno, sa.scode||'-'||sh.sname, saledate, sa.pcode, p.pname, amount order by 1;
 
select sa.scode, sname, '\'||to_char(sum(cost * amount), 'fm999,999,999') from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode group by sa.scode, sname order by 1;

select sa.pcode, pname, '\'||to_char(sum(cost * amount), 'fm999,999,999') from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode group by sa.pcode, pname order by sum(cost * amount) desc;
