<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String delivery_id = request.getParameter("delivery_id");
	String base_fee = request.getParameter("base_fee");
	String single_yn = request.getParameter("single_yn");
	
	String sql = "update tbl_delivery_001 set base_fee = ?, single_yn = ? where delivery_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, base_fee);
	stmt.setString(2, single_yn);
	stmt.setString(3, delivery_id);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("totalList.jsp");
	}
%>