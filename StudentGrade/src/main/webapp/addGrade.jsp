<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String sql = "select id, korean, math, english, history from score_tbl";
	PreparedStatement stmt = conn.prepareStatement(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적등록</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>학생성적 등록</h1>
		<form name="form" action="action.jsp" method="post">
			<input type="hidden" name="action" value="addGrade" />
			<table>
				<tr>
					<td>학번</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history"></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="등록" />
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>