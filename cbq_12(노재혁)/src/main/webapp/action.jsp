<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String company_code = request.getParameter("company_code");
	String item_code = request.getParameter("item_code");
	String item_one = request.getParameter("item_one");
	String item_two = request.getParameter("item_two");
	String item_three = request.getParameter("item_three");
	String item_four = request.getParameter("item_four");
	String item_five = request.getParameter("item_five");
	
	String sql = "insert into tbl_esg_evaluation values(?,?,?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, company_code);
	stmt.setString(2, item_code);
	stmt.setString(3, item_one);
	stmt.setString(4, item_two);
	stmt.setString(5, item_three);
	stmt.setString(6, item_four);
	stmt.setString(7, item_five);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("addCompany.jsp");
	}
%>