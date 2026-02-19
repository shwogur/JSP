create table tbl_player_info(
	registration_code char(4) primary key,
	name varchar2(18),
	birth_day varchar2(8),
	height number(3),
	weight number(3)
);

create table tbl_hitter_info(
	registration_code char(4) primary key,
	game_numbers number(3),
	appearance number(3),
	hit_numbers number(3),
	home_runs number(3),
	put_out number(3),
	double_play number(3),
	error_count number(3)
);

delete from tbl_player_info;
delete from tbl_hitter_info;

insert all
into tbl_player_info values('A001', '김길동', '19900101', 180, 82)
into tbl_player_info values('A005', '이길동', '20000101', 190, 85)
into tbl_player_info values('B002', '홍길동', '19950101', 175, 75)
into tbl_player_info values('B006', '조길동', '19950101', 185, 80)

into tbl_hitter_info values('A001', 120, 330, 100, 20, 80, 27, 1)
into tbl_hitter_info values('A005', 110, 300, 110, 30, 60, 5, 2)
into tbl_hitter_info values('B002', 100, 270, 90, 5, 100, 10, 3)
select * from dual;

select h.registration_code, p.name, h.game_numbers, h.appearance, h.hit_numbers, h.home_runs, round(((h.hit_numbers + h.home_runs) / h.appearance * 100) + h.home_runs, 2), h.put_out, h.double_play, h.error_count, (put_out + (h.double_play * 2) - (h.error_count * 5))
from tbl_player_info p
join tbl_hitter_info h
on p.registration_code = h.registration_code;

select h.registration_code, p.name, substr(p.birth_day,1,4)||'년'||substr(p.birth_day,5,2)||'월'||substr(p.birth_day,7,8)||'일', p.height, p.weight, decode(substr(h.registration_code,1,1), 'A', '1군', 'B', '2군'), case when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 90 then 'A' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 80 then 'B' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 70 then 'C' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 60 then 'D' else 'F' end, rank() over (order by ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 desc)
from tbl_player_info p
join tbl_hitter_info h
on p.registration_code = h.registration_code;

