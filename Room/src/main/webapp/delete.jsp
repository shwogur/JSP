<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String resv_id = request.getParameter("resv_id");
	
	String sql = "delete from tbl_reservation_001 where resv_id = ? ";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, resv_id);
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("index.jsp");
	}
%>