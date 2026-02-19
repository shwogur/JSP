<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select s.sale, c.cafe_name, d.drink_name, d.price, s.quantity, d.price * s.quantity "
			   + " from tbl_cafe_001 c "
			   + " join tbl_sale_001 s "
			   + " on c.cafe_id = s.cafe_id "
			   + " join tbl_drink_001 d "
			   + " on d.drink_id = s.drink_id order by 1";

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
		<h2>전체 판매 내역</h2>
		<table>
			<tr>
				<th>판매번호</th>
				<th>지점명</th>
				<th>음료명</th>
				<th>단가</th>
				<th>수량</th>
				<th>매출액</th>
				<th>매출 수정</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center"><a href="salesUpdate.jsp?sale=<%=rs.getString(1) %>">수정</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>