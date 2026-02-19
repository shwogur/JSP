<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String registration_code = request.getParameter("registration_code");
	String game_numbers = request.getParameter("game_numbers");
	String appearance = request.getParameter("appearance");
	String hit_numbers = request.getParameter("hit_numbers");
	String home_runs = request.getParameter("home_runs");
	String put_out = request.getParameter("put_out");
	String double_play = request.getParameter("double_play");
	String error_count = request.getParameter("error_count");
	
	String sql = "insert into tbl_hitter_info values(?,?,?,?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, registration_code);
	stmt.setString(2, game_numbers);
	stmt.setString(3, appearance);
	stmt.setString(4, hit_numbers);
	stmt.setString(5, home_runs);
	stmt.setString(6, put_out);
	stmt.setString(7, double_play);
	stmt.setString(8, error_count);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>