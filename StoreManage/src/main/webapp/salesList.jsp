<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select substr(to_char(s.sales_date, 'yyyymmdd'),1,4)||'년 '||substr(to_char(s.sales_date, 'yyyymmdd'),5,2)||'월 '||substr(to_char(s.sales_date, 'yyyymmdd'),7,2)||'일', p.product_name, s.sales_qty||'개', to_char(p.price, 'fm999,999,999')||'원', to_char((s.sales_qty * p.price), 'fm999,999,999')||'원', round(s.sales_qty*100 / (select sum(sales_qty) from tbl_sales),2)||'%' "
			   + " from tbl_product p "
			   + " join tbl_sales s "
			   + " on p.product_id = s.product_id";

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
		<h2>매출 조회</h2>
		<table>
			<tr>
				<th>판매일자</th>
				<th>상품명</th>
				<th>판매수량</th>
				<th>단가</th>
				<th>판매금액</th>
				<th>상품별 판매율</th>
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
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>