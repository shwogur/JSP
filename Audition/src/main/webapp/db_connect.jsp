<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<hr>
	<%
	request.setCharacterEncoding("UTF-8");
	
	/* 자바 DB 연동 프로그램 */
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "jaehyuk", "1234");
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	%>
</body>
</html>