<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select e.equip_name, e.location, count(r.equip_id)||'건' "
			   + " from tbl_equipment_001 e "
			   + " join tbl_reservation_001 r "
			   + " on e.equip_id = r.equip_id "
			   + " group by e.equip_name, e.location "
			   + " order by 1";

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
		<h2>장비 예약 현황 목록</h2>
		<table>
			<tr>
				<th>장비명</th>
				<th>위치</th>
				<th>예약건수</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>