<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>  
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String lecturer = request.getParameter("lecturer");
	String credit = request.getParameter("credit");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	
	String sql = "", msg = "";
	
	sql = "update course_tbl " +
	     " set name = ?, lecturer = ?, credit = ?, week = ?, start_hour = ?, end_end = ? " +
	     " where id = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, name);
	stmt.setString(2, lecturer);
	stmt.setString(3, credit);
	stmt.setString(4, week);
	stmt.setString(5, start_hour);
	stmt.setString(6, end_end);
	stmt.setString(7, id);
	
	response.sendRedirect("index.jsp");
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