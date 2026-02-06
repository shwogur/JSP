<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select a.animal_no, a.animal_name, to_char(to_date(a.rescue_dt), 'yyyy-mm-dd'), to_date(sysdate) - to_date(a.rescue_dt), s.shelter_name, decode(a.protect_yn,'1','입양완료','0','보호중') "
			   + " from tbl_shelter_001 s "
			   + " join tbl_animal_001 a "
			   + " on s.shelter_no = a.shelter_no";

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
		<h2>보호현황</h2>
		<table>
			<tr>
				<th>동물번호</th>
				<th>동물명</th>
				<th>구조일</th>
				<th>보호기간</th>
				<th>보호소명</th>
				<th>보호상태</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><a href="protectUpdate.jsp?animal_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
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