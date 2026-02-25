<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select sa.scode, sname, '\'||to_char(sum(cost * amount), 'fm999,999,999') from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode group by sa.scode, sname order by 1";	

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
		<h2>지점별 매출 현황</h2>
		<table>
			<tr>
				<th>지점 코드</th>
				<th>지점 명</th>
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