<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String resv_id = request.getParameter("resv_id");
	String equip_id = request.getParameter("equip_id");
	String user_id = request.getParameter("user_id");
	String resv_time = request.getParameter("resv_time");
	
	String sql = "insert into tbl_reservation_001 values(?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, resv_id);
	stmt.setString(2, equip_id);
	stmt.setString(3, user_id);
	stmt.setString(4, resv_time);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>