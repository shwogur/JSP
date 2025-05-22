<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String sql = "select id, c.name, credit, l.name, " +
				" decode(week, 1, '월', 2, '화', 3, '수', 4, '목', 5, '금', 6, '토'), " +
				" start_hour, end_end " +
				" from course_tbl c, lecturer_tbl l " +
				" where c.lecturer = l.idx " +
				" order by id asc";

	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 조회 프로그램</title>
<link rel="stylesheet" href="css/style.css">
<style>
	table{
	width: 800px;
	}
</style>
</head>
<body>
	<header>
		<h1>수강신청 도우미 사이트</h1>
	</header>
	<section>
		<h1>총 10개의 교과목이 있습니다</h1>
		<table border="1">
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>관리</td>
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
				<td><a href="updateLecture.jsp?id=<%=rs.getString(1) %>">수정</a> / <a href="action3.jsp?id=<%=rs.getString(1) %>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<button onclick="location.href='addLecture.jsp'">작성</button>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>