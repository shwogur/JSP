<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select equip_id, equip_name from tbl_equipment_001";

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
		<h2>장비 예약 상세</h2>
		<form action="resDetail.jsp" name="form" method="get">
			<table>
				<tr>
					<th>장비</th>
					<td><select name="equip_id">
					<option value="0">선택안함</option>
					<%
					while(rs.next()){
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					<%
					}
					%>
					</select></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="검색"></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>