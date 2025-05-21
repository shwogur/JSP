<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String sql = "select id, name, substr(id, 1, 1), substr(id, 2, 2), substr(id, 4, 2), gender from member_tbl";

	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>학생성적 관리 프로그램</h1>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
			</tr>
			<%
			while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>