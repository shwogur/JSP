<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String equip_no = request.getParameter("equip_no");
	String equip_name = request.getParameter("equip_name");
	String lab_name = request.getParameter("lab_name");
	String use_yn = "0";
	
	String sql = "insert into tbl_lab_equip_001 values(?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, equip_no);
	stmt.setString(2, equip_name);
	stmt.setString(3, lab_name);
	stmt.setString(4, use_yn);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("toolList.jsp");
	}
	
	stmt.close();
	con.close();
%>