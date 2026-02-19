<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select d.drink_name, sum(d.price * s.quantity) "
			   + " from tbl_cafe_001 c "
			   + " join tbl_sale_001 s "
			   + " on c.cafe_id = s.cafe_id "
			   + " join tbl_drink_001 d "
			   + " on d.drink_id = s.drink_id "
			   + " group by d.drink_name "
			   + " having sum(d.price * s.quantity) > avg(d.price * s.quantity)";

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
		<h2>평균 매출 초과 음료</h2>
		<table>
			<tr>
				<th>음료명</th>
				<th>총 매출액</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>