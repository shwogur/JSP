create table tbl_movie_01(
	movie_no varchar2(6) primary key,
	movie_name varchar2(30) not null,
	open_dt date,
	genre varchar2(15),
	show_yn char(1)
);

insert all
into tbl_movie_01 values('M00001', '인터스텔라', '20141107', 'SF', '0')
into tbl_movie_01 values('M00002', '명량', '20140730', '약사', '0')
into tbl_movie_01 values('M00003', '극한직업', '20190123', '코미디', '1')
into tbl_movie_01 values('M00004', '기생충', '20190530', '코미디', '1')
select * from dual;

select 'M'||to_char(max(substr(movie_no,2,5)+1), 'fm00000') from TBL_MOVIE_01;

select movie_no, movie_name, to_char(open_dt, 'yyyy-mm-dd'), genre, case when show_yn = '0' then '상영완료' when show_yn = '1' then '상영중' end from tbl_movie_01;

select movie_no, movie_name, show_yn from tbl_movie_01 where movie_no = ?;