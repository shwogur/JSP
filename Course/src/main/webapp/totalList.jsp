<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select rank() over (order by count(cl.regist_no) desc), co.course_code, co.course_name, co.professor, count(cl.regist_no) "
			   + " from tbl_course_2026 co "
			   + " left join tbl_class_2026 cl "
			   + " on co.course_code = cl.course_code "
			   + " group by co.course_code, co.course_name, co.professor "
			   + " order by count(cl.regist_no) desc";
	
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
		<h2>강의별 전체 신청 현황</h2>
		<table>
			<tr>
				<th>순위</th>
				<th>강의코드</th>
				<th>강의명</th>
				<th>담당교수</th>
				<th>총 신청건수</th>
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