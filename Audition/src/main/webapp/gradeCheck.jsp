<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>    
<%
	String sql = "select a.artist_id, a.artist_name, sum(p.point), round(avg(p.point), 2), rank() over(order by sum(p.point) desc) as 총점 "
			   + " from tbl_artist_201905 a, tbl_point_201905 p "
			   + " where a.artist_id = p.artist_id "
			   + " group by a.artist_id, a.artist_name "
			   + " order by 5";

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
		<h2>참가자목록조회</h2>
		<table>
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>총점</th>
				<th>평균</th>
				<th>등수</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
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