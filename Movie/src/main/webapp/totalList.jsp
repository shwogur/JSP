<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select m.movie_id, m.movie_name, count(r.movie_id), to_char(sum(m.price), 'fm999,999,999'), round(count(r.movie_id) * 100 / sum(count(r.movie_id)) over (), 2) "
			   + " from tbl_movie m "
			   + " join tbl_reservation r "
			   + " on m.movie_id = r.movie_id "
			   + " group by m.movie_id, m.movie_name "
			   + " order by 4 desc";

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
			<h2>영화별 매출 통계</h2>
			<table>
				<tr>
					<th>영화코드</th>
					<th>영화제목</th>
					<th>총 예매 건수</th>
					<th>총 매출액</th>
					<th>예매율</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<td align="center"><%=rs.getString(1) %></td>
					<td align="center"><%=rs.getString(2) %></td>
					<td align="center"><%=rs.getString(3) %></td>
					<td align="center"><%=rs.getString(4) %></td>
					<td align="center"><%=rs.getString(5) %>%</td>
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