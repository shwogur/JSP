<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale = request.getParameter("sale");
	String quantity = request.getParameter("quantity");
	
	String sql = "update tbl_sale_001 set quantity = ? where sale = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, quantity);
	stmt.setString(2, sale);
	
	int result = stmt.executeUpdate();
	if(result > 0){
		response.sendRedirect("index.jsp");
	}
%>