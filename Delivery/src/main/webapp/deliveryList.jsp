<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select ship_no, recv_nm, substr(ship_dt,1,4)||'-'||substr(ship_dt,5,2)||'-'||substr(ship_dt,7,2), address, case when ship_st = '1' then '배송완료' when ship_st = '0' then '배송중' else '2' end from tbl_delivery_001";

	
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
		<h2>배송현황</h2>
		<table>
			<tr>
				<th>배송번호</th>
				<th>수령인</th>
				<th>배송일</th>
				<th>배송지</th>
				<th>배송상태</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td align="center"><a href="deliveryUpdate.jsp?ship_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
			</tr>
			<%
			}
			stmt.close();
			con.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>