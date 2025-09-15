<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	String saleno = request.getParameter("saleno");
	String scode = request.getParameter("scode");
	String saledate = request.getParameter("saledate");
	String pcode = request.getParameter("pcode");
	String amount = request.getParameter("amount");
	
	String sql = "insert into tbl_salelist_01 values(?,?,?,?,?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, saleno);
	stmt.setString(2, scode);
	stmt.setString(3, saledate);
	stmt.setString(4, pcode);
	stmt.setString(5, amount);

	if(stmt.executeUpdate() > 0)
		response.sendRedirect("salesCheck.jsp");
		
	stmt.close();
	con.close();
%>
