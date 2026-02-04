<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String p_no = request.getParameter("p_no");
	String t_code = request.getParameter("t_code");
	String t_sdate = request.getParameter("t_sdate");
	String t_status = request.getParameter("t_status");
	String t_ldate = request.getParameter("t_ldate");
	String t_result = request.getParameter("t_result");
	
	String sql = "insert into tbl_result_202004 values(?,?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, p_no);
	stmt.setString(2, t_code);
	stmt.setString(3, t_sdate);
	stmt.setString(4, t_status);
	stmt.setString(5, t_ldate);
	stmt.setString(6, t_result);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>