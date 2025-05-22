<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>  
<%
	String id = request.getParameter("id");
	String sql = "", msg = "";
	
	sql = "delete course_tbl where id = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, id);
	
	if(stmt.executeUpdate() > 0)
		msg = "삭제가 완료되었습니다.";
	else
		msg = "삭제 오류";
	
	session.setAttribute("msg", msg);
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