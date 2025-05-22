<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>    
<%
	String sql = "select idx, name from lecturer_tbl";

	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<style>
	 section h1{
	 	margin-left: 830px;
	 }
</style>
</head>
<body>
	<header>
		<h1>수강신청 도우미 사이트</h1>
	</header>
	<section>
		<h1>교과목 추가</h1>
		<form name="form" action="./action.jsp" method="post">
		<input type="hidden" name="action" value="insert"/>
			<table>
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td><select name="lecturer">
						<%
							while(rs.next()){
						%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
						<%
							}
						%>
					</select></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="credit"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td><input type="radio" name="week" value="1">월
						<input type="radio" name="week" value="2">화
						<input type="radio" name="week" value="3">수
						<input type="radio" name="week" value="4">목
						<input type="radio" name="week" value="5">금
						<input type="radio" name="week" value="6">토
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end"></td>
				</tr>
			</table>
				<button type="button" onclick="location.href='./index.jsp'">목록</button>
				<button type="submit" name="완료">완료</button>
		</form>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>