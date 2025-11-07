<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select s.pk_sale, substr(s.deal_date,1,2)||'-'||substr(s.deal_date,4,2)||'-'||substr(s.deal_date,7,2), deal_count||'개', name "
			   + " from tbl_sale s, tbl_bread b "
			   + " where pk_bread = fk_bread "
			   + " order by 1";

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
		<h2>제과현황</h2>
		<table>
			<tr>
				<th>판매코드</th>
				<th>판매일</th>
				<th>판매수량</th>
				<th>제과명</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="left"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="right"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
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