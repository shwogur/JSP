<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String sql = "select m.id, m.name, substr(m.id, 1, 1), substr(m.id, 2, 2), substr(m.id, 4, 2), m.gender, s.korean, s.math, s.english, s.history, " +
				" (korean + math + english + history), " +
		        " (korean + math + english + history) / 4," +
				" rank() over(order by (korean + math + english + history) asc) " + 
 	            " from member_tbl m join score_tbl s on m.id = s.id ";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적조회</title>
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
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
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
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=rs.getString(13)%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>