<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select product_name, category, stock_qty||'개' from tbl_product";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2></h2>
		<table>
			<tr>
				<th>상품명</th>
				<th>분류</th>
				<th>재고수량</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>