<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String res_id = request.getParameter("res_id");
	String cust_id = request.getParameter("cust_id");
	String cust_name = request.getParameter("cust_name");
	String movie_id = request.getParameter("movie_id");
	String res_date = request.getParameter("res_date");
	String seat_no = request.getParameter("seat_no");
	
	String sql = "update tbl_reservation set movie_id = ?, res_date = ?, seat_no = ? where res_id = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, movie_id);
	stmt.setString(2, res_date);
	stmt.setString(3, seat_no);
	stmt.setString(4, res_id);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("index.jsp");
	}
%>