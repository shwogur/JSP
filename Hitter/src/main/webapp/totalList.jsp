<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select h.registration_code, p.name, substr(p.birth_day,1,4)||'년'||substr(p.birth_day,5,2)||'월'||substr(p.birth_day,7,8)||'일', p.height, p.weight, decode(substr(h.registration_code,1,1), 'A', '1군', 'B', '2군') ,case when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 90 then 'A' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 80 then 'B' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 70 then 'C' when ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 >= 60 then 'D' else 'F' end, rank() over (order by ((((hit_numbers + home_runs) / appearance ) * 100) + home_runs + (put_out + (double_play * 2) - (error_count * 5))) / 2 desc) "
			   + " from tbl_player_info p "
			   + " join tbl_hitter_info h "
			   + " on p.registration_code = h.registration_code";
	
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>전체 타자 성적 조회</h2>
		<table>
			<tr>
				<th>선수 등록 코드</th>
				<th>선수명</th>
				<th>생년월일</th>
				<th>키</th>
				<th>몸무게</th>
				<th>소속</th>
				<th>선수 등급</th>
				<th>순위</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="right"><%=rs.getString(5) %></td>
				<td align="right"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
				<td align="center"><%=rs.getString(8) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>