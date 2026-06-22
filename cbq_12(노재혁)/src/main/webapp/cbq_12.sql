create table tbl_company_info(
	company_code char(5) primary key,
	company_name varchar2(21),
	category varchar2(15),
	foundation_day char(8)
);

create table tbl_esg_info(
	item_code char(1) primary key,
	item_name varchar2(30)
);

create table tbl_esg_evaluation(
	company_code char(5),
	item_code char(1),
	item_1 number(3),
	item_2 number(3),
	item_3 number(3),
	item_4 number(3),
	item_5 number(3),
	primary key(company_code, item_code)
);

delete from tbl_company_info;
delete from tbl_esg_info;
delete from tbl_esg_evaluation;

insert all
into tbl_company_info values('A0001', '해피전자', '전기전자', '20000101')
into tbl_company_info values('B0001', '한국코퍼레이션', '종합도매업', '20000102')
into tbl_company_info values('C0001', '오이마켓', '소프트웨어', '20000103')
into tbl_company_info values('D0001', 'XYZ엔터', '미디어', '20000104')

into tbl_esg_info values('E', '친환경 경영 평가')
into tbl_esg_info values('S', '사회적 책임 평가')
into tbl_esg_info values('G', '투명한 지배구조 평가')

into tbl_esg_evaluation values('A0001', 'E', 83, 88, 94, 88, 95)
into tbl_esg_evaluation values('A0001', 'S', 81, 99, 90, 85, 99)
into tbl_esg_evaluation values('A0001', 'G', 88, 84, 91, 93, 97)
into tbl_esg_evaluation values('B0001', 'E', 91, 80, 77, 98, 82)
into tbl_esg_evaluation values('B0001', 'S', 98, 80, 82, 87, 75)
into tbl_esg_evaluation values('B0001', 'G', 82, 84, 80, 99, 83)
into tbl_esg_evaluation values('C0001', 'E', 88, 80, 90, 77, 70)
into tbl_esg_evaluation values('C0001', 'S', 94, 84, 81, 86, 77)
into tbl_esg_evaluation values('C0001', 'G', 79, 87, 84, 79, 77)
select * from dual;

select item_code, '['||item_code||']'||item_name from tbl_esg_info;

select ev.company_code, company_name, decode(substr(co.company_code,1,1), 'A', '대기업', 'B', '중견기업', 'C', '중소기업', 'D', '벤처기업'), item_name, item_1, item_2, item_3, item_4, item_5, to_char(round(sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5, 2), 'fm99.90'), case when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 90 then 'A' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 80 then 'B' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 70 then 'C' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 60 then 'D' else 'F' end
from tbl_company_info co join tbl_esg_evaluation ev on co.company_code = ev.company_code join tbl_esg_info es on es.item_code = ev.item_code 
group by ev.company_code, company_name, decode(substr(co.company_code,1,1), 'A', '대기업', 'B', '중견기업', 'C', '중소기업', 'D', '벤처기업'), item_name, item_1, item_2, item_3, item_4, item_5
order by sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5;

select distinct ev.company_code, company_name, category, substr(foundation_day,1,4)||'년'||substr(foundation_day,5,2)||'월'||substr(foundation_day,7,2)||'일', sum(item_1 + item_2 + item_3 + item_4 + item_5), to_char(sum(item_1 + item_2 + item_3 + item_4 + item_5) / 15, 'fm999.90'), rank() over(order by sum(item_1 + item_2 + item_3 + item_4 + item_5) desc) 
from tbl_company_info co join tbl_esg_evaluation ev on co.company_code = ev.company_code join tbl_esg_info es on es.item_code = ev.item_code
group by ev.company_code, company_name, category, substr(foundation_day,1,4)||'년'||substr(foundation_day,5,2)||'월'||substr(foundation_day,7,2)||'일';

