<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale = request.getParameter("sale");
	String cafe_id = request.getParameter("cafe_id");
	String drink_id = request.getParameter("drink_id");
	String sale_date = request.getParameter("sale_date");
	String quantity = request.getParameter("quantity");
	
	String sql = "insert into tbl_sale_001 values(?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, sale);
	stmt.setString(2, cafe_id);
	stmt.setString(3, drink_id);
	stmt.setString(4, sale_date);
	stmt.setString(5, quantity);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>