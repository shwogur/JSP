<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select to_char(goods_sq.nextval, 'fm000000') from dual";
	
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
	sql = "select to_char(sysdate, 'yyyy-mm-dd') from dual";
	
	PreparedStatement stmt2 = conn.prepareStatement(sql);
	ResultSet rs2 = stmt2.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file = "./header.jsp" %>
	<%@ include file = "./nav.jsp" %>
	<section>
		<h1>상품정보 등록</h1>
		<form action="action2.jsp" name="action2" method="post"></form>
		<table border="1">
			<%
			while(rs.next()){
			%>
			<tr>
				<th>상품코드(자동채번)</th>
				<td><input type="text" name="goods_cd" value="<%=rs.getString(1) %>"></td>
			</tr>
			<%
			}
			%>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="goods_nm"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="goods_price"></td>
			</tr>
			<tr>
				<th>원가</th>
				<td><input type="text" name="cost"></td>
			</tr>
			<%
			while(rs2.next()){
			%>
			<tr>
				<th>입고일자(변경불가)</th>
				<td><input type="date" name="in_date" value="<%=rs2.getString(1) %>"></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
					<input type="button" value="상품목록" onclick='location.href="manageGoods.jsp"'>
				</td>
			</tr>
		</table>
	</section>
	<%@ include file = "./footer.jsp" %>
</body>
</html>