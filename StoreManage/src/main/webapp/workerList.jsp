<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select w.worker_name, sum(s.sales_qty)||'개', to_char(sum(s.sales_qty * p.price), 'fm999,999,999')||'원', round(sum(s.sales_qty)*100 / (select sum(sales_qty) from tbl_sales),2)||'%' "
			   + " from tbl_product p join tbl_sales s on p.product_id = s.product_id join tbl_worker w on w.worker_id = s.worker_id group by w.worker_name order by 1 ";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select to_char(sum(s.sales_qty * p.price), 'fm999,999,999')||'원' from tbl_product p join tbl_sales s on p.product_id = s.product_id";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
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
		<h2>알바생별 매출 현황</h2>
		<table>
			<tr>
				<th>알바생 이름</th>
				<th>판매수량</th>
				<th>총 매출금액</th>
				<th>알바생별 매출율</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
			</tr>
			<%
			}
			%>
			<tr>
				<th>총 매출현황</th>
				<%
				while(rs1.next()){
				%>
				<td align="center" colspan="3"><%=rs1.getString(1) %></td>
				<%
				}
				%>
			</tr>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>