<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String resv_id = request.getParameter("resv_id");
	String resv_time = request.getParameter("resv_time");
	
	String sql = "update tbl_reservation_001 set resv_time = ? where resv_id = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, resv_time);
	stmt.setString(2, resv_id);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("index.jsp");
	}
%>