<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String student_id = request.getParameter("student_id");
	String student_code = request.getParameter("student_code");
	String mid = request.getParameter("mid");
	String finall = request.getParameter("finall");
	String attend = request.getParameter("attend");
	String report = request.getParameter("report");
	String etc = request.getParameter("etc");
	
	String sql = "insert into tbl_grade_202409 values(?,?,?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, student_id);
	stmt.setString(2, student_code);
	stmt.setString(3, mid);
	stmt.setString(4, finall);
	stmt.setString(5, attend);
	stmt.setString(6, report);
	stmt.setString(7, etc);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>