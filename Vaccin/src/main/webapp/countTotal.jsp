<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select h.hospcode, h.hospname, count(v.hospcode) "
			   + " from tbl_hosp_202108 h, tbl_vaccresv_202108 v "
			   + " where h.hospcode = v.hospcode "
			   + " group by h.hospcode, h.hospname "
			   + " order by 1 asc ";
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>병원별 접종건수 통계</h2>
			<table>
				<tr>
					<th>병원코드</th>
					<th>병원명</th>
					<th>접종건수</th>
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
				rs.close();
				stmt.close();
				con.close();
				%>
			</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>