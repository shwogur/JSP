<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale_no = request.getParameter("sale_no");
	String cust_no = request.getParameter("cust_no");
	String p_code = request.getParameter("p_code");
	String amount = request.getParameter("amount");
	String sale_date = request.getParameter("sale_date");
	
	String sql = "update tbl_order_01 set cust_no = ?, p_code = ?, amount = ?, sale_date = ? where sale_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, cust_no);
	stmt.setString(2, p_code);
	stmt.setString(3, amount);
	stmt.setString(4, sale_date);
	stmt.setString(5, sale_no);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("salesList.jsp");
	}
%>