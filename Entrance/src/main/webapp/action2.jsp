<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String card_no = request.getParameter("card_no");
	String enter_yn = request.getParameter("enter_yn");

	String sql = "update tbl_card_001 set enter_yn = ? where card_no = ?";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, enter_yn);
	stmt.setString(2, card_no);
	
	stmt.executeUpdate();
	
	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	
	stmt.close();
	con.close();
%>