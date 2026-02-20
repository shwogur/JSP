<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String delivery_id = request.getParameter("delivery_id");
	
	String sql = "delete from tbl_delivery_001 where delivery_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, delivery_id);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("totalList.jsp");
	}
%>