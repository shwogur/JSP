<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String movie_no = request.getParameter("movie_no");
	String show_yn = request.getParameter("show_yn");
	
	String sql = "update tbl_movie_01 set show_yn = ? where movie_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, show_yn);
	stmt.setString(2, movie_no);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("movieList.jsp");
	}
%>