<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select distinct p.p_city, decode(p_city,'10','서울','20','경기','30','강원','40','대구'), count(p.p_city) "
			   + " from tbl_patient_202004 p, tbl_result_202004 r "
			   + " where p.p_no = r.p_no "
			   + " group by p_city "
 			   + " order by 1 asc";


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
		<h2>(지역별)검사건수통계</h2>
		<table>
			<tr>
				<th>지역코드</th>
				<th>지역명</th>
				<th>검사건수</th>
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