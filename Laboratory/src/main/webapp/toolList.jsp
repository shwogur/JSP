<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select b.equip_no, b.equip_name, a.lab_name, case when b.use_yn = '1' then '사용중' when b.use_yn = '0' then '미사용' end from tbl_lab_001 a, tbl_lab_equip_001 b where a.lab_no = b.lab_no";

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
			<h2>사용현황</h2>
			<table>
				<tr>
					<th>장비번호</th>
					<th>장비명</th>
					<th>실험실명</th>
					<th>사용여부</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td align="center"><a href="toolUpdate.jsp?equip_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td align="center"><%=rs.getString(2) %></td>
					<td align="center"><%=rs.getString(3) %></td>
					<td align="center"><%=rs.getString(4) %></td>
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