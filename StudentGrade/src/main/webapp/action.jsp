<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String id = request.getParameter("id");
	String korean = request.getParameter("korean");
	String math = request.getParameter("math");
	String english = request.getParameter("english");
	String history = request.getParameter("history");
	
	String sql = "insert into score_tbl values (?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, id);
	stmt.setString(2, korean);
	stmt.setString(3, math);
	stmt.setString(4, english);
	stmt.setString(5, history);
	
	String msg = "";
	
	if(stmt.executeUpdate() > 0)
		msg = "등록 완료";
	else
		msg = "오류 발생";
	
	session.setAttribute("msg", msg);
	response.sendRedirect("addGrade.jsp");
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