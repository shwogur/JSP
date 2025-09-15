<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>   
<%
	String sql = "select p.serial_no, a.artist_id, a.artist_name, to_char(to_Date(a.artist_birth), 'yyyy\"년\"mm\"월\"dd\"일\"'), p.point, case when p.point >= 90 then 'A' when p.point >= 80 then 'B' when p.point >= 70 then 'C' else 'D' end as 평점, p.mento_id "
			   + " from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p "
			   + " where a.artist_id = p.artist_id "
			   + " and m.mento_id = p.mento_id "
			   + " order by 1 asc";
	
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
		<h2>멘토점수조회</h2>
		<table>
			<tr>
				<th>채점번호</th>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>생년월일</th>
				<th>점수</th>
				<th>평점</th>
				<th>멘토</th>
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
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
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