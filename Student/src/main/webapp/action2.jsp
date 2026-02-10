<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String log_id = request.getParameter("log_id");
	String study_time = request.getParameter("study_time");
	String focus_score = request.getParameter("focus_score");
	
	String sql = "update tbl_study_log set study_time = ?, focus_score = ? where log_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, study_time);
	stmt.setString(2, focus_score);
	stmt.setString(3, log_id);
	
	int result = stmt.executeUpdate();
	if(result > 0){
		response.sendRedirect("index.jsp");
	}
%>