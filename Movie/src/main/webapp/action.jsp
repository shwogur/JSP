<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String res_id = request.getParameter("res_id");
	String cust_id = request.getParameter("cust_id");
	String movie_id = request.getParameter("movie_id");
	String res_date = request.getParameter("res_date");
	String seat_no = request.getParameter("seat_no");
	
	String sql = "insert into tbl_reservation values(?,?,?,?,?)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, res_id);
	stmt.setString(2, cust_id);
	stmt.setString(3, movie_id);
	stmt.setString(4, res_date);
	stmt.setString(5, seat_no);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>