<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale_no = request.getParameter("sale_no");
	String cust_no = request.getParameter("cust_no");
	String p_code = request.getParameter("p_code");
	String amount = request.getParameter("amount");
	String sale_date = request.getParameter("sale_date");
	
	String sql = "insert into tbl_order_01 values(?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, sale_no);
	stmt.setString(2, cust_no);
	stmt.setString(3, p_code);
	stmt.setString(4, amount);
	stmt.setString(5, sale_date);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("salesList.jsp");
	}
%>