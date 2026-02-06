<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String animal_no = request.getParameter("animal_no");
	String protect_yn = request.getParameter("protect_yn");
	
	String sql = "update tbl_animal_001 set protect_yn = ? where animal_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, protect_yn);
	stmt.setString(2, animal_no);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("protectList.jsp");
	}
%>