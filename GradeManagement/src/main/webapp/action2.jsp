<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sdate = request.getParameter("sdate");
	String semester = request.getParameter("semester");
	String id = request.getParameter("id");
	String sno = request.getParameter("sno");
	String stype = request.getParameter("stype");
	String score = request.getParameter("score");

	String sql = "insert into score values(?, ?, ?, ?, ?, ?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, id);
	stmt.setString(2, sno);
	stmt.setString(3, sdate);
	stmt.setString(4, semester);
	stmt.setString(5, stype);
	stmt.setInt(6, Integer.parseInt(score));
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	stmt.close();
	con.close();
%>