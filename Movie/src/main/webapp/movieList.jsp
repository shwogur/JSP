<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select movie_no, movie_name, to_char(open_dt, 'yyyy-mm-dd'), genre, case when show_yn = '0' then '상영완료' when show_yn = '1' then '상영중' end from tbl_movie_01";

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
		<h2>상영현황</h2>
		<table>
			<tr>
				<th>영화번호</th>
				<th>영화명</th>
				<th>개봉일</th>
				<th>장르</th>
				<th>상영여부</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td align="center"><a href="movieUpdate.jsp?movie_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>