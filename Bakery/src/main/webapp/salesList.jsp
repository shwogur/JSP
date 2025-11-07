<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select ba.name, ba.address, ba.etc, sum(s.deal_count)||'개', '￦'||to_char(sum(to_number(br.price) * s.deal_count), 'fm999,999,999') "
			   + " from tbl_bakery ba, tbl_bread br, tbl_sale s "
			   + " where ba.pk_bakery = s.fk_bakery "
			   + " and br.pk_bread = s.fk_bread " 
			   + " group by  ba.name, ba.address, ba.etc";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재과점 매출관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>매출현황</h2>
		<table>
			<tr>
				<th>제과점명</th>
				<th>지역</th>
				<th>설명</th>
				<th>판매수량</th>
				<th>매출</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="left"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="left"><%=rs.getString(3) %></td>
				<td align="right"><%=rs.getString(4) %></td>
				<td align="right"><%=rs.getString(5) %></td>
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