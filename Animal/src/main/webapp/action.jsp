<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String animal_no = request.getParameter("animal_no");
	String animal_name = request.getParameter("animal_name");
	String rescue_dt = request.getParameter("rescue_dt").replaceAll("-", "");
	String kind = request.getParameter("kind");
	String protect_yn = request.getParameter("protect_yn");
	String shelter_no = request.getParameter("shelter_no");
	
	String sql = "insert into tbl_animal_001 values(?,?,?,?,0,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, animal_no);
	stmt.setString(2, animal_name);
	stmt.setString(3, rescue_dt);
	stmt.setString(4, kind);
	stmt.setString(5, shelter_no);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>