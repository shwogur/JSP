<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String log_id = request.getParameter("log_id");
	String student_id = request.getParameter("student_id");
	String study_time = request.getParameter("study_time");
	String focus_score = request.getParameter("focus_score");
	
	String sql = "insert into tbl_study_log values(?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, log_id);
	stmt.setString(2, student_id);
	stmt.setString(3, study_time);
	stmt.setString(4, focus_score);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>