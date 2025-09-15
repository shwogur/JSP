<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="db_connect.jsp"%>
<%
	String artist_id = request.getParameter("artist_id");
	String artist_name = request.getParameter("artist_name");
	String artist_gender = request.getParameter("artist_gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	String artist_birth_year = request.getParameter("artist_birth_year");
	String artist_birth_month = request.getParameter("artist_birth_month");
	String artist_birth_day = request.getParameter("artist_birth_day");
	
	if(artist_birth_month.length() == 1){
		artist_birth_month = "0" + artist_birth_month;
	}
	
	if(artist_birth_day.length() == 1){
		artist_birth_day = "0" + artist_birth_day;
	}
	
	String artist_birth = artist_birth_year+artist_birth_month+artist_birth_day;
	
	String sql = "insert into tbl_artist_201905 values(?,?,?,?,?,?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, artist_id);
	stmt.setString(2, artist_name);
	stmt.setString(3, artist_birth);
	stmt.setString(4, artist_gender);
	stmt.setString(5, talent);
	stmt.setString(6, agency);

	if(stmt.executeUpdate() > 0)
		response.sendRedirect("listCheck.jsp");
		
	stmt.close();
	con.close();
%>
