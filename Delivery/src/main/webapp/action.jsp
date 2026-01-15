<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<% 
	
	String ship_no = request.getParameter("ship_no");
	String recv_nm = request.getParameter("recv_nm");
	String ship_dt = request.getParameter("ship_dt").replace("-", "");
	String address = request.getParameter("address");
	String ship_st = request.getParameter("ship_st");
	
	String sql = "insert into tbl_delivery_001 values(?,?,?,?,0)";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, ship_no);
	stmt.setString(2, recv_nm);
	stmt.setString(3, ship_dt);
	stmt.setString(4, address);

	if(stmt.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	
	stmt.close();
	con.close();
%>