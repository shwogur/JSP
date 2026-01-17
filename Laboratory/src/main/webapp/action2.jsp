<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String equip_no = request.getParameter("equip_no");
	String use_yn = request.getParameter("use_yn");
	
	String sql = "update tbl_lab_equip_001 set use_yn = ? where equip_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, use_yn);
	stmt.setString(2, equip_no);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("toolList.jsp");
	}
	
	stmt.close();
	con.close();
%>