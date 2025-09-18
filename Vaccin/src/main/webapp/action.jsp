<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="vaccine.RestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	//resvno 받아오기
	String resvno = request.getParameter("resvno");
	String jumin = request.getParameter("jumin");
	String vcode = request.getParameter("vcode");
	String hospcode = request.getParameter("hospcode");
	String resvdate = request.getParameter("resvdate");
	String resvtime = request.getParameter("resvtime");
	
	String sql = "insert into tbl_vaccresv_202108 values(?, ?, ?, ?, ?, ?)";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, resvno);
	stmt.setString(2, jumin);
	stmt.setString(3, vcode);
	stmt.setString(4, hospcode);
	stmt.setString(5, resvdate);
	stmt.setString(6, resvtime);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("regestCheck.jsp");
	}
%>