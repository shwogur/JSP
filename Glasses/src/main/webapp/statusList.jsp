<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select rank() over (order by to_char(men.p_price *  o.amount, 'fm999,999,999') asc), men.p_code, men.p_name, o.amount, to_char(men.p_price *  o.amount, 'fm999,999,999') " 
			   + " from tbl_menu_01 men "
			   + " join tbl_order_01 o "
			   + " on men.p_code = o.p_code";

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
		<h2>상품별 매출 현황 페이지</h2>
		<table>
			<tr>
				<th>순위</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>총판매수량</th>
				<th>총매출액</th>
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
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>