<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%> 
<%
	String msg = "";

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String lecturer = request.getParameter("lecturer");
	String credit = request.getParameter("credit");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	
	String sql = "insert into course_tbl" +
				" values (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, credit);
	stmt.setString(4, lecturer);
	stmt.setString(5, week);
	stmt.setString(6, start_hour);
	stmt.setString(7, end_end);
	
	if(stmt.executeUpdate() > 0)
		msg = "교과목 등록이 완료되었습니다.";
	else
		msg = "오류가 발생했습니다.";
	
	session.setAttribute("msg", msg);
	response.sendRedirect("addLecture.jsp");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>