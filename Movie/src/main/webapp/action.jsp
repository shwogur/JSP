<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String movie_no = request.getParameter("movie_no");
	String movie_name = request.getParameter("movie_name");
	String open_dt = request.getParameter("open_dt").replace("-", "");
	String genre = request.getParameter("genre");
	String show_yn = request.getParameter("show_yn");
	
	String sql = "insert into tbl_movie_01 values(?,?,?,?,0)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, movie_no);
	stmt.setString(2, movie_name);
	stmt.setString(3, open_dt);
	stmt.setString(4, genre);
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
%>