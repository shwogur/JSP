<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%!
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
%>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(
			"jdbc:oracle:thin:@//localhost:1521/xe", "jaehyuk", "1234");
	} catch (Exception e) {
		out.println("DB 연결 중 오류 발생: " + e.getMessage());
	}
%>
