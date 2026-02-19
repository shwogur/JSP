<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale = request.getParameter("sale");

	String sql = "select s.sale, c.cafe_name, d.drink_name, s.quantity from tbl_cafe_001 c join tbl_sale_001 s on c.cafe_id = s.cafe_id join tbl_drink_001 d on d.drink_id = s.drink_id where s.sale = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, sale);
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
		<h2>예약 수정</h2>
		<form action="action2.jsp" name="form" method="post">
		<table>
		<%
		if(rs.next()){
		%>
		<tr>
			<input type="hidden" name="sale" value="<%=rs.getString(1) %>">
		</tr>
		<tr>
			<th>카페</th>
			<td><input value="<%=rs.getString(2) %>" readonly></td>
		</tr>
		<tr>
			<th>음료명</th>
			<td><input value="<%=rs.getString(3) %>" readonly></td>
		</tr>
		<tr>
			<th>수량</th>
			<td><input name="quantity" value="<%=rs.getString(4) %>"></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="submit" value="수정"></td>
		</tr>
		<%
		}
		%>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>