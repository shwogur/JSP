<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select * from tbl_member1 order by 1";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>회원현황</h2>
		<table>
			<tr>
				<th>회원코드</th>
				<th>회원명</th>
				<th>등급</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="right"><%=rs.getString(3) %></td>
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