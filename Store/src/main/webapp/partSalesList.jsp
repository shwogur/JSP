<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select w.worker_name, sum(s.sale_qty)||'개', to_char(sum(s.sale_qty*p.price), 'fm999,999,999')||'원' "
			   + " from tbl_product p, tbl_worker w, tbl_sales s "
			   + " where p.product_id = s.product_id "
			   + " and w.worker_id = s.worker_id "
			   + " group by w.worker_name "
			   + " order by 3 asc";

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
		<h2>알바생별 매출 현황</h2>
		<table>
			<tr>
				<th>알바생 이름</th>
				<th>판매수량</th>
				<th>총 매출금액</th>
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