<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String card_no = request.getParameter("card_no");
	String user_nm = request.getParameter("user_nm");
	String issue_dt = request.getParameter("issue_dt");
	String dept = request.getParameter("dept");
	String enter_yn = request.getParameter("enter_yn");
	
	String sql = "insert into tbl_card_001 values(?,?,?,?,1)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, card_no);
	stmt.setString(2, user_nm);
	stmt.setString(3, issue_dt);
	stmt.setString(4, dept);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	
	stmt.close();
	con.close();
%>