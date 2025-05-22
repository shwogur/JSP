<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>   
<%
	String id= request.getParameter("id");
	
	String sql = "select * from course_tbl where id = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, id);
	
	
	String sql2 = "select idx, name from lecturer_tbl";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	
	ResultSet rs = stmt.executeQuery();
	ResultSet rs2 = stmt2.executeQuery();
	
	rs.next();	
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
		<h1>교과목 수정</h1>
		<form name="form" action="./action2.jsp" method="post">
		<input type="hidden" name="action2" value="update"/>
			<table>
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" name="id" value="<%=rs.getString("id") %>" /></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td><select name="lecturer">
					<%
						while(rs2.next()){
							if(rs.getString(4).equals(rs2.getString(1))){
					%>
						<option value="<%=rs.getString(1) %>" selected><%=rs2.getString(2) %></option>
					<%
						}else{
					%>
						<option value="<%=rs.getString(1) %>"><%=rs2.getString(2) %></option>
					<%
						}
					}
					%>
					</select></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="credit" value="<%=rs.getString("credit") %>"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
						<%if(rs.getString(5).equals("1")){
						%>
						<input type="radio" name="week" checked>월
						<input type="radio" name="week">화
						<input type="radio" name="week">수
						<input type="radio" name="week">목
						<input type="radio" name="week">금
						<input type="radio" name="week">토
						<%
						} else if(rs.getString(5).equals("2")){
						%>
						<input type="radio" name="week">월
						<input type="radio" name="week" checked>화
						<input type="radio" name="week">수
						<input type="radio" name="week">목
						<input type="radio" name="week">금
						<input type="radio" name="week">토
						<%
						} else if(rs.getString(5).equals("3")){
						%>
						<input type="radio" name="week">월
						<input type="radio" name="week">화
						<input type="radio" name="week" checked>수
						<input type="radio" name="week">목
						<input type="radio" name="week">금
						<input type="radio" name="week">토
						<%
						} else if(rs.getString(5).equals("4")){
						%>
						<input type="radio" name="week">월
						<input type="radio" name="week">화
						<input type="radio" name="week">수
						<input type="radio" name="week" checked>목
						<input type="radio" name="week">금
						<input type="radio" name="week">토
						<%
						} else if(rs.getString(5).equals("5")){
						%>
						<input type="radio" name="week">월
						<input type="radio" name="week">화
						<input type="radio" name="week">수
						<input type="radio" name="week">목
						<input type="radio" name="week" checked>금
						<input type="radio" name="week">토
						<%
						} else if(rs.getString(5).equals("6")){
						%>
						<input type="radio" name="week">월
						<input type="radio" name="week">화
						<input type="radio" name="week">수
						<input type="radio" name="week">목
						<input type="radio" name="week">금
						<input type="radio" name="week" checked>토
						<%
						}
						%>
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour" value="<%=rs.getString("start_hour") %>"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end" value="<%=rs.getString("end_end") %>"></td>
				</tr>
			</table>
				<button type="button" onclick="location.href='./index.jsp'">목록</button>
				<button type="submit" name="완료">완료</button>
		</form>
	</section>
</body>
</html>