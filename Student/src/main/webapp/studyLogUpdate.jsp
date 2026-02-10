<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String log_id = request.getParameter("log_id");

	String sql = "select s.student_name, lo.log_id, lo.study_time, lo.focus_score "
			   + " from tbl_student_001 s "
			   + " join tbl_study_log lo "
			   + " on s.student_id = lo.student_id "
			   + " where lo.log_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, log_id);
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
		<h2>학습 기록 수정</h2>
		<form action="action2.jsp" name="form" method="get">
			<table>
				<%
				while(rs.next()){
				%>
				<tr>
					<th>학생명</th>
					<td><input name="student_name" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>기록번호</th>
					<td><input name="log_id" value="<%=rs.getString(2) %>" readonly></td>
				</tr>
				<tr>
					<th>학습 시간</th>
					<td><input name="study_time" value="<%=rs.getString(3) %>"></td>
				</tr>
				<tr>
					<th>집중도 점수</th>
					<td><input name="focus_score" value="<%=rs.getString(4) %>"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="수정"></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				%>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>