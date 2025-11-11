<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select university_code, university_name, substr(phone_num,1,3)||'-'||substr(phone_num,4,4)||'-'||substr(phone_num,8,4) from tbl_university";

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
		<h2>대학 조회</h2>
		<table>
			<tr>
				<th>대학코드</th>
				<th>학교명</th>
				<th>전화번호</th>
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