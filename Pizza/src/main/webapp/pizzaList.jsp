<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select sa.pcode, pname, '\'||to_char(sum(cost * amount), 'fm999,999,999') from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode group by sa.pcode, pname order by sum(cost * amount) desc";	

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
	<%@include file="footer.jsp" %>
	<section>
		<h2>상품별 매출 현황</h2>
		<table>
			<tr>
				<th>피자 코드</th>
				<th>피자 명</th>
				<th>총매출액</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center">₩<%=rs.getString(3) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>