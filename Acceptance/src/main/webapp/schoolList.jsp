<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select u.university_code, u.university_name, count(u.university_name), to_char(round(avg(a.total_score), 1), '999.0') "
    		   + " from tbl_university u, tbl_apply a "
			   + " where u.university_code = a.university_code "
			   + " group by u.university_code, u.university_name "
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
		<h2>학교별 통계</h2>
		<table>
			<tr>
				<th>학교코드</th>
				<th>학교명</th>
				<th>지원 인원</th>
				<th>총점 평균</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="right"><%=rs.getString(4) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>