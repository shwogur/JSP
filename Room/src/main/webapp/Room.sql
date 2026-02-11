create table tbl_user_001(
	user_id varchar2(10) primary key,
	user_name varchar2(20) not null,
	phone varchar2(20)
);

create table tbl_equipment_001(
	equip_id varchar2(10) primary key,
	equip_name varchar2(30) not null,
	location varchar2(30)
);

create table tbl_reservation_001(
	resv_id varchar2(10) primary key,
	equip_id varchar2(10) references tbl_equipment_001(equip_id) not null,
	user_id varchar2(10) references tbl_user_001(user_id) not null,
	resv_time date
);

delete from tbl_user_001;
delete from tbl_equipment_001;
delete from tbl_reservation_001;

insert all
into tbl_user_001 values('U001', '홍길동', '010-1111-1111')
into tbl_user_001 values('U002', '김민지', '010-2222-2222')
into tbl_user_001 values('U003', '이수진', '010-3333-3333')
into tbl_user_001 values('U004', '박준호', '010-4444-4444')

into tbl_equipment_001 values('E001', '3D프린터', '1층 제작실')
into tbl_equipment_001 values('E002', '레이저커터', '2층 가공실')
into tbl_equipment_001 values('E003', 'CNC밀링기', '3층 금속실')

into tbl_reservation_001 values('R001', 'E001', 'U001', to_date('2026-01-10 10:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R002', 'E001', 'U002', to_date('2026-01-11 14:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R003', 'E001', 'U003', to_date('2026-01-12 09:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R004', 'E001', 'U004', to_date('2026-01-12 13:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R005', 'E002', 'U001', to_date('2026-01-13 10:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R006', 'E002', 'U002', to_date('2026-01-14 15:00', 'yyyy-mm-dd HH24:MI:SS'))
into tbl_reservation_001 values('R007', 'E003', 'U003', to_date('2026-01-15 11:00', 'yyyy-mm-dd HH24:MI:SS'))
select * from dual;

delete from tbl_reservation_001 where resv_id = 'R008';


select equip_id, equip_name from tbl_equipment_001;

select user_id, user_name from tbl_user_001;

select 'R'||to_char(max(substr(resv_id,2,3)+1), 'fm000') from tbl_reservation_001;

select e.equip_name, e.location, count(r.equip_id)||'건'
from tbl_equipment_001 e
join tbl_reservation_001 r
on e.equip_id = r.equip_id
group by e.equip_name, e.location
order by 1;

select location from tbl_equipment_001

select r.resv_id, u.user_name, r.resv_time
from tbl_user_001 u
join tbl_reservation_001 r
on u.user_id = r.user_id
join tbl_equipment_001 e
on e.equip_id = r.equip_id;

select r.resv_id, e.equip_name, u.user_name, r.resv_time
from tbl_user_001 u
join tbl_reservation_001 r
on u.user_id = r.user_id
join tbl_equipment_001 e
on e.equip_id = r.equip_id;
