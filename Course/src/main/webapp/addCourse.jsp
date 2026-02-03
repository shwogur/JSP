<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select max(regist_no) +1 from tbl_class_2026";

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
		<h2>수강 신청</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<%
				while(rs.next()){
				%>
				<tr>
					<th>수강번호(자동채번)</th>
					<td><input name="regist_no" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				%>
				<tr>
					<th>신청날짜</th>
					<td><input type="date" name="regist_date"></td>
				</tr>
				<tr>
					<th>학번</th>
					<td><input name="student_id"></td>
				</tr>
				<tr>
					<th>강의 코드</th>
					<td><input name="course_code"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="reset" value="다시쓰기">
						<input type="submit" value="신청하기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>