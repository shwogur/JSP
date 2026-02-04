<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select p_no, p_name, substr(p_birth,1,4)||'년'||substr(p_birth,5,2)||'월'||substr(p_birth,7,2)||'일', decode(p_gender,'M','남','F','여'),p_tel1||'-'||p_tel2||'-'||p_tel3, decode(p_city,'10','서울','20','경기','30','강원','40','대구') from tbl_patient_202004";

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
		<h2>환자조회</h2>
		<table>
			<tr>
				<th>환자번호</th>
				<th>환자성명</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>지역</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
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