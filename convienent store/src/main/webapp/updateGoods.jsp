<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	
	String goods_cd = request.getParameter("goods_cd");
	
	String sql = "select goods_cd, goods_nm, goods_price, cost, to_char(in_date, 'yyyy-mm-dd') from goods_tbl_003 where goods_cd = ?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, goods_cd);
	
	ResultSet rs = stmt.executeQuery();
	
	if(rs.next()){
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
		<h1>상품정보 변경</h1>
		<form action="action3.jsp" name="action3" method="post">
		<table border="1">
			<tr>
				<th>상품코드(변경불가)</th>
				<td><input type="text" name="goods_cd" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="goods_nm" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="goods_price" value="<%=rs.getString(3) %>"></td>
			</tr>
			<tr>
				<th>원가</th>
				<td><input type="text" name="cost" value="<%=rs.getString(4) %>"></td>
			</tr>
			<tr>
				<th>입고일자(변경불가)</th>
				<td><input type="text" name="in_date" value="<%=rs.getString(5) %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
					<input type="button" value="상품목록" onclick='location.href="updateGoods.jsp"'>
				</td>
			</tr>
		</table>
		<%
		}
		%>
		</form>
	</section>
	<%@ include file = "./footer.jsp" %>
</body>
</html>