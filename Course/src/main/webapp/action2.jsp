<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String regist_no = request.getParameter("regist_no"); 
	String course_code = request.getParameter("course_code"); 
	
	String sql = "update tbl_class_2026 set course_code = ? where regist_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, course_code);
	stmt.setString(2, regist_no);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("courseList.jsp");
	}
%>