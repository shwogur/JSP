<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<% 
	String ship_no = request.getParameter("ship_no");
	String ship_st = request.getParameter("ship_st");
	
	String sql = "update tbl_delivery_001 set ship_st = ? where ship_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, ship_st);
	stmt.setString(2, ship_no);
	
	stmt.executeUpdate();
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	
	stmt.close();
	con.close();
%>