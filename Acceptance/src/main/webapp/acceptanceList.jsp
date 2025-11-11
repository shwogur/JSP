<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select name, substr(regist_num,1,6)||'-'||substr(regist_num,7,7), university_name, major_name, s_score, n_score, total_score, row_number() over (order by total_score desc) "
			   + " from tbl_university u, tbl_major m, tbl_apply a "
  			   + " where u.university_code = a.university_code "
			   + " and m.major_code = a.major_code";


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
		<h2>원서 접수 조회</h2>
		<table>
			<tr>
				<th>이름</th>
				<th>주민번호</th>
				<th>학교</th>
				<th>학과</th>
				<th>수능점수</th>
				<th>내신점수</th>
				<th>총점</th>
				<th>순위</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="right"><%=rs.getString(5) %></td>
				<td align="right"><%=rs.getString(6) %></td>
				<td align="right"><%=rs.getString(7) %></td>
				<td align="center"><%=rs.getString(8) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>