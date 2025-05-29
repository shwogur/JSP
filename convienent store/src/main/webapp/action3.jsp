<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String goods_cd = request.getParameter("goods_cd");
	String goods_nm = request.getParameter("goods_nm");
	String goods_price = request.getParameter("goods_price");
	String cost = request.getParameter("cost");
	String in_date= request.getParameter("in_date");

	Connection conn = DBConnector.getConnection();
	String sql = "update goods_tbl_003 set goods_nm = ?, goods_price = ?, cost = ? where goods_cd = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);

	stmt.setString(1, goods_nm);
	stmt.setString(2, goods_price);
	stmt.setString(3, cost);
	stmt.setString(4, goods_cd);
	
	ResultSet rs = stmt.executeQuery();
	
	response.sendRedirect("manageGoods.jsp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>