<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale_no = request.getParameter("sale_no");
	
	String sql = "delete from tbl_order_01 where sale_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, sale_no);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("salesList.jsp");
	}
%>