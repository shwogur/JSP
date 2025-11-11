<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	String regist_num = request.getParameter("regist_num");
	String name = request.getParameter("name");
	String university_code = request.getParameter("university_code");
	String major_code = request.getParameter("major_code");
	String s_score = request.getParameter("s_score");
	String n_score = request.getParameter("n_score");
	
	int s = Integer.parseInt(s_score);
	int n = Integer.parseInt(n_score);
	int total_score = s + n;
	
	String sql = "insert into tbl_apply values(?,?,?,?,?,?,?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, regist_num);
	stmt.setString(2, university_code);
	stmt.setString(3, major_code);
	stmt.setString(4, name);
	stmt.setInt(5, s);
	stmt.setInt(6, n);
	stmt.setInt(7, total_score);
	
	if(stmt.executeUpdate() > 0)
		response.sendRedirect("index.jsp");
		
	stmt.close();
	con.close();
%>
