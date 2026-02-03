<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	int regist_no = Integer.parseInt(request.getParameter("regist_no"));
	String date = request.getParameter("regist_date");
	String student_id = request.getParameter("student_id");
	String course_code = request.getParameter("course_code");
	
	String sql = "insert into tbl_class_2026 values(?,to_date(?, 'yyyy-mm-dd'),?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setInt(1, regist_no);
	stmt.setString(2, date);
	stmt.setString(3, student_id);
	stmt.setString(4, course_code);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("courseList.jsp");
	}
%>