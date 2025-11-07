<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	String pk_sale = request.getParameter("pk_sale");
	String deal_date = request.getParameter("deal_date");
	String store = request.getParameter("store");
	String name = request.getParameter("name");
	String deal_count = request.getParameter("deal_count");
	
	String sql = "insert into tbl_sale values(?,?,?,?,?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, pk_sale);
	stmt.setString(2, deal_date);
	stmt.setString(3, deal_count);
	stmt.setString(4, store);
	stmt.setString(5, name);
	if(stmt.executeUpdate() > 0)
		response.sendRedirect("index.jsp");
		
	stmt.close();
	con.close();
%>
