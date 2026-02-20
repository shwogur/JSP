<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String delivery_id = request.getParameter("delivery_id");
	String rider_id = request.getParameter("rider_id");
	String store_id = request.getParameter("store_id");
	String base_fee = request.getParameter("base_fee");
	String single_yn = request.getParameter("single_yn");
	String delivery_date = request.getParameter("delivery_date");
	
	String sql = "insert into tbl_delivery_001 values(?,?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, delivery_id);
	stmt.setString(2, rider_id);
	stmt.setString(3, store_id);
	stmt.setString(4, base_fee);
	stmt.setString(5, single_yn);
	stmt.setString(6, delivery_date);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>