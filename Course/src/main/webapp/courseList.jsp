<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select cl.regist_no, cl.student_id, s.student_name, co.course_name, co.professor, co.course_credit, to_char(cl.regist_date, 'yyyy-mm-dd') " 
			   + " from tbl_course_2026 co, tbl_student_2026 s, tbl_class_2026 cl "
			   + " where co.course_code = cl.course_code "
			   + " and s.student_id = cl.student_id";

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
		<h2>수강 신청 현황</h2>
		<table>
			<tr>
				<th>수강번호</th>
				<th>학번</th>
				<th>성명</th>
				<th>신청과목</th>
				<th>담당교수</th>
				<th>학점</th>
				<th>신청일</th>
				<th>관리</th>
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
				<td align="center"><%=rs.getString(7) %></td>
				<td align="center"><a href="courseUpdate.jsp?regist_no=<%=rs.getString(1) %>">[수정]</a>/<a href="delete.jsp?regist_no=<%=rs.getString(1) %>" onclick="return confirm('정말 삭제하시겠습니까?')">[삭제]</a></td>
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